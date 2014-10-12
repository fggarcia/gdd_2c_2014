/****** Object:  Schema [LA_MINORIA]    Script Date: 04/10/2014 23:39:06 ******/

/****************************************************************/
--						CREAR ESQUEMA
/****************************************************************/

CREATE SCHEMA [LA_MINORIA] AUTHORIZATION [gd]
GO

/****************************************************************/
--				CREAR TABLAS E INSERTAR DATOS
/****************************************************************/

--TABLA Usuario
/*
	Tabla con los usuarios con responsabilidad en el hotel, ya se administrador
	o recepcionista
	Id_Usuario: Id_Usuario
	Password: password encriptada
	Cantidad_Login: cantidad de login incorrectos
	Ultima_Fecha: ultima fecha que se logueo
	Habilitado: Habilitado
*/
CREATE TABLE [LA_MINORIA].[Usuario](
	[Id_Usuario][varchar](20) NOT NULL,
	[Password][varchar](64) NOT NULL,
	[Cantidad_Login][Int] NOT NULL,
	[Ultima_Fecha][datetime] NULL,
	[Habilitado][bit] NULL
	
	CONSTRAINT [PK_Usuario_Id_Usuario] PRIMARY KEY(Id_Usuario),
	CONSTRAINT UQ_Usuarios_Id_Usuario UNIQUE(Id_Usuario)
)

--Se agrega usuario admin con contraseña "shadea" w23e
INSERT INTO LA_MINORIA.Usuario(Id_Usuario,Password, Cantidad_Login) 
VALUES ('admin','e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7', 0)

--TABLA ROL
/*
	Tabla que contiene los tipos de roles que existen
	-Id_Rol: es unica
	-Descripcion: descripción
	-Habilitado: Indica si el rol esta habilitado
*/
CREATE TABLE [LA_MINORIA].[Rol](
	[Id_Rol][Int] NOT NULL,
	[Descripcion][varchar](20) NOT NULL,
	[Habilitado][bit] NULL

	CONSTRAINT [PK_Rol_Id_Rol] PRIMARY KEY(Id_Rol),
	CONSTRAINT UQ_Rol_Id_Rol UNIQUE(Id_Rol)
)

INSERT INTO LA_MINORIA.Rol(Id_Rol,Descripcion,Habilitado) VALUES(1,'administrador',1)
INSERT INTO LA_MINORIA.Rol(Id_Rol,Descripcion,Habilitado) VALUES(2,'recepcionista',1)
INSERT INTO LA_MINORIA.Rol(Id_Rol,Descripcion,Habilitado) VALUES(3,'guest',1)

--TABLA FUNCIONALIDAD
/*
	Tabla que contiene las funcionalidades del sistema a las que se pueden acceder
	-Id_Funcionalidad: es unica
	-Descripcion: Descripcion de la funcionalidad
*/
CREATE TABLE [LA_MINORIA].[Funcionalidad](
	[Id_Funcionalidad][Int] NOT NULL,
	[Descripcion][varchar](40) NOT NULL

	CONSTRAINT [PK_Funcionalidad_Id_Funcionalidad] PRIMARY KEY(Id_Funcionalidad),
	CONSTRAINT UQ_Funcionalidad_Id_Funcionalidad UNIQUE(Id_Funcionalidad)
)

INSERT INTO LA_MINORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(1,'Login y Seguridad')
INSERT INTO LA_MINORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(2,'ABM de Rol')
INSERT INTO LA_MINORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(3,'ABM de Usuario')
INSERT INTO LA_MINORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(4,'ABM de Hotel')

