SPORTS DAIRO — método de pago Yape corregido

Archivos:
- index.html
- config.js
- qr-yape.png
- zapatilla-urb.jpg

Flujo de pago:
1. Cliente elige Yape.
2. Se muestra el QR correcto, número y titular.
3. Se calcula y muestra el total exacto.
4. Cliente marca que pagó.
5. Cliente adjunta la constancia (imagen/PDF, máximo 5 MB).
6. El pedido queda "Por verificar".
7. Se abre WhatsApp para confirmar el pedido.
8. Administrador puede revisar la constancia y verificar el pago.

IMPORTANTE:
- WhatsApp no permite que una página web adjunte automáticamente un archivo al chat por seguridad del navegador; el cliente puede tener que seleccionar nuevamente la misma constancia en WhatsApp.
- El código intenta guardar la constancia en Supabase Storage usando el bucket "payment-proofs". Si ese bucket no existe o las políticas RLS no permiten subir archivos, el pedido sigue funcionando localmente, pero para ver la constancia desde otro dispositivo debes crear ese bucket y sus políticas.
- No pongas credenciales privadas de Supabase/SUNAT en el HTML.
