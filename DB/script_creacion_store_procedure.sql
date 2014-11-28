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
@p_id_hotel int,
@p_enable_disable int
)
AS
BEGIN
	UPDATE LA_MAYORIA.Usuario_Rol_Hotel SET Habilitado = @p_enable_disable
		WHERE Id_Usuario = @p_user_name
		AND Id_Hotel = @p_id_hotel
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
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_rol_search](
@p_rol_name varchar(255) = null
)
AS
BEGIN
	SELECT DISTINCT
				
		r.Id_Rol 'Id Rol',
		r.Descripcion 'Descripcion',
		r.Habilitado 'Habilitado'
		
		FROM LA_MAYORIA.Rol r

		WHERE
		((@p_rol_name IS NULL) OR (r.Descripcion like @p_rol_name + '%'))
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_rol_enable_disable](
@p_id_rol int,
@p_enable_disable int
)
AS
BEGIN
	UPDATE LA_MAYORIA.Rol SET Habilitado = @p_enable_disable
		WHERE Id_Rol = @p_id_rol
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_rol_functionality_availability](
@p_id_rol int = null
)
AS
BEGIN
	SELECT DISTINCT
		f.Id_Funcionalidad 'Id Funcionalidad',
		f.Descripcion 'Descripcion'

		FROM LA_MAYORIA.Funcionalidad f
		WHERE NOT EXISTS (SELECT 1 FROM LA_MAYORIA.Rol_Funcionalidad rf
			WHERE f.Id_Funcionalidad = rf.Id_Funcionalidad
			AND rf.Id_Rol = @p_id_rol)
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_rol_functionality_enabled](
@p_id_rol int = null
)
AS
BEGIN
	SELECT DISTINCT
		f.Id_Funcionalidad 'Id Funcionalidad',
		f.Descripcion 'Descripcion'

		FROM LA_MAYORIA.Funcionalidad f
		WHERE EXISTS (SELECT 1 FROM LA_MAYORIA.Rol_Funcionalidad rf
			WHERE f.Id_Funcionalidad = rf.Id_Funcionalidad
			AND rf.Id_Rol = @p_id_rol)
END
GO