--TABLA ROL_FUNCIONALIDAD
/*
	Tabla que relaciona las funcionalidades del sistema, seguún el rol que se tenga
*/
CREATE TABLE [LA_MINORIA].[Rol_Funcionalidad](
	[Id_Rol][Int] NOT NULL,
	[Id_Funcionalidad][Int] NOT NULL

	CONSTRAINT [PK_Rol_Funcionalidad] PRIMARY KEY (
		[Id_Rol] ASC,
		[Id_Funcionalidad] ASC
	)
	
	CONSTRAINT [FK_Rol_Funcionalidad_Funcionalidad_Id_Funcionalidad] FOREIGN KEY(Id_Funcionalidad)
		REFERENCES [LA_MINORIA].[Funcionalidad] (Id_Funcionalidad),
	CONSTRAINT [FK_Rol_Funcionalidad_Rol_Id_Rol] FOREIGN KEY(Id_Rol)
		REFERENCES [LA_MINORIA].[Rol] (Id_Rol),
	CONSTRAINT UQ_Rol_Funcionalidad_Id_Rol_Id_Funcionalidad UNIQUE(Id_Rol,Id_Funcionalidad)
)

--TABLA USUARIO_ROL
/*
	Tabla que almanena los roles asignados para cada usuario y si este se encuentra habilitado
	Id_Usuario: Id_Usuario
	Id_Rol: Id_Rol
	Habilitado: Habilitado
*/
CREATE TABLE [LA_MINORIA].[Usuario_Rol](
	[Id_Usuario][varchar](20) NOT NULL,
	[Id_Rol][Int] NOT NULL,
	[Habilitado][bit] NULL

	CONSTRAINT UQ_Usuario_Rol_Id_Usuario_Id_Rol UNIQUE(Id_Usuario, Id_Rol),
	CONSTRAINT [FK_Usuario_Rol_Usuario_Id_Usuario] FOREIGN KEY(Id_Usuario)
		REFERENCES [LA_MINORIA].[Usuario] (Id_Usuario),
	CONSTRAINT [FK_Usuario_Rol_Rol_Id_Rol] FOREIGN KEY(Id_Rol)
		REFERENCES [LA_MINORIA].[Rol] (Id_Rol)
)

--Se agrega al usuario admin con el rol de administrador
INSERT INTO LA_MINORIA.Usuario_Rol (Id_Usuario, Id_Rol, Habilitado) values ('admin',1,1)

--TABLA DATOS_USUARIO
/*
	Tabla con los datos personales de los usuarios(administrador, recepcionista)
*/
CREATE TABLE [LA_MINORIA].[Datos_Usuario](
	[Id_Usuario][varchar](20) NOT NULL,
	[Nombre_Apellido][varchar](50) NOT NULL,
	[Tipo_DNI][varchar](10) NOT NULL,
	[Nro_DNI][int] NOT NULL,
	[Telefono][varchar](20) NOT NULL,
	[Direccion][varchar](50) NOT NULL,
	[Fecha_Nacimiento][datetime] NOT NULL

	CONSTRAINT [FK_Datos_Usuario_Id_Usuario] FOREIGN KEY (Id_Usuario)
		REFERENCES [LA_MINORIA].[Usuario](Id_Usuario)
)

--Ingreso datos del usuario administrador
INSERT INTO LA_MINORIA.Datos_Usuario (Id_Usuario, Nombre_Apellido, Tipo_DNI, Nro_DNI, Telefono,
	Direccion, Fecha_Nacimiento)
VALUES ('admin', 'admin','DNI', 1, '1234-5678','Calle Falsa 123, Algun Pais', getdate())

--TABLA HOTEL
/*
	Tabla de los hoteles que se tienen datos
*/
CREATE TABLE [LA_MINORIA].[Hotel](
	[Id_Hotel][Int] IDENTITY(1,1) NOT NULL,
	[Nombre][varchar](255) NULL,
	[Mail][varchar](20) NULL,
	[Telefono][varchar](20) NULL,
	[Calle_Direccion][varchar](255) NOT NULL,
	[Calle_Nro][numeric](18,0) NOT NULL,
	[Ciudad][varchar](255) NOT NULL,
	[Pais][varchar](255) NULL,
	[Fecha_Creacion][datetime] NOT NULL,
	[Habilitado][bit] NOT NULL

	CONSTRAINT UQ_Hotel_Id_Hotel UNIQUE(Id_Hotel),
	CONSTRAINT [PK_Hotel_Calle_Direccion_Calle_Nro_Ciudad] PRIMARY KEY (Calle_Direccion, Calle_Nro, Ciudad)
)

