USE GD2C2014
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_reserva_listar](
@p_hotel_id int,
@p_nombre varchar(255)=null,
@p_apellido varchar(255)=null--,
--@p_res_id int = 0
)
AS
BEGIN
	select res.Id_Reserva, cli.Nombre,cli.Apellido, res.Fecha_Inicio
	from LA_MAYORIA.Habitacion_Reserva Hres, LA_MAYORIA.Reserva res, LA_MAYORIA.Reserva_Cliente resc,
		LA_MAYORIA.Clientes cli
	where Hres.Id_Reserva=res.Id_Reserva
	and		res.Id_Reserva=resc.Id_Reserva
	and		cli.Id_Cliente=resc.Id_Cliente
	and		((@p_nombre is null) or (cli.Nombre=@p_nombre))
	and		((@p_apellido is null) or (cli.Apellido=@p_apellido))
	--and		((@p_res_id=0) or (res.Id_Reserva=@p_res_id))
	and		Id_Hotel=@p_hotel_id
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

create procedure [LA_MAYORIA].[sp_tipo_habitacion_available](
@p_hotel_id int
)

as
begin
select distinct thab.Descripcion,thab.Cupo
from LA_MAYORIA.Habitacion hab,
	LA_MAYORIA.Tipo_Habitacion thab

where	hab.Id_Hotel=@p_hotel_id
and		hab.Tipo_Habitacion=thab.Id_Tipo_Habitacion
end
go

create procedure [LA_MAYORIA].[sp_reserva_occupied](
@p_hotel_id int,
@p_tipo_hab varchar(255),
@p_fecha_desde date,
@p_fecha_hasta date)

as 
begin

select COUNT(*)--res.Id_Reserva,est.Check_In,est.Check_Out,thab.Descripcion
from LA_MAYORIA.Reserva res,
	LA_MAYORIA.Habitacion_Reserva hres,
	LA_MAYORIA.Habitacion hab,
	LA_MAYORIA.Estadia est,
	LA_MAYORIA.Tipo_Habitacion thab

where	res.Id_Reserva=hres.Id_Reserva
and		hres.Habitacion_Nro=hab.Nro
and		hres.Habitacion_Piso=hab.Piso
and		est.Id_Reserva=res.Id_Reserva
and		hres.Id_Hotel=hab.Id_Hotel
and		hab.Tipo_Habitacion=thab.Id_Tipo_Habitacion
and		thab.Descripcion=@p_tipo_hab
and		hres.Id_Hotel=@p_hotel_id
and		est.Check_In=@p_fecha_desde
and		est.Check_Out=@p_fecha_hasta
end
go

create procedure [LA_MAYORIA].[sp_room_type_total](
@p_hotel_id int,
@tipo_habitacion varchar(255)
)
as
begin

select distinct COUNT(thab.Id_Tipo_Habitacion)
from LA_MAYORIA.Habitacion hab,
	LA_MAYORIA.Tipo_Habitacion thab

where	hab.Id_Hotel=@p_hotel_id
and		hab.Tipo_Habitacion=thab.Id_Tipo_Habitacion
and		thab.Descripcion=@tipo_habitacion
group by thab.Descripcion
end
go