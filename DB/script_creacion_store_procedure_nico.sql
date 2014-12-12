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
@p_fecha_hasta date,
@p_total int output)

as 
begin

set @p_total=( select COUNT(*)
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
				and		est.Check_Out=@p_fecha_hasta)
end
go

create procedure [LA_MAYORIA].[sp_room_type_total](
@p_hotel_id int,
@p_tipo_habitacion varchar(255),
@p_total int output
)
as
begin

set @p_total = (select distinct COUNT(thab.Id_Tipo_Habitacion)
					from LA_MAYORIA.Habitacion hab,
						LA_MAYORIA.Tipo_Habitacion thab

					where	hab.Id_Hotel=@p_hotel_id
					and		hab.Tipo_Habitacion=thab.Id_Tipo_Habitacion
					and		thab.Descripcion=@p_tipo_habitacion
					group by thab.Descripcion)
end
go

create procedure [LA_MAYORIA].[sp_get_reserva](

@p_id_reserva int,
@p_regimen varchar(255)output,
@p_fecha_desde datetime output,
@p_estadia int output,
@p_estado as varchar (255) output,
@p_nro_hab int output,
@p_piso_hab int output,
@p_tipo_hab varchar (255) output
)

as
begin

declare @p_id_reserva_aux int
declare @p_regimen_aux varchar(255)
declare @p_fecha_desde_aux datetime
declare @p_estadia_aux int
declare @p_estado_aux as varchar (255)
declare @p_nro_hab_aux int
declare @p_piso_hab_aux int
declare @p_tipo_hab_aux varchar (255)


declare reserva cursor for
		
		(select res.Id_Reserva,reg.Descripcion,res.Fecha_Inicio,res.estadia,
		estr.Descripcion as estado,hres.Habitacion_Nro,hres.Habitacion_Piso,thab.Descripcion



		from LA_MAYORIA.Reserva res,
			LA_MAYORIA.Habitacion_Reserva hres,
			LA_MAYORIA.Estadia est,
			LA_MAYORIA.Regimen reg,
			LA_MAYORIA.Estado_Reserva estr,
			LA_MAYORIA.Habitacion hab,
			LA_MAYORIA.Tipo_Habitacion thab
			
			
		where res.Id_Reserva=hres.Id_Reserva
		and res.Id_Reserva=@p_id_reserva
		and est.Id_Reserva=res.Id_Reserva
		and reg.Id_Regimen=res.Tipo_Regimen
		and estr.Id_Estado=res.Estado
		and hres.Id_Reserva=res.Id_Reserva
		and hres.Id_Hotel=hab.Id_Hotel
		and hres.Habitacion_Nro=hab.Nro
		and hres.Habitacion_Piso=hab.Piso
		and hab.Tipo_Habitacion=thab.Id_Tipo_Habitacion)

open reserva

fetch reserva into @p_id_reserva_aux,@p_regimen_aux,@p_fecha_desde_aux,@p_estadia_aux,@p_estado_aux,
					@p_nro_hab_aux,@p_piso_hab_aux,@p_tipo_hab_aux
					

		set @p_id_reserva=@p_id_reserva_aux
		set	@p_regimen=@p_regimen_aux
		set @p_fecha_desde=@p_fecha_desde_aux
		set @p_estadia=@p_estadia_aux
		set @p_estado=@p_estado_aux
		set @p_nro_hab=@p_nro_hab_aux
		set @p_piso_hab=@p_piso_hab_aux
		set @p_tipo_hab=@p_tipo_hab_aux

end

close reserva

deallocate reserva

go
drop function LA_MAYORIA.check_availability
go
CREATE FUNCTION LA_MAYORIA.check_availability(
@p_hotel_id as int,
@p_floor_id as int,
@p_room_id as int,
@p_checkin as datetime,
@p_stay as int
)

