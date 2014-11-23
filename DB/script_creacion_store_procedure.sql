/*SECTOR LOGIN*/
GO
CREATE PROCEDURE [LA_MAYORIA].[sp_login_check_valid_user](
@p_id varchar(255) = null,
@p_is_valid bit = 0 OUTPUT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM LA_MAYORIA.Usuario WHERE Id_Usuario = @p_id AND Habilitado = 1)
	BEGIN
		SET @p_is_valid = 1
	END
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_login_check_password](
@p_id varchar(255) = null,
@p_pass varchar(255) = null,
@p_intentos int = 0 OUTPUT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM LA_MAYORIA.Usuario WHERE Id_Usuario = @p_id AND Password = @p_pass AND Habilitado = 1)
	BEGIN
		UPDATE LA_MAYORIA.Usuario SET Cantidad_Login = 0, Ultima_Fecha = getDate()
		SET @p_intentos = 0
	END
	ELSE
	BEGIN
		Declare @p_intentos_base int
		SELECT @p_intentos_base = Cantidad_Login FROM LA_MAYORIA.Usuario WHERE Id_Usuario = @p_id
		SET @p_intentos = @p_intentos_base + 1

		IF ( @p_intentos >= 3 )
			UPDATE LA_MAYORIA.Usuario SET Cantidad_Login = @p_intentos, Ultima_Fecha = getDate(), Habilitado = 0
		ELSE
			UPDATE LA_MAYORIA.Usuario SET Cantidad_Login = @p_intentos, Ultima_Fecha = getDate()

	END
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_rol_exist_one_by_user](
@p_id varchar(255) = null,
@p_count_rol int = 0 OUTPUT,
@p_id_rol int = 0 OUTPUT,
@p_rol_desc varchar(255) = null OUTPUT
)
AS
BEGIN
	Declare @count_rol int
	SELECT @count_rol = COUNT(1) FROM LA_MAYORIA.Usuario_Rol 
		WHERE Id_Usuario = @p_id
		AND Habilitado = 1

	SET @p_count_rol = @count_rol

	IF ( @count_rol = 1 )
	BEGIN
		SELECT @p_id_rol = ur.Id_Rol, @p_rol_desc = r.Descripcion FROM LA_MAYORIA.Usuario_Rol ur 
			INNER JOIN LA_MAYORIA.Rol r ON ur.Id_Rol = r.Id_Rol 
		WHERE ur.Id_Usuario = @p_id 
			AND r.Habilitado = 1
			AND ur.Habilitado = 1
	END
	ELSE
	BEGIN
		SET @p_id_rol = null
		SET @p_rol_desc = null
	END
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_hotel_exist_one_by_user](
@p_id varchar(255) = null,
@p_count_hotel int = 0 OUTPUT,
@p_id_hotel int = 0 OUTPUT,
@p_hotel_desc varchar(255) = null OUTPUT
)
AS
BEGIN
	Declare @count_hotel int
	SELECT @count_hotel = COUNT(1) FROM LA_MAYORIA.Usuario_Hotel 
		WHERE Id_Usuario = @p_id
		AND Habilitado = 1

	SET @p_count_hotel = @count_hotel

	IF ( @count_hotel = 1 )
	BEGIN
		SELECT @p_id_hotel = uh.Id_Hotel, @p_hotel_desc = h.Nombre FROM LA_MAYORIA.Usuario_Hotel uh 
			INNER JOIN LA_MAYORIA.Hotel h ON uh.Id_Hotel = h.Id_Hotel
		WHERE uh.Id_Usuario = @p_id 
			AND h.Habilitado = 1
			AND uh.Habilitado = 1
	END
	ELSE
	BEGIN
		SET @p_id_hotel = null
		SET @p_hotel_desc = null
	END
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_menu_list_functionality_by_user](
@p_id_rol int
)
AS
BEGIN
	SELECT fun.Descripcion, fun.Id_Funcionalidad FROM LA_MAYORIA.Funcionalidad fun
	INNER JOIN LA_MAYORIA.Rol_Funcionalidad funR ON fun.Id_Funcionalidad = funR.Id_Funcionalidad 
	WHERE @p_id_rol = funR.Id_Rol

END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_user_search](
@p_user_name varchar(255) = null,
@p_id_rol int = null,
@p_id_hotel int = null
)
AS
BEGIN
	SELECT DISTINCT
				
		u.Id_Usuario 'Usuario',
		ud.Nombre_Apellido 'Nombre',
		ud.Tipo_DNI 'Tipo Documento',
		ud.Nro_DNI 'Numero Documento',
		ud.Telefono 'Telefono',
		ud.Direccion 'Direccion',
		ud.Fecha_Nacimiento 'Nacimiento',
		r.Descripcion 'Rol',
		uh.Id_Hotel 'Hotel',
		u.Habilitado 'Habilitado'
		
		FROM LA_MAYORIA.Usuario u
			INNER JOIN LA_MAYORIA.Datos_Usuario ud
				ON u.Id_Usuario = ud.Id_Usuario
			INNER JOIN LA_MAYORIA.Usuario_Rol ur
				ON u.Id_Usuario = ur.Id_Usuario
			INNER JOIN LA_MAYORIA.Rol r
				ON ur.Id_Rol = r.Id_Rol
			INNER JOIN LA_MAYORIA.Usuario_Hotel uh
				ON u.Id_Usuario = uh.Id_Usuario

		WHERE
		((@p_id_rol IS NULL) OR ( ur.Id_Rol = @p_id_rol))
		AND  ((@p_user_name IS NULL) OR (u.Id_Usuario like @p_user_name + '%'))
		AND  ((@p_id_hotel IS NULL) OR (uh.Id_Hotel = @p_id_hotel))
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_user_enable_disable](
@p_user_name varchar(255),
@p_enable_disable int
)
AS
BEGIN
	UPDATE LA_MAYORIA.Usuario SET Habilitado = @p_enable_disable
		WHERE Id_Usuario = @p_user_name
END
GO