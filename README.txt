SPORTS DAIRO - versión mejorada

Mejoras principales:
- Carrito multi-producto real con talla, cantidad, combinación por producto+talla y persistencia.
- Checkout de carrito completo con Yape y constancia.
- WhatsApp directo para carrito, productos, pedidos y comprobantes.
- Compras actualizan stock cuando se selecciona un producto existente.
- Editar y eliminar productos, ventas, compras, clientes y comprobantes.
- Gestión de pedidos con estados, pago, agencia, seguimiento y comprobante de envío.
- Créditos con cuotas y registro de pagos.
- Dashboard y contabilidad resumida.
- Backup JSON.
- Logo como favicon y logo visible.

Credenciales admin:
Usuario: admin
Contraseña: Dairo2026!

Importante: el comprobante generado es de gestión. Para validez fiscal se requiere integración SUNAT/OSE/PSE.

FACTURACIÓN ELECTRÓNICA OSE/PSE
- Se agregó la Edge Function supabase/functions/emitir-comprobante.
- Se agregó la migración supabase/migrations/20260904_facturacion_electronica.sql.
- La RUTA y TOKEN de NubeFacT deben configurarse como secretos de Supabase, nunca en el navegador.
- La emisión fiscal requiere además el RUC emisor y una cuenta/ruta/token activos del proveedor.
