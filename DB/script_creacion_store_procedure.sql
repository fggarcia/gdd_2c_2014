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
@p_client_id int = 0 OUTPUT,
@p_client_name varchar(255),
@p_client_lastname varchar(255),
@p_client_type_document varchar(255),
@p_client_document_number int,
@p_client_mail varchar(255),
@p_client_telephone varchar(255),
@p_client_address_name varchar(255),
@p_client_address_number int,
@p_client_address_floor int = null,
@p_client_address_dept varchar(2) = null,
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
				@p_client_telephone, @p_client_address_name, @p_client_address_number, @p_client_address_floor, @p_client_address_dept,
				@p_client_nationality_id, @p_client_birthdate, 1)

			SET @p_client_id = @@IDENTITY
		END
		ELSE
		BEGIN
			UPDATE LA_MAYORIA.Clientes SET Nombre = @p_client_name, Apellido = @p_client_lastname, 
			Tipo_Identificacion = @p_client_type_document_id, Nro_Identificacion = @p_client_document_number,
			Mail = @p_client_mail, Telefono = @p_client_telephone, Calle_Direccion = @p_client_address_name,
			Calle_Nro = @p_client_address_number, Calle_Piso = @p_client_address_floor, Calle_Depto = @p_client_address_dept,
			Nacionalidad = @p_client_nationality_id, Fecha_Nacimiento = @p_client_birthdate
			WHERE Id_Cliente = @p_client_id
		END
	COMMIT TRANSACTION
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_client_check_exist_document](
@p_client_id int = 0,
@p_client_type_document varchar(255),
@p_client_document_number int,
@p_isValid bit = 0 OUTPUT
)
AS
BEGIN
	Declare @p_client_type_document_id int

	SELECT @p_client_type_document_id = Id_Tipo_Identificacion FROM LA_MAYORIA.Tipo_Identificacion
		WHERE UPPER(LTRIM(RTRIM(Descripcion))) = UPPER(LTRIM(RTRIM(@p_client_type_document)))

	IF EXISTS (SELECT 1 FROM LA_MAYORIA.Clientes
		WHERE Tipo_Identificacion = @p_client_type_document_id
			AND Nro_Identificacion = @p_client_document_number
			AND Id_Cliente != @p_client_id)
		SET @p_isValid = 1
	ELSE
		SET @p_isValid = 0
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_client_check_exist_mail](
@p_client_id int = 0,
@p_client_mail varchar(255),
@p_isValid bit = 0 OUTPUT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM LA_MAYORIA.Clientes
		WHERE Mail = @p_client_mail
			AND Id_Cliente != @p_client_id)
		SET @p_isValid = 1
	ELSE
		SET @p_isValid = 0
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_hotel_search](
@p_hotel_name varchar(255) = null,
@p_hotel_city varchar(255) = null,
@p_hotel_country varchar(255) = null,
@p_hotel_star int = null,
@p_hotel_user_id varchar(255)
)
AS
BEGIN
	SELECT DISTINCT
				
		h.Id_Hotel 'Id Hotel',
		h.Nombre 'Nombre',
		h.Mail 'Mail',
		h.Telefono 'Telefono',
		h.Calle_Direccion 'Direccion',
		h.Calle_Nro 'Numero',
		h.Ciudad 'Ciudad',
		h.Pais 'Pais',
		h.Fecha_Creacion 'Fecha Creacion',
		he.Cantidad_Estrellas 'Estrellas'
		
		FROM LA_MAYORIA.Hotel h
		INNER JOIN LA_MAYORIA.Hotel_Estrellas he
			ON h.Id_Hotel = he.Id_Hotel
		INNER JOIN LA_MAYORIA.Usuario_Rol_Hotel urh
			ON h.Id_Hotel = urh.Id_Hotel
		WHERE
		( (@p_hotel_name IS NULL) OR (UPPER(h.Nombre) like UPPER(@p_hotel_name) + '%'))
		AND ((@p_hotel_city IS NULL) OR (UPPER(h.Ciudad) like UPPER(@p_hotel_city) + '%'))
		AND ((@p_hotel_country IS NULL) OR (UPPER(h.Pais) like UPPER (@p_hotel_country + '%')))
		AND ((@p_hotel_star IS NULL) OR (he.Cantidad_Estrellas = @p_hotel_star))
		AND (LTRIM(RTRIM(urh.Id_Usuario)) = LTRIM(RTRIM(@p_hotel_user_id)))
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_hotel_regimen_available](
@p_hotel_id int = null
)
AS
BEGIN
	SELECT DISTINCT
		r.Id_Regimen 'Id Regimen',
		r.Descripcion 'Descripcion'

		FROM LA_MAYORIA.Regimen r
		WHERE NOT EXISTS (SELECT 1 FROM LA_MAYORIA.Regimen_Hotel rh
			WHERE r.Id_Regimen = rh.Id_Regimen
			AND rh.Id_Hotel = @p_hotel_id)
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_hotel_regimen_assign](
@p_hotel_id int = null
)
AS
BEGIN
	SELECT DISTINCT
		r.Id_Regimen 'Id Regimen',
		r.Descripcion 'Descripcion'

		FROM LA_MAYORIA.Regimen r
		WHERE EXISTS (SELECT 1 FROM LA_MAYORIA.Regimen_Hotel rh
			WHERE r.Id_Regimen = rh.Id_Regimen
			AND rh.Id_Hotel = @p_hotel_id)
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_hotel_data_get_by_id](
@p_hotel_id int = null
)
AS
BEGIN
	SELECT 
		h.Nombre 'Nombre',
		h.Mail 'Mail',
		h.Telefono 'Telefono',
		he.Cantidad_Estrellas 'Estrellas',
		h.Calle_Direccion 'Direccion',
		h.Calle_Nro 'Direccion Nro',
		h.Ciudad 'Ciudad',
		h.Pais 'Pais',
		h.Fecha_Creacion 'Creacion'

		FROM LA_MAYORIA.Hotel h
		INNER JOIN LA_MAYORIA.Hotel_Estrellas he
			ON h.Id_Hotel = he.Id_Hotel
		WHERE h.Id_Hotel = @p_hotel_id
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_hotel_save_update](
@p_user_id varchar(255),
@p_user_rol_id int,
@p_hotel_id int = 0 OUTPUT,
@p_hotel_name varchar(255),
@p_hotel_mail varchar(255),
@p_hotel_address varchar(255),
@p_hotel_address_number int,
@p_hotel_telephone varchar(255),
@p_hotel_city varchar(255),
@p_hotel_country varchar(255),
@p_hotel_star int,
@p_hotel_creation datetime
)
AS
BEGIN
	BEGIN TRANSACTION
		IF ( @p_hotel_id = 0)
		BEGIN
			INSERT INTO LA_MAYORIA.Hotel (Nombre, Mail, Telefono, Calle_Direccion, Calle_Nro, Ciudad, Pais,
				Fecha_Creacion)
			VALUES (@p_hotel_name, @p_hotel_mail, @p_hotel_telephone, @p_hotel_address, @p_hotel_address_number,
				@p_hotel_city, @p_hotel_country, @p_hotel_creation)

			SET @p_hotel_id = @@IDENTITY

			INSERT INTO LA_MAYORIA.Usuario_Rol_Hotel (Id_Usuario, Id_Rol, Id_Hotel)
			VALUES (@p_user_id, @p_user_rol_id, @p_hotel_id)

			INSERT INTO LA_MAYORIA.Hotel_Estrellas(Id_Hotel, Cantidad_Estrellas, recarga)
			VALUES (@p_hotel_id, @p_hotel_star, 10)
		END
		ELSE
		BEGIN
			UPDATE LA_MAYORIA.Hotel SET Nombre = @p_hotel_name, Mail = @p_hotel_mail, 
			Telefono = @p_hotel_telephone, Calle_Direccion = @p_hotel_address,
			Calle_Nro = @p_hotel_address_number, Ciudad = @p_hotel_city, Pais = @p_hotel_country,
			Fecha_Creacion = @p_hotel_creation
			WHERE Id_Hotel = @p_hotel_id

			UPDATE LA_MAYORIA.Hotel_Estrellas SET Cantidad_Estrellas = @p_hotel_star
			WHERE Id_hotel = @p_hotel_id
		END
	COMMIT TRANSACTION
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_hotel_regimen_add](
@p_hotel_id int = null,
@p_regimen_id int = null
)
AS
BEGIN
	INSERT INTO LA_MAYORIA.Regimen_Hotel (Id_Hotel, Id_Regimen)
		VALUES (@p_hotel_id, @p_regimen_id)
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_hotel_regimen_remove](
@p_hotel_id int = null,
@p_regimen_id int = null,
@p_remove_ok int = null OUTPUT
)
AS
BEGIN
	IF NOT EXISTS (
		SELECT 1 FROM LA_MAYORIA.Reserva r
			INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
				ON hr.Id_Reserva = r.Id_Reserva
			WHERE hr.Id_Hotel = @p_hotel_id
			AND r.Tipo_Regimen = @p_regimen_id 
			AND	(
				(CAST(GETDATE() AS DATE) BETWEEN r.Fecha_Inicio AND DATEADD(DAY, r.Estadia, r.Fecha_Inicio))
				OR (r.Fecha_Inicio > CAST(GETDATE() AS DATE))
			)
		)
	BEGIN
		SET @p_remove_ok = 1
		DELETE FROM LA_MAYORIA.Regimen_Hotel WHERE Id_Hotel = @p_hotel_id AND Id_Regimen = @p_regimen_id
	END
	ELSE
		SET @p_remove_ok = 0
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_hotel_close_period_valid](
@p_user_id int,
@p_hotel_id int,
@p_hotel_close_period_from datetime,
@p_hotel_close_period_to datetime,
@p_hotel_close_period_motive varchar(255),
@p_add_ok int = null OUTPUT
)
AS
BEGIN
	IF NOT EXISTS (
		SELECT 1 FROM LA_MAYORIA.Reserva r
			INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
				ON hr.Id_Reserva = r.Id_Reserva
			WHERE hr.Id_Hotel = @p_hotel_id
			AND	(
				(CAST(@p_hotel_close_period_from AS DATE) BETWEEN r.Fecha_Inicio AND DATEADD(DAY, r.Estadia, r.Fecha_Inicio))
				OR (r.Fecha_Inicio > CAST(@p_hotel_close_period_from AS DATE))
			)
			AND	(
				(CAST(@p_hotel_close_period_to AS DATE) BETWEEN r.Fecha_Inicio AND DATEADD(DAY, r.Estadia, r.Fecha_Inicio))
				OR (r.Fecha_Inicio > CAST(@p_hotel_close_period_to AS DATE))
			) 
		)
	BEGIN
		SET @p_add_ok = 1
		INSERT INTO LA_MAYORIA.Historial_Baja_Hotel (Id_Hotel, Fecha_Inicio, Fecha_Fin, Motivo, Id_Usuario)
		VALUES (@p_hotel_id, @p_hotel_close_period_from, @p_hotel_close_period_to, @p_hotel_close_period_motive, @p_user_id)
	END
	ELSE
		SET @p_add_ok = 0
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_habitacion_search](
@p_habitacion_id int = null,
@p_habitacion_hotel_id int = null,
@p_habitacion_floor int = null,
@p_habitacion_type int = null,
@p_habitacion_front int = null,
@p_habitacion_comodity varchar(255) =null,
@p_user_name varchar(20)
)
AS
BEGIN
	SELECT DISTINCT
				
		h.Id_Hotel 'Hotel',
		h.Piso 'Piso',
		h.Nro 'Nro Habitacion',
		f.Descripcion 'Frente',
		th.Descripcion 'Tipo Habitacion',
		h.Comodidades 'Comodidades'
		
		FROM LA_MAYORIA.Habitacion h
			INNER JOIN LA_MAYORIA.Frente f
				ON h.Frente = f.Id_Frente
			INNER JOIN LA_MAYORIA.Tipo_Habitacion th
				ON h.Tipo_Habitacion = th.Id_Tipo_Habitacion
			INNER JOIN LA_MAYORIA.Usuario_Rol_Hotel urh
				ON urh.Id_Usuario = @p_user_name
				AND h.Id_Hotel = urh.Id_Hotel
		
		WHERE
		((@p_habitacion_id IS NULL) OR ( h.Nro = @p_habitacion_id))
		AND ((@p_habitacion_hotel_id IS NULL) OR (urh.Id_Hotel = @p_habitacion_hotel_id))
		AND ((@p_habitacion_floor IS NULL) OR (h.Piso = @p_habitacion_floor))
		AND ((@p_habitacion_type IS NULL) OR (th.Id_Tipo_Habitacion = @p_habitacion_type))
		AND ((@p_habitacion_front IS NULL) OR (f.Id_Frente = @p_habitacion_front))
		AND ((@p_habitacion_comodity IS NULL) OR (UPPER(h.Comodidades) like '%' + UPPER(@p_habitacion_comodity) + '%'))
		AND (LTRIM(RTRIM(urh.Id_Usuario)) = LTRIM(RTRIM(@p_user_name)))
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_habitacion_close_period_valid](
@p_user_id varchar(20),
@p_habitacion_id int,
@p_habitacion_floor_id int,
@p_habitacion_hotel_id int,
@p_habitacion_close_period_from datetime,
@p_habitacion_close_period_to datetime,
@p_habitacion_close_period_motive varchar(255),
@p_add_ok int = 0 OUTPUT
)
AS
BEGIN
	IF NOT EXISTS (
		SELECT 1 FROM LA_MAYORIA.Reserva r
			INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
				ON hr.Id_Reserva = r.Id_Reserva
			WHERE hr.Id_Hotel = @p_habitacion_hotel_id
			AND hr.Habitacion_Nro = @p_habitacion_id
			AND hr.Habitacion_Piso = @p_habitacion_floor_id
			AND	(
				(CAST(@p_habitacion_close_period_from AS DATE) BETWEEN r.Fecha_Inicio AND DATEADD(DAY, r.Estadia, r.Fecha_Inicio))
				OR (r.Fecha_Inicio > CAST(@p_habitacion_close_period_from AS DATE))
			)
			AND	(
				(CAST(@p_habitacion_close_period_to AS DATE) BETWEEN r.Fecha_Inicio AND DATEADD(DAY, r.Estadia, r.Fecha_Inicio))
				OR (r.Fecha_Inicio > CAST(@p_habitacion_close_period_to AS DATE))
			) 
		)
	BEGIN
		SET @p_add_ok = 1
		INSERT INTO LA_MAYORIA.Historial_Baja_Habitacion (Id_Hotel, Habitacion_Nro, Habitacion_Piso, Fecha_Inicio, Fecha_Fin, Motivo, Id_Usuario)
		VALUES (@p_habitacion_hotel_id, @p_habitacion_id, @p_habitacion_floor_id, @p_habitacion_close_period_from, @p_habitacion_close_period_to, 
			@p_habitacion_close_period_motive, @p_user_id)
	END
	ELSE
		SET @p_add_ok = 0
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_habitacion_data_get_by_id](
@p_habitacion_id int = null,
@p_habitacion_floor_id int = null,
@p_habitacion_hotel_id int = null
)
AS
BEGIN
	SELECT 
		h.Nro 'NroHabitacion',
		h.Piso 'Piso',
		h.Id_Hotel 'Hotel',
		h.Id_Hotel 'HotelNombre',
		h.Frente 'IdFrente',
		f.Descripcion 'FrenteDescripcion',
		h.Tipo_Habitacion 'IdTipoHabitacion',
		th.Descripcion 'TipoHabitacion',
		h.Comodidades 'Comodidades'

		FROM LA_MAYORIA.Habitacion h
		INNER JOIN LA_MAYORIA.Tipo_Habitacion th
			ON h.Tipo_Habitacion = th.Id_Tipo_Habitacion
		INNER JOIN LA_MAYORIA.Frente f
			ON h.frente = f.Id_Frente
		WHERE h.Id_Hotel = @p_habitacion_hotel_id
			AND h.Nro = @p_habitacion_id
			AND h.Piso = @p_habitacion_floor_id
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_habitacion_exist_hotel_room](
@p_habitacion_id int,
@p_habitacion_hotel_id int,
@p_habitacion_floor_id int,
@p_exist bit = 0 OUTPUT
)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Habitacion
		WHERE Id_Hotel = @p_habitacion_hotel_id
			AND Nro = @p_habitacion_id
			AND Piso = @p_habitacion_floor_id)
		SET @p_exist = 1
	ELSE
		SET @p_exist = 0
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_habitacion_save_update](
@p_habitacion_id int,
@p_habitacion_floor_id int,
@p_habitacion_hotel_id int,
@p_habitacion_type int,
@p_habitacion_comodity varchar(255),
@p_habitacion_front int
)
AS
BEGIN
	BEGIN TRANSACTION
		IF EXISTS(SELECT 1 FROM LA_MAYORIA.Habitacion
		WHERE Id_Hotel = @p_habitacion_hotel_id
			AND Nro = @p_habitacion_id
			AND Piso = @p_habitacion_floor_id)
			UPDATE LA_MAYORIA.Habitacion SET Frente = @p_habitacion_front, 
			Tipo_Habitacion = @p_habitacion_type, Comodidades = @p_habitacion_comodity
				WHERE Id_Hotel = @p_habitacion_hotel_id
					AND Nro = @p_habitacion_id
					AND Piso = @p_habitacion_floor_id
		ELSE
			INSERT INTO LA_MAYORIA.Habitacion (Id_Hotel, Nro, Piso, Frente, Tipo_Habitacion, Comodidades)
				VALUES (@p_habitacion_hotel_id, @p_habitacion_id, @p_habitacion_floor_id,
					@p_habitacion_front, @p_habitacion_type, @p_habitacion_comodity)
	COMMIT TRANSACTION
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_regimen_search](
@p_regimen_description varchar(255) = null
)
AS
BEGIN
	SELECT DISTINCT
				
		r.Descripcion 'Descripcion',
		r.Precio 'Precio',
		r.Habilitado 'Habilitado'
		
		FROM LA_MAYORIA.Regimen r
		
		WHERE
		((@p_regimen_description IS NULL) OR (UPPER(r.Descripcion) like '%' + UPPER(LTRIM(RTRIM(@p_regimen_description))) + '%'))
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_cancelacion_reserva_search](
@p_cancelacion_reserva_id int = null,
@p_cancelacion_reserva_lastname varchar(255) = null,
@p_user_hotel_id int = null
)
AS
BEGIN
	SELECT DISTINCT
		
		r.Id_Reserva 'Reserva',
		c.Nombre 'Nombre',
		c.Apellido 'Apellido',
		hr.Id_Hotel 'Hotel',
		hr.Habitacion_Piso 'Piso',
		hr.Habitacion_Nro 'Habitacion',
		r.Fecha_Inicio 'Fecha Inicio',
		r.Estadia 'Estadia',
		er.Descripcion 'Estado'
		
		FROM LA_MAYORIA.Reserva r 
		INNER JOIN LA_MAYORIA.Reserva_Cliente rc
			ON r.Id_Reserva = rc.Id_Reserva
		INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
			ON r.Id_Reserva = hr.Id_Reserva
		INNER JOIN LA_MAYORIA.Estado_Reserva er
			ON r.Estado = er.Id_Estado
		INNER JOIN LA_MAYORIA.Clientes c
			ON rc.Id_Cliente = c.Id_Cliente

		WHERE

		((@p_user_hotel_id IS NULL) OR (hr.Id_Hotel = @p_user_hotel_id))
		AND ((@p_cancelacion_reserva_lastname IS NULL) OR (UPPER(LTRIM(RTRIM(c.Apellido))) 
			like '%' + UPPER(LTRIM(RTRIM(@p_cancelacion_reserva_lastname))) + '%'))
		AND ((@p_cancelacion_reserva_id IS NULL) OR (STR(r.Id_Reserva) like '%' + STR(@p_cancelacion_reserva_id) + '%'))
		AND ( (UPPER(er.Descripcion) = UPPER('Reserva con ingreso')) OR (UPPER(er.Descripcion) = UPPER('Reserva Correcta'))
			OR (UPPER(er.Descripcion) = UPPER('Reserva Modificada')) )
		AND (DATEADD(DAY, 1,CAST(GETDATE() AS DATE)) <= r.Fecha_Inicio)
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_cancelacion_reserva_cancel](
@p_cancelacion_reserva_id int,
@p_cancelacion_reserva_motive varchar(255),
@p_user_name varchar(20)
)
AS
BEGIN
	BEGIN TRANSACTION

		INSERT INTO LA_MAYORIA.Historial_Cancelacion_Reserva (Id_Reserva, Motivo, Fecha_Cancelacion, Id_Usuario)
			VALUES (@p_cancelacion_reserva_id, @p_cancelacion_reserva_motive, GETDATE(), @p_user_name)

		Declare @bookingStatus int
		IF (LTRIM(RTRIM(@p_user_name)) = 'guest')
			SELECT @bookingStatus = Id_Estado FROM LA_MAYORIA.Estado_Reserva
				WHERE UPPER(LTRIM(RTRIM(Descripcion))) = UPPER('Reserva Cancelada Por Cliente')
		ELSE
			SELECT @bookingStatus = Id_Estado FROM LA_MAYORIA.Estado_Reserva
				WHERE UPPER(LTRIM(RTRIM(Descripcion))) = UPPER('Reserva Cancelada Por Recepcion')

		UPDATE LA_MAYORIA.Reserva SET Estado = @bookingStatus
			WHERE Id_Reserva = @p_cancelacion_reserva_id

	COMMIT TRANSACTION
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_booking_search](
@p_stay_booking_id int,
@p_stay_hotel_id int
)
AS
BEGIN
	SELECT 
		r.Id_Reserva 'Nro Reserva',
		rc.Id_Cliente 'Nro Cliente',
		c.Nombre 'Nombre',
		c.Apellido 'Apellido',
		CAST(r.Fecha_Inicio AS DATE) 'Fecha Inicio',
		r.Estadia 'Estadia',
		hr.Id_Hotel 'Hotel',
		hr.Habitacion_Piso 'Piso',
		hr.Habitacion_Nro 'Nro Habitacion'

	FROM LA_MAYORIA.Reserva r
	INNER JOIN LA_MAYORIA.Reserva_Cliente rc
		ON r.Id_Reserva = rc.Id_Reserva
	INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
		ON r.Id_Reserva = hr.Id_Reserva
	INNER JOIN LA_MAYORIA.Clientes c
		ON rc.Id_Cliente = c.Id_Cliente
	INNER JOIN LA_MAYORIA.Estado_Reserva er
		ON r.Estado = er.Id_Estado
	WHERE r.Id_Reserva = @p_stay_booking_id
		AND hr.Id_Hotel = @p_stay_hotel_id
		AND CAST(r.Fecha_Inicio AS DATE) = CAST(GETDATE() AS DATE)
		AND (
			(UPPER(RTRIM(LTRIM(er.Descripcion))) = UPPER(RTRIM(LTRIM('Reserva Correcta'))))
			OR (UPPER(RTRIM(LTRIM(er.Descripcion))) = UPPER(RTRIM(LTRIM('Reserva Modificada'))))
		)
		AND c.Habilitado = 1
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_booking_status](
@p_stay_booking_id int,
@p_stay_hotel_id int,
@p_stay_booking_cancel bit = 0 OUTPUT,
@p_stay_booking_exist bit = 0 OUTPUT,
@p_stay_booking_before bit = 0 OUTPUT,
@p_stay_booking_hotel bit = 0 OUTPUT
)
AS
BEGIN
	SET @p_stay_booking_before = 0
	SET @p_stay_booking_cancel = 0
	SET @p_stay_booking_exist = 0
	SET @p_stay_booking_hotel = 0
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Reserva r
		WHERE r.Id_Reserva = @p_stay_booking_id)
		SET @p_stay_booking_exist = 1
	
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Reserva r
		INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
			ON r.Id_Reserva = hr.Id_Reserva
		WHERE r.Id_Reserva = @p_stay_booking_id
			AND hr.Id_Hotel = @p_stay_booking_hotel)
		SET @p_stay_booking_hotel = 1

	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Reserva r
		WHERE r.Id_Reserva = @p_stay_booking_id
			AND CAST(r.Fecha_Inicio AS DATE) < CAST(GETDATE() AS DATE))
		SET @p_stay_booking_before = 1

	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Reserva r
		INNER JOIN LA_MAYORIA.Estado_Reserva er
			ON r.Estado = er.Id_Estado
	WHERE r.Id_Reserva = @p_stay_booking_id
		AND UPPER(er.Descripcion) like '%' + 'CANCELADA' + '%')
		SET @p_stay_booking_cancel = 1
END
GO