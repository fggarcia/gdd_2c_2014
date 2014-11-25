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
	SELECT DISTINCT  Id_Usuario, Id_Rol FROM LA_MAYORIA.Usuario_Rol_Hotel
		WHERE Id_Usuario = @p_id
		AND Habilitado = 1

	SET @count_rol = @@ROWCOUNT

	SET @p_count_rol = @count_rol

	IF ( @count_rol = 1 )
	BEGIN
		SELECT @p_id_rol = urh.Id_Rol, @p_rol_desc = r.Descripcion FROM LA_MAYORIA.Usuario_Rol_Hotel urh 
			INNER JOIN LA_MAYORIA.Rol r ON urh.Id_Rol = r.Id_Rol 
		WHERE urh.Id_Usuario = @p_id 
			AND r.Habilitado = 1
			AND urh.Habilitado = 1
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
@p_id_rol int,
@p_count_hotel int = 0 OUTPUT,
@p_id_hotel int = 0 OUTPUT,
@p_hotel_desc varchar(255) = null OUTPUT
)
AS
BEGIN
	Declare @count_hotel int
	SELECT @count_hotel = COUNT(1) FROM LA_MAYORIA.Usuario_Rol_Hotel 
		WHERE Id_Usuario = @p_id
		AND Id_Rol = @p_id_rol
		AND Habilitado = 1

	SET @p_count_hotel = @count_hotel

	IF ( @count_hotel = 1 )
	BEGIN
		SELECT @p_id_hotel = urh.Id_Hotel, @p_hotel_desc = h.Nombre FROM LA_MAYORIA.Usuario_Rol_Hotel urh 
			INNER JOIN LA_MAYORIA.Hotel h ON urh.Id_Hotel = h.Id_Hotel
		WHERE urh.Id_Usuario = @p_id
			AND urh.Id_Rol = @p_id_rol
			AND h.Habilitado = 1
			AND urh.Habilitado = 1
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
		urh.Id_Hotel 'Hotel',
		u.Habilitado 'Habilitado'
		
		FROM LA_MAYORIA.Usuario u
			INNER JOIN LA_MAYORIA.Datos_Usuario ud
				ON u.Id_Usuario = ud.Id_Usuario
			INNER JOIN LA_MAYORIA.Usuario_Rol_Hotel urh
				ON u.Id_Usuario = urh.Id_Usuario
			INNER JOIN LA_MAYORIA.Rol r
				ON urh.Id_Rol = r.Id_Rol

		WHERE
		((@p_id_rol IS NULL) OR ( urh.Id_Rol = @p_id_rol))
		AND  ((@p_user_name IS NULL) OR (u.Id_Usuario like @p_user_name + '%'))
		AND  ((@p_id_hotel IS NULL) OR (urh.Id_Hotel = @p_id_hotel))
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

CREATE PROCEDURE [LA_MAYORIA].[sp_user_clean_login](
@p_user_name varchar(255)
)
AS
BEGIN
	UPDATE LA_MAYORIA.Usuario SET Cantidad_Login = 0
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_user_data_get_by_user](
@p_user_name varchar(255)
)
AS
BEGIN
	SELECT * FROM LA_MAYORIA.Usuario u
		INNER JOIN LA_MAYORIA.Datos_Usuario ud
			ON u.Id_Usuario = ud.Id_Usuario
		INNER JOIN LA_MAYORIA.Tipo_Identificacion ti
			ON ti.Id_Tipo_Identificacion = ud.Tipo_DNI
		WHERE u.Id_Usuario = @p_user_name
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_user_search_rol_hotel_by_user](
@p_user_name varchar(255),
@p_id_hotel int
)
AS
BEGIN
	SELECT
		r.Id_Rol 'IdRol',
		r.Descripcion 'Descripcion'
	FROM LA_MAYORIA.Usuario_Rol_Hotel urh
	INNER JOIN LA_MAYORIA.Rol r 
		ON urh.Id_Rol = r.Id_Rol
	WHERE urh.Id_Usuario = @p_user_name
	AND urh.Id_Hotel = @p_id_hotel
	AND r.Habilitado = 1
	AND urh.Habilitado = 1
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_user_save_update](
@p_user_name varchar(255),
@p_name_lastName varchar(255),
@p_id_type_document int,
@p_document_number int,
@p_mail varchar(255),
@p_telephone varchar(255),
@p_address varchar(255),
@p_birthdate datetime,
@p_enabled bit,
@p_id_hotel int,
@p_id_rol varchar(255),
@p_password varchar(255) = null
)
AS
BEGIN
	BEGIN TRANSACTION
		IF ( EXISTS(SELECT 1 FROM LA_MAYORIA.Usuario WHERE ID_Usuario = @p_user_name))
		BEGIN
			IF (@p_password IS NOT NULL)
				UPDATE LA_MAYORIA.Usuario SET Password = @p_password
				WHERE Id_Usuario = @p_user_name
			UPDATE LA_MAYORIA.Usuario SET Habilitado = @p_enabled
			WHERE Id_Usuario = @p_user_name
		END
		ELSE
		BEGIN
			INSERT INTO LA_MAYORIA.Usuario (Id_Usuario, Password, Cantidad_Login, Ultima_Fecha, Habilitado)
			VALUES (@p_user_name, @p_password, 0, null, @p_enabled)
		END

		IF ( EXISTS(SELECT 1 FROM LA_MAYORIA.Usuario_Rol_Hotel urh
			WHERE Id_Usuario = @p_user_name
			AND Id_Hotel = @p_id_hotel ))
		BEGIN
			UPDATE LA_MAYORIA.Usuario_Rol_Hotel SET Id_Rol = @p_id_rol, Habilitado = @p_enabled
			WHERE Id_Usuario = @p_user_name
			AND Id_Hotel = @p_id_hotel
		END
		ELSE
		BEGIN
			INSERT INTO LA_MAYORIA.Usuario_Rol_Hotel (Id_Usuario, Id_Rol, Id_Hotel, Habilitado)
				VALUES (@p_user_name, @p_id_rol, @p_id_hotel, @p_enabled)
		END

		IF ( EXISTS(SELECT 1 FROM LA_MAYORIA.Datos_Usuario WHERE Id_Usuario = @p_user_name))
		BEGIN
			UPDATE LA_MAYORIA.Datos_Usuario SET Nombre_Apellido = @p_name_lastName, Mail = @p_mail,
				Tipo_DNI = @p_id_type_document, Nro_DNI = @p_document_number,
				Telefono = @p_telephone, Direccion = @p_address, Fecha_Nacimiento = @p_birthdate
			WHERE Id_Usuario = @p_user_name
		END
		ELSE
		BEGIN
			INSERT INTO LA_MAYORIA.Datos_Usuario (Id_Usuario, Nombre_Apellido, Mail, Tipo_DNI, Nro_DNI, Telefono,
				Direccion, Fecha_Nacimiento)
			VALUES (@p_user_name, @p_name_lastName, @p_mail, @p_id_type_document, @p_document_number, @p_telephone,
				@p_address, @p_birthdate)
		END

	COMMIT TRANSACTION
END