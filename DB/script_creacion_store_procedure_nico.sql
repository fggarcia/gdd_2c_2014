USE GD2C2014
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_reserva_listar](
@p_hotel_id int = 0,
@p_res_id int=0,
@p_nombre varchar(30),
@p_apellido varchar(30)
)
AS
BEGIN
	select res.Id_Reserva, cli.Nombre,cli.Apellido
	from LA_MAYORIA.Habitacion_Reserva Hres, LA_MAYORIA.Reserva res, LA_MAYORIA.Reserva_Cliente resc,
		LA_MAYORIA.Clientes cli
	where Hres.Id_Reserva=res.Id_Reserva
	and		Hres.Id_Reserva=@p_res_id
	and		res.Id_Reserva=resc.Id_Reserva
	and cli.Id_Cliente=resc.Id_Cliente
	and cli.Nombre=@p_nombre
	and cli.Apellido=@p_apellido
	and Id_Hotel=@p_hotel_id
	order by res.Id_Reserva	
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_hotel_regimen_retrieve](
@p_hotel_id int = null
)
AS
BEGIN
	SELECT distinct r.Descripcion,r.Precio
	from LA_MAYORIA.Regimen_Hotel rh, LA_MAYORIA.Regimen r
	where	rh.Id_Regimen=r.Id_Regimen
	and		rh.Id_Hotel=@p_hotel_id
END
GO