RETURNS INT
BEGIN
	Declare @p_availability int
	
	SET @p_availability = 1
	Declare @checkin datetime = CAST(@p_checkin AS DATE) 
	Declare @possible_check_out datetime = CAST(DATEADD(DAY,@p_stay,@checkin) AS DATE)
	
	--CHEQUEO SI EL HOTEL ESTE NO DISPONIBLE EN ESAS FECHAS
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Historial_Baja_Hotel hbh
		WHERE hbh.Id_Hotel = @p_hotel_id
		AND (
			(hbh.Fecha_Inicio BETWEEN DATEADD(DAY, -1, @checkin) AND @possible_check_out)
			OR (hbh.Fecha_Fin BETWEEN @checkin AND DATEADD(DAY, 1, @possible_check_out))
		)
	)
	BEGIN
		SET @p_availability = 0
		return @p_availability
	END
	
	--CHEQUEO SI LA HABITACION ESTE NO DISPONIBLE EN ESAS FECHAS
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Historial_Baja_Habitacion hbha
		WHERE hbha.Id_Hotel = @p_hotel_id
			AND hbha.Habitacion_Piso = @p_floor_id
			AND hbha.Habitacion_Nro = @p_room_id
			AND (
				(hbha.Fecha_Inicio BETWEEN DATEADD(DAY, -1, @checkin) AND @possible_check_out)
				OR (hbha.Fecha_Fin BETWEEN @checkin AND DATEADD(DAY, 1, @possible_check_out))
			)
	)
	BEGIN
		SET @p_availability = 0
		return @p_availability
	END
	
	--CHEQUEO QUE NO HAYA UNA RESERVA PARA LA HABITACION EN ESOS DIAS Y NO HAYA HECHO CHECKIN
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Reserva r
		INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
			ON hr.Id_Reserva = r.Id_Reserva
		WHERE hr.Id_Hotel = @p_hotel_id
			AND hr.Habitacion_Piso = @p_floor_id
			AND hr.Habitacion_Nro = @p_room_id
			AND NOT EXISTS (SELECT 1 FROM LA_MAYORIA.Estadia e
				WHERE e.Id_Reserva = r.Id_Reserva)
			AND (
				(r.Fecha_Inicio BETWEEN DATEADD(DAY, -1, @checkin) AND @possible_check_out)
				OR (CAST(DATEADD(DAY, r.Estadia, r.Fecha_Inicio) AS DATE) BETWEEN @checkin AND DATEADD(DAY, 1, @possible_check_out))
			)
	)
	BEGIN
		SET @p_availability = 0
		return @p_availability
	END
	
	--CHEQUEO QUE NO HAYA UNA RESERVA PARA LA HABITACION EN ESOS DIAS Y YA HAYA HECHO CHECKIN
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Reserva r
		INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
			ON hr.Id_Reserva = r.Id_Reserva
		WHERE hr.Id_Hotel = @p_hotel_id
			AND hr.Habitacion_Piso = @p_floor_id
			AND hr.Habitacion_Nro = @p_room_id
			AND EXISTS (SELECT 1 FROM LA_MAYORIA.Estadia e
				WHERE e.Id_Reserva = r.Id_Reserva
				 AND e.Check_In BETWEEN DATEADD(DAY, -1, @checkin) AND @possible_check_out
				 AND (e.Check_Out IS NOT NULL AND e.Check_Out BETWEEN @checkin AND DATEADD(DAY, 1,@possible_check_out)))
	)
	BEGIN
		SET @p_availability = 0
		return @p_availability
	END
	
	RETURN @p_availability
END
GO

drop procedure LA_MAYORIA.sp_check_hotel_availability
go

CREATE PROCEDURE LA_MAYORIA.sp_check_hotel_availability(
@p_hotel_id int,
@p_checkin datetime,
@p_stay int,
@p_availability int = 0 OUTPUT
)
AS
BEGIN
	SET @p_availability = 1
	Declare @checkin datetime = CAST(@p_checkin AS DATE) 
	Declare @possible_check_out datetime = CAST(DATEADD(DAY,@p_stay,@checkin) AS DATE)
	
	--CHEQUEO SI EL HOTEL ESTE NO DISPONIBLE EN ESAS FECHAS
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Historial_Baja_Hotel hbh
		WHERE hbh.Id_Hotel = @p_hotel_id
		AND (
			(hbh.Fecha_Inicio BETWEEN DATEADD(DAY, -1, @checkin) AND @possible_check_out)
			OR (hbh.Fecha_Fin BETWEEN @checkin AND DATEADD(DAY, 1, @possible_check_out))
		)
	)
	BEGIN
		SET @p_availability = 0
		return;
	END
	
	
	IF NOT EXISTS (SELECT 1 FROM LA_MAYORIA.Habitacion h
		WHERE h.Id_Hotel = @p_hotel_id
		AND
		(
			--CHEQUEO SI LA HABITACION ESTE NO DISPONIBLE EN ESAS FECHAS
			NOT EXISTS(SELECT 1 FROM LA_MAYORIA.Historial_Baja_Habitacion hbha
				WHERE hbha.Id_Hotel = h.Id_Hotel
				AND hbha.Habitacion_Piso = h.Piso
				AND hbha.Habitacion_Nro = h.Nro
				AND (
					(hbha.Fecha_Inicio BETWEEN DATEADD(DAY, -1, @checkin) AND @possible_check_out)
				OR (hbha.Fecha_Fin BETWEEN @checkin AND DATEADD(DAY, 1, @possible_check_out))
				)
			) 
		) OR (
			--CHEQUEO QUE NO HAYA UNA RESERVA PARA LA HABITACION EN ESOS DIAS Y NO HAYA HECHO CHECKIN
			NOT EXISTS(SELECT 1 FROM LA_MAYORIA.Reserva r
				INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
					ON hr.Id_Reserva = r.Id_Reserva
				WHERE hr.Id_Hotel = h.Id_Hotel
				AND hr.Habitacion_Piso = h.Piso
				AND hr.Habitacion_Nro = h.Nro
				AND NOT EXISTS (SELECT 1 FROM LA_MAYORIA.Estadia e
					WHERE e.Id_Reserva = r.Id_Reserva)
				AND (
					(r.Fecha_Inicio BETWEEN DATEADD(DAY, -1, @checkin) AND @possible_check_out)
					OR (CAST(DATEADD(DAY, r.Estadia, r.Fecha_Inicio) AS DATE) BETWEEN @checkin AND DATEADD(DAY, 1, @possible_check_out))
				)
			)
		) OR (
			--CHEQUEO QUE NO HAYA UNA RESERVA PARA LA HABITACION EN ESOS DIAS Y YA HAYA HECHO CHECKIN
			NOT EXISTS(SELECT 1 FROM LA_MAYORIA.Reserva r
				INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
					ON hr.Id_Reserva = r.Id_Reserva
				WHERE hr.Id_Hotel = h.Id_Hotel
				AND hr.Habitacion_Piso = h.Piso
				AND hr.Habitacion_Nro = h.Nro
				AND EXISTS (SELECT 1 FROM LA_MAYORIA.Estadia e
					WHERE e.Id_Reserva = r.Id_Reserva
					AND e.Check_In BETWEEN DATEADD(DAY, -1, @checkin) AND @possible_check_out
					AND (e.Check_Out IS NOT NULL AND e.Check_Out BETWEEN @checkin AND DATEADD(DAY, 1,@possible_check_out)))
			)
		)
	)
		SET @p_availability = 0
