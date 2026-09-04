-- SPORTS DAIRO - Base de datos de pedidos y rastreo
-- Ejecutar en Supabase > SQL Editor.
create extension if not exists pgcrypto;

create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  order_code text unique not null,
  customer_name text not null,
  product text not null,
  size text not null,
  quantity integer not null check (quantity > 0),
  unit_price numeric(10,2) not null default 0,
  status text not null default 'Nuevo'
    check (status in ('Nuevo','Confirmado','Preparando','Enviado','Entregado','Cancelado')),
  tracking_number text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end $$;

drop trigger if exists orders_updated_at on public.orders;
create trigger orders_updated_at
before update on public.orders
for each row execute function public.set_updated_at();

alter table public.orders enable row level security;

-- Cliente: puede crear pedidos.
drop policy if exists "public can create orders" on public.orders;
create policy "public can create orders"
on public.orders for insert
to anon, authenticated
with check (true);

-- El cliente NO obtiene acceso directo a todas las filas.
revoke select, update, delete on public.orders from anon;

-- Función pública de rastreo: devuelve únicamente datos de un pedido por código.
create or replace function public.track_order(p_code text)
returns table (
  order_code text,
  customer_name text,
  product text,
  quantity integer,
  status text,
  tracking_number text,
  updated_at timestamptz
)
language sql
security definer
set search_path = public
as $$
  select o.order_code, o.customer_name, o.product, o.quantity,
         o.status, o.tracking_number, o.updated_at
  from public.orders o
  where upper(o.order_code) = upper(trim(p_code))
  limit 1;
$$;

revoke all on function public.track_order(text) from public;
grant execute on function public.track_order(text) to anon, authenticated;

-- El administrador autenticado podrá consultar/actualizar pedidos.
grant select, update on public.orders to authenticated;

drop policy if exists "admin can manage orders" on public.orders;
create policy "admin can manage orders"
on public.orders for select
to authenticated
using (true);

drop policy if exists "admin can update orders" on public.orders;
create policy "admin can update orders"
on public.orders for update
to authenticated
using (true)
with check (true);

-- IMPORTANTE:
-- Para producción conviene restringir las políticas authenticated a un rol/perfil
-- de administrador mediante una tabla profiles y auth.uid().