INSERT INTO LA_MINORIA.Hotel (Calle_Direccion, Calle_Nro, Ciudad, Pais, Fecha_Creacion, Habilitado)
SELECT Hotel_Calle,Hotel_Nro_Calle,Hotel_Ciudad,'Argentina',getdate(),1 FROM gd_esquema.Maestra
	GROUP BY Hotel_Calle,Hotel_Nro_Calle,Hotel_Ciudad

--TABLA HOTEL_ESTRELLAS
/*
	Tabla con la cantidad de estrellas y su recargo por hotel
*/
CREATE TABLE [LA_MINORIA].[Hotel_Estrellas](
	[Id_Hotel][Int] NOT NULL,
	[Cantidad_Estrellas][Int] NOT NULL,
	[recarga][numeric](18,0) DEFAULT 0

	CONSTRAINT [FK_Hotel_Estrellas_Id_Hotel] FOREIGN KEY (Id_Hotel)
		REFERENCES [LA_MINORIA].[Hotel](Id_Hotel),
	CONSTRAINT UQ_Hotel_Estrellas_Id_Hotel UNIQUE (Id_Hotel)
)

INSERT INTO LA_MINORIA.Hotel_Estrellas (Id_Hotel, Cantidad_Estrellas, recarga)
SELECT h.Id_Hotel, m.Hotel_CantEstrella, m.Hotel_Recarga_Estrella FROM LA_MINORIA.hotel h LEFT JOIN gd_esquema.Maestra m
	ON h.Calle_Direccion = m.Hotel_Calle AND h.Calle_Nro = m.Hotel_Nro_Calle AND h.Ciudad = m.Hotel_Ciudad
	GROUP BY h.Id_Hotel, h.Calle_Direccion, h.Calle_Nro, h.Ciudad, m.Hotel_CantEstrella, m.Hotel_Recarga_Estrella

--TABLA USUARIO_HOTEL
/*
	Tabla con los hoteles a los cuales esta asignado cada usuario
*/
CREATE TABLE [LA_MINORIA].[Usuario_Hotel](
	[Id_Usuario][varchar](20) NOT NULL,
	[Id_Hotel][Int] NOT NULL,
	[Habilitado][bit] NOT NULL

	CONSTRAINT [FK_Usuario_Hotel_Id_Usuario] FOREIGN KEY (Id_Usuario)
		REFERENCES [LA_MINORIA].[Usuario](Id_Usuario),
	CONSTRAINT [FK_Usuario_Hotel_Id_Hotel] FOREIGN KEY (Id_Hotel)
		REFERENCES [LA_MINORIA].[Hotel](Id_Hotel),
	CONSTRAINT UQ_Usuario_Hotel_Id_Usuario_Id_Hotel UNIQUE(Id_Usuario, Id_Hotel)
)


--TABLA REGIMEN
/*
	Tabla con todos los regimen disponibles
	NOTA: En la base de datos todos los regimenes son iguales para los hoteles,
	no es que hay un codigo de regimen en dos hoteles distintos con distintos valores
*/
CREATE TABLE [LA_MINORIA].[Regimen](
	[Id_Regimen][Int]IDENTITY(1,1) NOT NULL,
	[Descripcion][varchar](255) NOT NULL,
	[Precio][numeric](18,2) NOT NULL,
	[Habilitado][bit] NOT NULL

	CONSTRAINT [PK_Regimen_Id_Regimen] PRIMARY KEY (Id_Regimen),
	CONSTRAINT UQ_Regimen_Descripcion UNIQUE(Descripcion)
)

