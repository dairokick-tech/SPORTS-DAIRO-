SPORTS DAIRO — TIENDA CON CATEGORÍAS, BUSCADOR, SUPABASE Y PAGOS

Incluye:
- Tienda pública con categorías: Zapatillas, Ropa y Accesorios.
- Buscador por nombre/categoría.
- 20 productos de zapatillas cargados.
- Registro de productos desde Admin con categoría e imagen opcional.
- Pedidos por WhatsApp al +51 928 469 185.
- Pedidos guardados en Supabase.
- Rastreo público por código de pedido.
- Yape/Plin manual al 928 469 185.
- NUEVO: opción Tarjeta Visa/Mastercard mediante checkout web de izipay.
- Carpeta supabase/functions/izipay-session/ preparada para generar el token de sesión desde backend.

PAGO CON TARJETA IZYPAY
La integración usa el SDK web oficial de izipay. Izipay indica que el token de sesión debe generarse desde un backend y que el checkout usa una llave pública/RSA y un token de sesión. No pongas API keys secretas en el navegador.

ESTADO DE ESTA ENTREGA
La tienda ya tiene el botón "Visa / Mastercard" y el flujo preparado. Para COBRAR DE VERDAD falta afiliar el comercio a izipay y colocar las credenciales/endpoint de Generate Token en los secrets de una Edge Function de Supabase. No se inventan ni se exponen credenciales.

PASOS PARA ACTIVAR
1. Tener comercio/credenciales de izipay.
2. En Supabase, desplegar la función supabase/functions/izipay-session.
3. Configurar como secrets: IZIPAY_TOKEN_URL, IZIPAY_API_KEY, IZIPAY_MERCHANT_CODE e IZIPAY_KEY_RSA.
4. Ajustar el body/headers de la función al formato exacto que entregue izipay para tu comercio y ambiente.
5. Probar primero en sandbox y luego cambiar a producción.

DOCUMENTACIÓN OFICIAL:
https://developers.izipay.pe/web-core/quickstart/
https://developers.izipay.pe/products/pay-with-card/
https://developers.izipay.pe/credentials/
https://developers.izipay.pe/api/

SUPABASE
config.js usa la URL del proyecto y la Publishable Key. No colocar nunca una secret/service_role key en el navegador.

IMPORTANTE
El login admin incluido sigue siendo del lado del navegador. Para producción se recomienda Supabase Auth y RLS restringido por rol.


YAPE POR CÓDIGO DE APROBACIÓN
La tienda ahora usa el SDK Web de izipay con payMethod YAPE_CODE. Al elegir Yape, el total del pedido se envía al checkout de izipay y el cliente ingresa allí su número vinculado a Yape y su código de aprobación. Según la documentación oficial de izipay, esta modalidad es exclusiva del SDK y el monto máximo indicado es S/ 2,000.
IMPORTANTE: para cobrar en producción todavía debe existir la Edge Function segura `izipay-session` en Supabase y las credenciales de comercio de izipay deben estar configuradas como secretos del backend. No pongas claves secretas en `config.js` ni en GitHub.
