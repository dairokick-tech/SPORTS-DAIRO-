# SPORTS DAIRO — versión corregida

Versión preparada para subir a GitHub Pages.

## Incluye
- Tienda y catálogo
- Carrito multi-producto
- Pago únicamente por Yape
- QR y comprobante de pago
- Pedidos y rastreo
- Olva Courier / Shalom
- Clientes, ventas, compras y créditos
- Facturas/boletas de gestión
- Configuración Supabase
- Respaldo local

## Corrección importante
Se eliminó la opción de **Restablecer datos** que borraba `localStorage`. La versión final no incluye esa función destructiva.

Las migraciones de Supabase son incrementales y usan `CREATE TABLE IF NOT EXISTS` / `ADD COLUMN IF NOT EXISTS`. No deben ejecutarse comandos `DROP`, `TRUNCATE` o borrados masivos sobre producción.

## Publicación
Sube `index.html`, `config.js`, `logo.png`, `qr-yape.png` y `zapatilla-urb.jpg` al repositorio de GitHub Pages, manteniendo las rutas.

## Seguridad
La clave configurada en `config.js` es una clave publicable. Nunca coloques una `service_role` key en el navegador. Para producción, protege el panel administrativo con Supabase Auth y configura RLS correctamente.