INSERT INTO LA_MINORIA.Regimen (Descripcion,Precio,Habilitado)
SELECT UPPER(LTRIM(RTRIM(Regimen_Descripcion))), Regimen_Precio, 1 FROM gd_esquema.Maestra WHERE Regimen_Descripcion IS NOT NULL
GROUP BY Regimen_Descripcion, Regimen_Precio

--TABLA REGIMEN_HOTEL
/*
	Tabla que almancena los regimenes disponibles para cada hotel
*/

CREATE TABLE [LA_MINORIA].[Regimen_Hotel](
	[Id_Hotel][Int] NOT NULL,
	[Id_Regimen][Int] NOT NULL

	CONSTRAINT [FK_Regimen_Hotel_Id_Hotel] FOREIGN KEY (Id_Hotel)
		REFERENCES [LA_MINORIA].[Hotel](Id_Hotel),
	CONSTRAINT [FK_Regimen_Hotel_Id_Regimen] FOREIGN KEY (Id_Regimen)
		REFERENCES [LA_MINORIA].[Regimen](Id_Regimen),
	CONSTRAINT UQ_Regimen_Hotel_Id_Hotel_Id_Regimen UNIQUE(Id_Hotel, Id_Regimen)
)

INSERT INTO LA_MINORIA.Regimen_Hotel (Id_Hotel, Id_Regimen)
SELECT h.Id_Hotel, r.Id_Regimen FROM LA_MINORIA.Hotel h INNER JOIN gd_esquema.Maestra m
	ON h.Calle_Direccion = m.Hotel_Calle AND h.Calle_Nro = m.Hotel_Nro_Calle
	AND h.Ciudad = m.Hotel_Ciudad
	AND m.Regimen_Descripcion IS NOT NULL
	INNER JOIN LA_MINORIA.Regimen r ON UPPER(LTRIM(RTRIM(m.Regimen_Descripcion))) = UPPER(LTRIM(RTRIM(r.Descripcion)))
	GROUP BY h.Id_Hotel, r.Id_Regimen


--TABLA TIPO_HABITACION
/*
	Tabla con los distintos tipos de habitaciones que existen
*/
CREATE TABLE [LA_MINORIA].[Tipo_Habitacion](
	[Id_Tipo_Habitacion][numeric](18,0) NOT NULL,
	[Descripcion][varchar](255) NOT NULL,
	[Porcentual][numeric](18,2) NOT NULL

	CONSTRAINT UQ_Tipo_Habitacion_Id_Tipo_Habitacion UNIQUE (Id_Tipo_Habitacion)
)

INSERT INTO LA_MINORIA.Tipo_Habitacion (Id_Tipo_Habitacion, Descripcion, Porcentual)
SELECT m.Habitacion_Tipo_Codigo, UPPER(LTRIM(RTRIM(m.Habitacion_Tipo_Descripcion))), m.Habitacion_Tipo_Porcentual
	FROM gd_esquema.Maestra m WHERE 
	m.Habitacion_Tipo_Descripcion IS NOT NULL
	GROUP BY m.Habitacion_Tipo_Codigo,m.Habitacion_Tipo_Descripcion, m.Habitacion_Tipo_Porcentual


--TABLA HABITACION
/*
	Tabla con cada habitacion dependiendo del hotel
*/
CREATE TABLE [LA_MINORIA].[Habitacion](
	[Id_Hotel][Int] NOT NULL,
	[Nro][Int] NOT NULL,
	[Piso][Int] NOT NULL,
	[Frente][char](1) NOT NULL,
	[Habilitado][bit] NOT NULL

	CONSTRAINT [FK_Habitacion_Id_Hotel] FOREIGN KEY (Id_Hotel)
		REFERENCES [LA_MINORIA].[Hotel](Id_Hotel),
	CONSTRAINT [PK_Habitacion_Id_Hotel_Nro_Piso] PRIMARY KEY(Id_Hotel, Nro, Piso)
)