END
GO
 
drop procedure LA_MAYORIA.sp_assign_room
go
		
create procedure [LA_MAYORIA].[sp_assign_room](
@p_hotel_id as int,
@p_id_reserva as int,
@p_checkin as Datetime,
@p_stay as int,
@p_tipo_habitacion as varchar(255),
@p_regimen as varchar (255),
@p_update as bit
)

as
begin

Declare @nroHabitacion int = null
Declare @nroPiso int = null
Declare @nroHotel int = null
Declare @idTipoHabitacion int --PARAMETRO DE ENTRADA

SELECT TOP 1 @nroHabitacion = h.Nro, @nroPiso = h.Piso, @nroHotel = h.Id_Hotel 
	FROM LA_MAYORIA.Habitacion h
	INNER JOIN LA_MAYORIA.Tipo_Habitacion tp
		ON h.Tipo_Habitacion = tp.Id_Tipo_Habitacion
	WHERE h.Id_Hotel = @p_hotel_id
	AND tp.Id_Tipo_Habitacion = (select thab.Id_Tipo_Habitacion
									from LA_MAYORIA.Tipo_Habitacion thab
									where @p_tipo_habitacion=thab.Descripcion)
	AND LA_MAYORIA.check_availability (h.Id_Hotel ,h.Piso,h.Nro ,
			@p_checkin,@p_stay) = 1
			
	BEGIN TRANSACTION
	IF (@nroHabitacion IS NOT NULL)
	BEGIN
		Declare @estado int
		Declare @idReserva int
		SELECT @estado = Id_Estado FROM LA_MAYORIA.Estado_Reserva
			WHERE UPPER(Descripcion) = UPPER('Reserva Correcta')
		if (@p_update=0)
		begin
			INSERT INTO LA_MAYORIA.Reserva (Fecha_Inicio, Estadia, Tipo_Regimen, Estado)
			VALUES (@p_checkin, @p_stay, (select reg.Id_Regimen
											from LA_MAYORIA.Regimen reg
											where @p_regimen=reg.Descripcion)
					, @estado)
			
			SET @idReserva = @@IDENTITY --EL NUMERO DE RESERVA QUE GENERA
			
			INSERT INTO LA_MAYORIA.Habitacion_Reserva (Id_Hotel, Id_Reserva, Habitacion_Nro, Habitacion_Piso)
			VALUES (@nroHotel, @idReserva, @nroHabitacion, @nroPiso)
		end
		
		else
		begin
			update LA_MAYORIA.Reserva
			set Fecha_Inicio=@p_checkin,Estadia=@p_stay,
			Tipo_Regimen=(select reg.Id_Regimen	from LA_MAYORIA.Regimen reg
					where reg.Descripcion=@p_regimen),
					Estado=(select est.Id_Estado
							from LA_MAYORIA.Estado_Reserva est
							where UPPER(est.Descripcion)=UPPER('Reserva Modificada'))
			where LA_MAYORIA.Reserva.Id_Reserva=@p_id_reserva
			
			update LA_MAYORIA.Habitacion_Reserva
			set Id_Hotel=@p_hotel_id,
				Habitacion_Nro=@nroHabitacion,
				Habitacion_Piso=@nroPiso
			where Id_Reserva=@p_id_reserva
		end
			
	END
	
	COMMIT TRANSACTION
end