CREATE PROCEDURE LA_MAYORIA.[sp_rol_create](
@p_rol_description varchar(255),
@p_id_rol int OUTPUT
)
AS
BEGIN
	IF (@p_id_rol = 0)
	BEGIN
		INSERT INTO LA_MAYORIA.Rol (Descripcion, Habilitado)
			VALUES(@p_rol_description, 1)
		SET @p_id_rol = @@IDENTITY
	END
	ELSE
	BEGIN
		UPDATE LA_MAYORIA.Rol SET Descripcion = @p_rol_description
			WHERE Id_Rol = @p_id_rol 
	END
	
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_rol_functionality_add](
@p_id_rol int = null,
@p_id_functionality int = null
)
AS
BEGIN
	INSERT INTO LA_MAYORIA.Rol_Funcionalidad (Id_Rol, Id_Funcionalidad)
		VALUES (@p_id_rol, @p_id_functionality)
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_rol_functionality_remove](
@p_id_rol int = null,
@p_id_functionality int = null
)
AS
BEGIN
	DELETE FROM LA_MAYORIA.Rol_Funcionalidad WHERE Id_Rol = @p_id_rol AND Id_Funcionalidad = @p_id_functionality
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_client_search](
@p_client_name varchar(255) = null,
@p_client_lastname varchar(255) = null,
@p_id_type_document int = null,
@p_client_document_number varchar(255) = null,
@p_client_mail varchar(255) = null
)
AS
BEGIN
	SELECT DISTINCT
				
		c.Id_Cliente 'Id Cliente',
		c.Nombre 'Nombre',
		c.Apellido 'Apellido',
		ti.Id_Tipo_Identificacion 'Id Tipo Documento',
		ti.Descripcion 'Tipo Documento',
		c.Nro_Identificacion 'Nro Documento',
		c.Mail 'Mail',
		c.Telefono 'Telefono',
		c.Calle_Direccion 'Direccion',
		c.Calle_Nro 'Nro',
		c.Calle_Piso 'Piso',
		c.Calle_Depto 'Departamento',
		na.Id_Nacionalidad 'Id Nacionalidad',
		na.Descripcion 'Nacionalidad',
		c.Fecha_Nacimiento 'Nacimiento',
		c.Habilitado 'Habilitado'
		
		FROM LA_MAYORIA.Clientes c
			INNER JOIN LA_MAYORIA.Tipo_Identificacion ti
				ON c.Tipo_Identificacion = ti.Id_Tipo_Identificacion
			INNER JOIN LA_MAYORIA.Nacionalidad na
				ON c.Nacionalidad = na.Id_Nacionalidad

		WHERE
		( (@p_client_name IS NULL) OR (UPPER(c.Nombre) like UPPER(@p_client_name) + '%'))
		AND ((@p_client_lastname IS NULL) OR (UPPER(c.Apellido) like UPPER(@p_client_lastname) + '%'))
		AND ((@p_id_type_document IS NULL) OR (c.Tipo_Identificacion = @p_id_type_document))
		AND ((@p_client_document_number IS NULL) OR (LTRIM(RTRIM(STR(c.Nro_Identificacion))) like @p_client_document_number + '%'))
		AND ((@p_client_mail IS NULL) OR (UPPER(c.Mail) like UPPER(@p_client_mail) + '%'))
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_client_enable_disable](
@p_client_id int,
@p_enable_disable int
)
AS
BEGIN
	UPDATE LA_MAYORIA.Clientes SET Habilitado = @p_enable_disable
		WHERE Id_Cliente = @p_client_id
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_client_data_get_by_id_client](
@p_id_client varchar(255)
)
AS
BEGIN
	SELECT 
		c.Id_Cliente 'Id_Cliente',
		c.Nombre 'Nombre',
		c.Apellido 'Apellido',
		c.Tipo_Identificacion 'Tipo_Identificacion',
		ti.Descripcion 'Identificacion_Descripcion',
		c.Nro_Identificacion 'Nro_Identificacion',
		c.Mail 'Mail',
		c.Telefono 'Telefono',
		c.Calle_Direccion 'Calle_Direccion',
		c.Calle_Nro 'Calle_Nro',
		c.Calle_Piso 'Calle_Piso',
		c.Calle_Depto 'Calle_Depto',
		c.Nacionalidad 'Nacionalidad',
		n.Descripcion 'Nacionalidad_Descripcion',
		c.Fecha_Nacimiento 'Fecha_Nacimiento',
		c.Habilitado 'Habilitado'

	 FROM LA_MAYORIA.Clientes c
		INNER JOIN LA_MAYORIA.Tipo_Identificacion ti
			ON ti.Id_Tipo_Identificacion = c.Tipo_Identificacion
		INNER JOIN LA_MAYORIA.Nacionalidad n
			ON n.Id_Nacionalidad = c.Nacionalidad
		WHERE c.Id_Cliente = @p_id_client
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_client_save_update](
@p_client_id int = 0,
@p_client_name varchar(255),
@p_client_lastname varchar(255),
@p_client_type_document varchar(255),
@p_client_document_number int,
@p_client_mail varchar(255),
@p_client_telephone varchar(255),
@p_client_address_name varchar(255),
@p_client_address_number int,
@p_client_address_floor int = null,
@p_client_addres_dept varchar(2) = null,
@p_client_nationality varchar(255),
@p_client_birthdate datetime
)
AS
BEGIN
	Declare @p_client_type_document_id int
	Declare @p_client_nationality_id int

	SELECT @p_client_nationality_id = Id_Nacionalidad FROM LA_MAYORIA.Nacionalidad
		WHERE UPPER(LTRIM(RTRIM(Descripcion))) = UPPER(LTRIM(RTRIM(@p_client_nationality)))

	SELECT @p_client_type_document_id = Id_Tipo_Identificacion FROM LA_MAYORIA.Tipo_Identificacion
		WHERE UPPER(LTRIM(RTRIM(Descripcion))) = UPPER(LTRIM(RTRIM(@p_client_type_document)))

	BEGIN TRANSACTION
		IF ( @p_client_id = 0)
		BEGIN
			INSERT INTO LA_MAYORIA.Clientes (Nombre, Apellido, Tipo_Identificacion, Nro_Identificacion, Mail, Telefono, Calle_Direccion,
				Calle_Nro, Calle_Piso, Calle_Depto, Nacionalidad, Fecha_Nacimiento, Habilitado)
			VALUES (@p_client_name, @p_client_lastname, @p_client_type_document_id, @p_client_document_number, @p_client_mail,
				@p_client_telephone, @p_client_address_name, @p_client_address_number, @p_client_address_floor, @p_client_addres_dept,
				@p_client_nationality_id, @p_client_birthdate, 1)
		END
		ELSE
		BEGIN
			UPDATE LA_MAYORIA.Clientes SET Nombre = @p_client_name, Apellido = @p_client_lastname, 
			Tipo_Identificacion = @p_client_type_document_id, Nro_Identificacion = @p_client_document_number,
			Mail = @p_client_mail, Telefono = @p_client_telephone, Calle_Direccion = @p_client_address_name,
			Calle_Nro = @p_client_address_number, Calle_Piso = @p_client_address_floor, Calle_Depto = @p_client_addres_dept,
			Nacionalidad = @p_client_nationality_id, Fecha_Nacimiento = @p_client_birthdate
			WHERE Id_Cliente = @p_client_id
		END
	COMMIT TRANSACTION
END
GO