INSERT INTO LA_MINORIA.Habitacion (Id_Hotel, Nro, Piso, Frente, Habilitado)
SELECT h.Id_Hotel, m.Habitacion_Numero, m.Habitacion_Piso, m.Habitacion_Frente, 1 
	FROM LA_MINORIA.Hotel h INNER JOIN gd_esquema.Maestra m
		ON h.Calle_Direccion = m.Hotel_Calle AND h.Calle_Nro = m.Hotel_Nro_Calle
		AND h.Ciudad = m.Hotel_Ciudad AND m.Habitacion_Numero IS NOT NULL
	GROUP BY h.Id_Hotel, m.Habitacion_Numero, m.Habitacion_Piso, m.Habitacion_Frente

--TABLA DOCUMENTOS
/*
	Tabla de parametria de tipos de documentos
*/
CREATE TABLE [LA_MINORIA].[Tipo_Identificacion](
	[Id_Tipo_Identificacion][Int]IDENTITY(1,1) NOT NULL,
	[Descripcion][varchar](255) NOT NULL

	CONSTRAINT [PK_Tipo_Identificacion_Id_Tipo_Identificacion] PRIMARY KEY (Id_Tipo_Identificacion),
	CONSTRAINT UQ_Tipo_Identificacion_Descripcion UNIQUE (Descripcion)
)

INSERT INTO LA_MINORIA.Tipo_Identificacion (Descripcion)
VALUES ('PASAPORTE ARGENTINA')

--TABLA NACIONALIDAD
/*
	Tabla de parametria de las nacionalidades
*/
CREATE TABLE [LA_MINORIA].[Nacionalidad](
	[Id_Nacionalidad][Int]IDENTITY(1,1) NOT NULL,
	[Descripcion][varchar](255) NOT NULL

	CONSTRAINT [PK_Nacionalidad_Id_Nacionalidad] PRIMARY KEY (Id_Nacionalidad),
	CONSTRAINT UQ_Nacionalidad_Descripcion UNIQUE (Descripcion)
)

INSERT INTO LA_MINORIA.Nacionalidad (Descripcion)
SELECT DISTINCT(UPPER(LTRIM(RTRIM(m.Cliente_Nacionalidad)))) 
	FROM gd_esquema.Maestra m
	WHERE m.Cliente_Nacionalidad IS NOT NULL

--TABLA TEMP_CLIENTES
/*
	Tabla temporal para migrar los clientes
*/
CREATE TABLE [LA_MINORIA].[Temp_Clientes](
	[Nombre][varchar](255) NOT NULL,
	[Apellido][varchar](255) NOT NULL,
	[Nro_Identificacion][numeric](18,0) NOT NULL,
	[Mail][varchar](255) NOT NULL,
	[Telefono][varchar](255),
	[Calle_Direccion][varchar](255) NOT NULL,
	[Calle_Nro][numeric](18,0) NOT NULL,
	[Calle_Piso][numeric](18,0),
	[Calle_Depto][varchar](50),
	[Nacionalidad][varchar](255) NOT NULL,
	[Fecha_Nacimiento][datetime] NOT NULL,
)
INSERT INTO LA_MINORIA.Temp_Clientes (Nombre, Apellido, Nro_Identificacion, Mail, Calle_Direccion, Calle_Nro,
	Calle_Piso, Calle_Depto, Nacionalidad, Fecha_Nacimiento)
SELECT Cliente_Nombre, Cliente_Apellido, Cliente_Pasaporte_Nro, Cliente_Mail, Cliente_Dom_Calle, Cliente_Nro_Calle,
	Cliente_Piso, Cliente_Depto, Cliente_Nacionalidad, Cliente_Fecha_Nac FROM gd_esquema.Maestra WHERE Cliente_Nombre IS NOT NULL
