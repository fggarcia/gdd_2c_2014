USE GD2C2014
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_reserva_listar](
@p_hotel_id int = 0
)
AS
BEGIN
	select res.Id_Reserva, cli.Nombre,cli.Apellido
	from LA_MAYORIA.Habitacion_Reserva Hres, LA_MAYORIA.Reserva res, LA_MAYORIA.Reserva_Cliente resc,
		LA_MAYORIA.Clientes cli
	where Hres.Id_Reserva=res.Id_Reserva
	and		res.Id_Reserva=resc.Id_Reserva
	and cli.Id_Cliente=resc.Id_Cliente
	and Id_Hotel=@p_hotel_id
	order by res.Id_Reserva	
END
GO

