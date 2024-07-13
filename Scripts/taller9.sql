/*Consulte toda la información relacionada a los índices que se han creado para su sesión.
Cree además un índice llamado "idx_pedido_cliente_sucursal" en la tabla "PEDIDO" basado
en las columnas "CLIID" y "SUCID". Esto para acelerar las consultas que involucren
búsquedas o filtrado por el cliente y la sucursal en un pedido. */


SELECT * FROM ALL_INDEXES WHERE OWNER = 'DAVID';

CREATE INDEX idx_pedido_cliente_sucursal ON Pedido (CLIID,SUCID);

--Selecciona el nombre del cliente , la direccion , el nombre de la sucursal
-- la fecha del pedido y entrega de este, ademas del valor para los clientes que inicien con L
SELECT  Cliente.cliNombre , Cliente.cliDireccion , Sucursal.sucNombre ,
Pedido.perFechaHoraPedido  , Pedido.pedValorTotal , Pedido.perFechaHoraEntrega
FROM SUCURSAL JOIN (PEDIDO JOIN CLIENTE ON ( Pedido.cliId = Cliente.cliId)) ON ( Sucursal.sucId = Pedido.sucId)
WHERE Cliente.cliNombre LIKE 'L%';


/* Defina un índice que permita acelerar las consultas que involucren filtrado o clasificación
por la fecha de pedido y el estado del pedido.*/

CREATE INDEX idx_pedido_fechaPedido_estado ON Pedido (perFechaHoraPedido,pedEstado);

-- Muestra la fecha de pedido , de entrega y  el valor de los pedidos , ordenados por el valor total y que sean mayores a 50000  
SELECT perFechaHoraPedido  , pedValorTotal , perFechaHoraEntrega
FROM PEDIDO
WHERE pedvalortotal > 50000
ORDER BY  pedValorTotal  ASC;