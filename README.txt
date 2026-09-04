SPORTS DAIRO — PEDIDOS + RASTREO CON SUPABASE

Incluye:
- index.html
- config.js
- supabase.sql
- logo.png
- zapatilla-urb.jpg

QUÉ HACE:
1. El cliente hace un pedido.
2. Se guarda en Supabase con código SD-AAAA-XXXXXX.
3. Se abre WhatsApp con el código del pedido.
4. El cliente entra en "Rastrear pedido" y consulta por código.
5. El administrador cambia el estado.
6. El estado se sincroniza con la base de datos.

ACTIVACIÓN:
1. Crea un proyecto en Supabase.
2. En SQL Editor pega TODO el contenido de supabase.sql y pulsa Run.
3. Ve a Project Settings > API.
4. Copia Project URL y Publishable key.
5. Pégalos en config.js:
   SUPABASE_URL = "...";
   SUPABASE_PUBLISHABLE_KEY = "...";
6. Sube los 3 archivos web (index.html, config.js) + logo.png + zapatilla-urb.jpg a GitHub.
7. No pongas nunca una service_role/secret key en config.js.

ADMIN:
La versión actual conserva el acceso visual admin anterior. Para seguridad real,
el siguiente paso es cambiar ese acceso por Supabase Auth (usuario administrador
autenticado), porque una contraseña escrita dentro de index.html puede ser vista
por quien inspeccione el código.

NOTA:
La base de datos y el rastreo sí quedan preparados para uso real. El plan Free
de Supabase tiene límites de uso; no es ilimitado.