GROUP BY Cliente_Pasaporte_Nro, Cliente_Nombre, Cliente_Apellido, Cliente_Mail, Cliente_Dom_Calle, Cliente_Nro_Calle,
	Cliente_Piso, Cliente_Depto, Cliente_Nacionalidad, Cliente_Fecha_Nac

--TABLA CLIENTES
/*
	Tabla con los datos personales de los clientes registrados en el sistema
*/
CREATE TABLE [LA_MINORIA].[Clientes](
	[Id_Cliente][Int]IDENTITY(1,1) NOT NULL,
	[Nombre][varchar](255) NOT NULL,
	[Apellido][varchar](255) NOT NULL,
	[Tipo_Identificacion][Int] NOT NULL,
	[Nro_Identificacion][numeric](18,0) NOT NULL,
	[Mail][varchar](255) NOT NULL,
	[Telefono][varchar](255),
	[Calle_Direccion][varchar](255) NOT NULL,
	[Calle_Nro][numeric](18,0) NOT NULL,
	[Calle_Piso][numeric](18,0),
	[Calle_Depto][varchar](50),
	[Nacionalidad][Int] NOT NULL,
	[Fecha_Nacimiento][datetime] NOT NULL,
	[Habilitado][bit] NOT NULL

	CONSTRAINT [FK_Clientes_Tipo_Identificacion] FOREIGN KEY (Tipo_Identificacion)
		REFERENCES [LA_MINORIA].[Tipo_Identificacion](Id_Tipo_Identificacion),
	CONSTRAINT [FK_Clientes_Nacionalidad] FOREIGN KEY (Nacionalidad)
		REFERENCES [LA_MINORIA].[Nacionalidad](Id_Nacionalidad),
	CONSTRAINT [PK_Clientes_Tipo_Identificacion_Nro_Identificacion] PRIMARY KEY (Tipo_Identificacion, Nro_Identificacion),
	CONSTRAINT UQ_Clientes_Mail UNIQUE (Mail)
)

INSERT INTO LA_MINORIA.Clientes (Nombre, Apellido, Tipo_Identificacion, Nro_Identificacion, Mail, Telefono, Calle_Direccion, Calle_Nro,
	Calle_Piso, Calle_Depto, Nacionalidad, Fecha_Nacimiento, Habilitado)
SELECT tc.Nombre, tc.Apellido, ti.Id_Tipo_Identificacion, tc.Nro_Identificacion, tc.Mail, tc.Telefono, tc.Calle_Direccion,
	tc.Calle_Nro, tc.Calle_Piso, tc.Calle_Depto, n.Id_Nacionalidad, tc.Fecha_Nacimiento, 1
	FROM LA_MINORIA.Temp_Clientes tc
		INNER JOIN LA_MINORIA.Tipo_Identificacion ti ON ti.Descripcion = 'PASAPORTE ARGENTINA'
		INNER JOIN LA_MINORIA.Nacionalidad n ON UPPER(LTRIM(RTRIM(tc.Nacionalidad))) = UPPER(n.Descripcion)

/* TODO: Pensar un fix para el nro de pasaporte = 1652782 */

--ELIMINO TABLA TEMPORAL DE CLIENTES
DROP TABLE LA_MINORIA.Temp_Clientes

--TABLA HISTORIAL_BAJA_HOTEL
/*
	Tabla con los registros de baja momentanea del hotel, con sus respectivos momentos
*/
CREATE TABLE [LA_MINORIA].[Historial_Baja_Hotel](
	[Id_Hotel][Int] NOT NULL,
	[Fecha_Inicio][datetime] NOT NULL,
	[Fecha_Fin][datetime] NOT NULL,
	[Motivo][varchar](255) NOT NULL

	CONSTRAINT [FK_Historial_Baja_Hotel_Id_Hotel] FOREIGN KEY (Id_Hotel)
		REFERENCES [LA_MINORIA].[Hotel](Id_Hotel)
)

