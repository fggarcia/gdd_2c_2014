/****** Object:  Schema [LA_MAYORIA]    Script Date: 04/10/2014 23:39:06 ******/

/****************************************************************/
--						CREAR ESQUEMA
/****************************************************************/

CREATE SCHEMA [LA_MAYORIA] AUTHORIZATION [gd]
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
CREATE TABLE [LA_MAYORIA].[Usuario](
	[Id_Usuario][varchar](20) NOT NULL,
	[Password][varchar](64) NOT NULL,
	[Cantidad_Login][Int] NOT NULL,
	[Ultima_Fecha][datetime] NULL,
	[Habilitado][bit] NULL
	
	CONSTRAINT [PK_Usuario_Id_Usuario] PRIMARY KEY(Id_Usuario),
	CONSTRAINT UQ_Usuarios_Id_Usuario UNIQUE(Id_Usuario)
)

--Se agrega usuario admin con contraseña "shadea" w23e
INSERT INTO LA_MAYORIA.Usuario(Id_Usuario,Password, Cantidad_Login, Habilitado) 
VALUES ('admin','e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7', 0, 1)

--TABLA ROL
/*
	Tabla que contiene los tipos de roles que existen
	-Id_Rol: es unica
	-Descripcion: descripción
	-Habilitado: Indica si el rol esta habilitado
*/
CREATE TABLE [LA_MAYORIA].[Rol](
	[Id_Rol][Int]IDENTITY(1,1) NOT NULL,
	[Descripcion][varchar](20) NOT NULL,
	[Habilitado][bit] NULL

	CONSTRAINT [PK_Rol_Id_Rol] PRIMARY KEY(Id_Rol),
	CONSTRAINT UQ_Rol_Id_Rol UNIQUE(Id_Rol)
)

INSERT INTO LA_MAYORIA.Rol(Descripcion,Habilitado) VALUES('administrador',1)
INSERT INTO LA_MAYORIA.Rol(Descripcion,Habilitado) VALUES('recepcionista',1)
INSERT INTO LA_MAYORIA.Rol(Descripcion,Habilitado) VALUES('guest',1)

--TABLA FUNCIONALIDAD
/*
	Tabla que contiene las funcionalidades del sistema a las que se pueden acceder
	-Id_Funcionalidad: es unica
	-Descripcion: Descripcion de la funcionalidad
*/
CREATE TABLE [LA_MAYORIA].[Funcionalidad](
	[Id_Funcionalidad][Int] NOT NULL,
	[Descripcion][varchar](40) NOT NULL

	CONSTRAINT [PK_Funcionalidad_Id_Funcionalidad] PRIMARY KEY(Id_Funcionalidad),
	CONSTRAINT UQ_Funcionalidad_Id_Funcionalidad UNIQUE(Id_Funcionalidad)
)

INSERT INTO LA_MAYORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(1,'Login y Seguridad')
INSERT INTO LA_MAYORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(2,'ABM de Rol')
INSERT INTO LA_MAYORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(3,'ABM de Usuario')
INSERT INTO LA_MAYORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(4,'ABM de Hotel')
INSERT INTO LA_MAYORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(5,'ABM de Cliente')
INSERT INTO LA_MAYORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(6,'ABM de Habitacion')
INSERT INTO LA_MAYORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(7,'ABM de Regimen')
INSERT INTO LA_MAYORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(8,'ABM de Reserva')
INSERT INTO LA_MAYORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(9,'Cancelar Reserva')
INSERT INTO LA_MAYORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(10,'Registrar Estadía')
INSERT INTO LA_MAYORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(11,'Registrar Consumibles')
INSERT INTO LA_MAYORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(12,'Facturar Publicaciones')
INSERT INTO LA_MAYORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(13,'Listado Estadistico')

--TABLA ROL_FUNCIONALIDAD
/*
	Tabla que relaciona las funcionalidades del sistema, seguún el rol que se tenga
*/
CREATE TABLE [LA_MAYORIA].[Rol_Funcionalidad](
	[Id_Rol][Int] NOT NULL,
	[Id_Funcionalidad][Int] NOT NULL

	CONSTRAINT [PK_Rol_Funcionalidad] PRIMARY KEY (
		[Id_Rol] ASC,
		[Id_Funcionalidad] ASC
	)
	
	CONSTRAINT [FK_Rol_Funcionalidad_Funcionalidad_Id_Funcionalidad] FOREIGN KEY(Id_Funcionalidad)
		REFERENCES [LA_MAYORIA].[Funcionalidad] (Id_Funcionalidad),
	CONSTRAINT [FK_Rol_Funcionalidad_Rol_Id_Rol] FOREIGN KEY(Id_Rol)
		REFERENCES [LA_MAYORIA].[Rol] (Id_Rol),
	CONSTRAINT UQ_Rol_Funcionalidad_Id_Rol_Id_Funcionalidad UNIQUE(Id_Rol,Id_Funcionalidad)
)

INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (1, 1)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (1, 2)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (1, 3)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (1, 4)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (1, 5)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (1, 6)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (1, 7)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (1, 9)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (1, 13)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (2, 1)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (2, 8)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (2, 9)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (2,10)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (2,11)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (2,12)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (3, 8)
INSERT INTO LA_MAYORIA.Rol_Funcionalidad(Id_Rol, Id_Funcionalidad) VALUES (3, 9)

--TABLA DOCUMENTOS
/*
	Tabla de parametria de tipos de documentos
*/
CREATE TABLE [LA_MAYORIA].[Tipo_Identificacion](
	[Id_Tipo_Identificacion][Int]IDENTITY(1,1) NOT NULL,
	[Descripcion][varchar](255) NOT NULL

	CONSTRAINT [PK_Tipo_Identificacion_Id_Tipo_Identificacion] PRIMARY KEY (Id_Tipo_Identificacion),
	CONSTRAINT UQ_Tipo_Identificacion_Descripcion UNIQUE (Descripcion)
)

INSERT INTO LA_MAYORIA.Tipo_Identificacion (Descripcion)
VALUES ('PASAPORTE ARGENTINA')

--TABLA DATOS_USUARIO
/*
	Tabla con los datos personales de los usuarios(administrador, recepcionista)
*/
CREATE TABLE [LA_MAYORIA].[Datos_Usuario](
	[Id_Usuario][varchar](20) NOT NULL,
	[Nombre_Apellido][varchar](50) NOT NULL,
	[Mail][varchar](255) NOT NULL,
	[Tipo_DNI][Int] NOT NULL,
	[Nro_DNI][int] NOT NULL,
	[Telefono][varchar](20) NOT NULL,
	[Direccion][varchar](50) NOT NULL,
	[Fecha_Nacimiento][datetime] NOT NULL

	CONSTRAINT [FK_Datos_Usuario_Id_Usuario] FOREIGN KEY (Id_Usuario)
		REFERENCES [LA_MAYORIA].[Usuario](Id_Usuario)
)

--Ingreso datos del usuario administrador
INSERT INTO LA_MAYORIA.Datos_Usuario (Id_Usuario, Nombre_Apellido, Mail, Tipo_DNI, Nro_DNI, Telefono,
	Direccion, Fecha_Nacimiento)
VALUES ('admin', 'admin', 'test@gmail.com' ,1, 1, '1234-5678','Calle Falsa 123, Algun Pais', getdate())

--TABLA HOTEL
/*
	Tabla de los hoteles que se tienen datos
*/
CREATE TABLE [LA_MAYORIA].[Hotel](
	[Id_Hotel][Int] IDENTITY(1,1) NOT NULL,
	[Nombre][varchar](255) NULL,
	[Mail][varchar](20) NULL,
	[Telefono][varchar](20) NULL,
	[Calle_Direccion][varchar](255) NOT NULL,
	[Calle_Nro][numeric](18,0) NOT NULL,
	[Ciudad][varchar](255) NOT NULL,
	[Pais][varchar](255) NULL,
	[Fecha_Creacion][datetime] NOT NULL

	CONSTRAINT UQ_Hotel_Id_Hotel UNIQUE(Id_Hotel),
	CONSTRAINT [PK_Hotel_Calle_Direccion_Calle_Nro_Ciudad] PRIMARY KEY (Calle_Direccion, Calle_Nro, Ciudad)
)

INSERT INTO LA_MAYORIA.Hotel (Calle_Direccion, Calle_Nro, Ciudad, Pais, Fecha_Creacion)
SELECT Hotel_Calle,Hotel_Nro_Calle,Hotel_Ciudad,'Argentina',getdate() FROM gd_esquema.Maestra
	GROUP BY Hotel_Calle,Hotel_Nro_Calle,Hotel_Ciudad

CREATE TABLE [LA_MAYORIA].[Estrellas](
	[Estrellas][Int] NOT NULL,

	CONSTRAINT UQ_Estrellas_Estrellas UNIQUE (Estrellas)
)

INSERT INTO LA_MAYORIA.Estrellas (Estrellas) VALUES (1)
INSERT INTO LA_MAYORIA.Estrellas (Estrellas) VALUES (2)
INSERT INTO LA_MAYORIA.Estrellas (Estrellas) VALUES (3)
INSERT INTO LA_MAYORIA.Estrellas (Estrellas) VALUES (4)
INSERT INTO LA_MAYORIA.Estrellas (Estrellas) VALUES (5)

--TABLA HOTEL_ESTRELLAS
/*
	Tabla con la cantidad de estrellas y su recargo por hotel
*/
CREATE TABLE [LA_MAYORIA].[Hotel_Estrellas](
	[Id_Hotel][Int] NOT NULL,
	[Cantidad_Estrellas][Int] NOT NULL,
	[recarga][numeric](18,0) DEFAULT 0

	CONSTRAINT [FK_Hotel_Estrellas_Id_Hotel] FOREIGN KEY (Id_Hotel)
		REFERENCES [LA_MAYORIA].[Hotel](Id_Hotel),
	CONSTRAINT [FK_Hotel_Estrellas_Estrellas] FOREIGN KEY (Cantidad_Estrellas)
		REFERENCES [LA_MAYORIA].[Estrellas](Estrellas),
	CONSTRAINT UQ_Hotel_Estrellas_Id_Hotel UNIQUE (Id_Hotel, Cantidad_Estrellas)
)

INSERT INTO LA_MAYORIA.Hotel_Estrellas (Id_Hotel, Cantidad_Estrellas, recarga)
SELECT h.Id_Hotel, m.Hotel_CantEstrella, m.Hotel_Recarga_Estrella FROM LA_MAYORIA.hotel h LEFT JOIN gd_esquema.Maestra m
	ON h.Calle_Direccion = m.Hotel_Calle AND h.Calle_Nro = m.Hotel_Nro_Calle AND h.Ciudad = m.Hotel_Ciudad
	GROUP BY h.Id_Hotel, h.Calle_Direccion, h.Calle_Nro, h.Ciudad, m.Hotel_CantEstrella, m.Hotel_Recarga_Estrella

--TABLA USUARIO_ROL_HOTEL
/*
	Tabla que almanena los roles asignados para cada usuario y hotel y si este se encuentra habilitado
	Id_Usuario: Id_Usuario
	Id_Rol: Id_Rol
	Id_Hotel: Id_Hotel
	Habilitado: Habilitado
*/
CREATE TABLE [LA_MAYORIA].[Usuario_Rol_Hotel](
	[Id_Usuario][varchar](20) NOT NULL,
	[Id_Rol][Int] NOT NULL,
	[Id_Hotel][Int] NOT NULL,
	[Habilitado][bit] NULL

	CONSTRAINT UQ_Usuario_Rol_Id_Usuario_Id_Rol_Id_Hotel UNIQUE(Id_Usuario, Id_Rol, Id_Hotel),
	CONSTRAINT [FK_Usuario_Rol_Hotel_Usuario_Id_Usuario] FOREIGN KEY(Id_Usuario)
		REFERENCES [LA_MAYORIA].[Usuario] (Id_Usuario),
	CONSTRAINT [FK_Usuario_Rol_Hotel_Hotel_Id_Hotel] FOREIGN KEY (Id_Hotel)
		REFERENCES [LA_MAYORIA].[Hotel] (Id_Hotel),
	CONSTRAINT [FK_Usuario_Rol_Hotel_Id_Rol] FOREIGN KEY(Id_Rol)
		REFERENCES [LA_MAYORIA].[Rol] (Id_Rol)
)

--Se agrega al usuario admin con el rol de administrador
INSERT INTO LA_MAYORIA.Usuario_Rol_Hotel (Id_Usuario, Id_Rol, Id_Hotel, Habilitado) values ('admin',1,1,1)
INSERT INTO LA_MAYORIA.Usuario_Rol_Hotel (Id_Usuario, Id_Rol, Id_Hotel, Habilitado) values ('admin',2,1,1)

--TABLA REGIMEN
/*
	Tabla con todos los regimen disponibles
	NOTA: En la base de datos todos los regimenes son iguales para los hoteles,
	no es que hay un codigo de regimen en dos hoteles distintos con distintos valores
*/
CREATE TABLE [LA_MAYORIA].[Regimen](
	[Id_Regimen][Int]IDENTITY(1,1) NOT NULL,
	[Descripcion][varchar](255) NOT NULL,
	[Precio][numeric](18,2) NOT NULL,
	[Habilitado][bit] NOT NULL

	CONSTRAINT [PK_Regimen_Id_Regimen] PRIMARY KEY (Id_Regimen),
	CONSTRAINT UQ_Regimen_Descripcion UNIQUE(Descripcion)
)

INSERT INTO LA_MAYORIA.Regimen (Descripcion,Precio,Habilitado)
SELECT UPPER(LTRIM(RTRIM(Regimen_Descripcion))), Regimen_Precio, 1 FROM gd_esquema.Maestra WHERE Regimen_Descripcion IS NOT NULL
GROUP BY Regimen_Descripcion, Regimen_Precio

--TABLA REGIMEN_HOTEL
/*
	Tabla que almancena los regimenes disponibles para cada hotel
*/

CREATE TABLE [LA_MAYORIA].[Regimen_Hotel](
	[Id_Hotel][Int] NOT NULL,
	[Id_Regimen][Int] NOT NULL

	CONSTRAINT [FK_Regimen_Hotel_Id_Hotel] FOREIGN KEY (Id_Hotel)
		REFERENCES [LA_MAYORIA].[Hotel](Id_Hotel),
	CONSTRAINT [FK_Regimen_Hotel_Id_Regimen] FOREIGN KEY (Id_Regimen)
		REFERENCES [LA_MAYORIA].[Regimen](Id_Regimen),
	CONSTRAINT UQ_Regimen_Hotel_Id_Hotel_Id_Regimen UNIQUE(Id_Hotel, Id_Regimen)
)

INSERT INTO LA_MAYORIA.Regimen_Hotel (Id_Hotel, Id_Regimen)
SELECT h.Id_Hotel, r.Id_Regimen FROM LA_MAYORIA.Hotel h INNER JOIN gd_esquema.Maestra m
	ON h.Calle_Direccion = m.Hotel_Calle AND h.Calle_Nro = m.Hotel_Nro_Calle
	AND h.Ciudad = m.Hotel_Ciudad
	AND m.Regimen_Descripcion IS NOT NULL
	INNER JOIN LA_MAYORIA.Regimen r ON UPPER(LTRIM(RTRIM(m.Regimen_Descripcion))) = UPPER(LTRIM(RTRIM(r.Descripcion)))
	GROUP BY h.Id_Hotel, r.Id_Regimen


--TABLA TIPO_HABITACION
/*
	Tabla con los distintos tipos de habitaciones que existen
*/
CREATE TABLE [LA_MAYORIA].[Tipo_Habitacion](
	[Id_Tipo_Habitacion][numeric](18,0) NOT NULL,
	[Descripcion][varchar](255) NOT NULL,
	[Cupo][Int] NOT NULL,
	[Porcentual][numeric](18,2) NOT NULL

	CONSTRAINT UQ_Tipo_Habitacion_Id_Tipo_Habitacion UNIQUE (Id_Tipo_Habitacion)
)

INSERT INTO LA_MAYORIA.Tipo_Habitacion (Id_Tipo_Habitacion, Descripcion, Cupo, Porcentual)
SELECT m.Habitacion_Tipo_Codigo, UPPER(LTRIM(RTRIM(m.Habitacion_Tipo_Descripcion))), 
	SUBSTRING(LTRIM(RTRIM(STR(m.Habitacion_Tipo_Codigo))),4,1), m.Habitacion_Tipo_Porcentual
	FROM gd_esquema.Maestra m WHERE 
	m.Habitacion_Tipo_Descripcion IS NOT NULL
	GROUP BY m.Habitacion_Tipo_Codigo,m.Habitacion_Tipo_Descripcion, m.Habitacion_Tipo_Porcentual

--TABLA HISTORIAL_BAJA_HOTEL
/*
	Tabla con los registros de baja momentanea del hotel, con sus respectivos momentos
*/
CREATE TABLE [LA_MAYORIA].[Historial_Baja_Hotel](
	[Id_Hotel][Int] NOT NULL,
	[Fecha_Inicio][datetime] NOT NULL,
	[Fecha_Fin][datetime] NOT NULL,
	[Motivo][varchar](255) NOT NULL,
	[Id_Usuario][varchar](20) NOT NULL

	CONSTRAINT [FK_Historial_Baja_Hotel_Id_Hotel] FOREIGN KEY (Id_Hotel)
		REFERENCES [LA_MAYORIA].[Hotel](Id_Hotel),
	CONSTRAINT [FK_Historial_Baja_Hotel_Id_Usuario] FOREIGN KEY (Id_Usuario)
		REFERENCES [LA_MAYORIA].[Usuario](Id_Usuario)
)

--TABLA FRENTE
/*
	Parametria de tipo de frente
*/
CREATE TABLE [LA_MAYORIA].[Frente](
	[Id_Frente][Int]IDENTITY(1,1) NOT NULL,
	[Descripcion][Varchar](255) NOT NULL

	CONSTRAINT [UQ_Frente_Descripcion] UNIQUE (Descripcion)
)

INSERT INTO LA_MAYORIA.Frente (Descripcion) VALUES ('S')
INSERT INTO LA_MAYORIA.Frente (Descripcion) VALUES ('N')

--TABLA HABITACION
/*
	Tabla con cada habitacion dependiendo del hotel
*/
CREATE TABLE [LA_MAYORIA].[Habitacion](
	[Id_Hotel][Int] NOT NULL,
	[Nro][Int] NOT NULL,
	[Piso][Int] NOT NULL,
	[Frente][int] NOT NULL,
	[Tipo_Habitacion][numeric](18,0) NOT NULL,
	[Comodidades][varchar](255)

	CONSTRAINT [FK_Habitacion_Id_Hotel] FOREIGN KEY (Id_Hotel)
		REFERENCES [LA_MAYORIA].[Hotel](Id_Hotel),
	CONSTRAINT [FK_Habitacion_Tipo_Habitacion] FOREIGN KEY (Tipo_Habitacion)
		REFERENCES [LA_MAYORIA].[Tipo_Habitacion](Id_Tipo_Habitacion),
	CONSTRAINT [PK_Habitacion_Id_Hotel_Nro_Piso] PRIMARY KEY(Id_Hotel, Nro, Piso)
)

INSERT INTO LA_MAYORIA.Habitacion (Id_Hotel, Nro, Piso, Frente, Tipo_Habitacion)
SELECT h.Id_Hotel, m.Habitacion_Numero, m.Habitacion_Piso, f.Id_Frente, th.Id_Tipo_Habitacion
	FROM LA_MAYORIA.Hotel h INNER JOIN gd_esquema.Maestra m
		ON h.Calle_Direccion = m.Hotel_Calle AND h.Calle_Nro = m.Hotel_Nro_Calle
		AND h.Ciudad = m.Hotel_Ciudad AND m.Habitacion_Numero IS NOT NULL
		INNER JOIN LA_MAYORIA.Tipo_Habitacion th 
		ON m.Habitacion_Tipo_Codigo = th.Id_Tipo_Habitacion
			AND m.Habitacion_Tipo_Descripcion = th.Descripcion
		INNER JOIN LA_MAYORIA.Frente f
		ON UPPER(LTRIM(RTRIM(f.Descripcion))) = UPPER(LTRIM(RTRIM(m.Habitacion_Frente)))
	GROUP BY h.Id_Hotel, m.Habitacion_Numero, m.Habitacion_Piso, f.Id_Frente, th.Id_Tipo_Habitacion

--TABLA HISTORIAL_BAJA_HABITACION
/*
	Tabla con los registros de baja momentanea de las habitaciones, con sus respectivos momentos	
*/

CREATE TABLE [LA_MAYORIA].[Historial_Baja_Habitacion](
	[Id_Hotel][Int] NOT NULL,
	[Habitacion_Nro][Int] NOT NULL,
	[Habitacion_Piso][Int] NOT NULL,
	[Fecha_Inicio][datetime] NOT NULL,
	[Fecha_Fin][datetime] NOT NULL,
	[Motivo][varchar](255) NOT NULL,
	[Id_Usuario][varchar](20) NOT NULL
	
	CONSTRAINT [PK_Historial_Baja_Habitacion_Id_hotel_Habitacion_Nro_Habitacion_Piso] PRIMARY KEY
		(Id_Hotel, Habitacion_Nro, Habitacion_Piso),
	CONSTRAINT [FK_Historial_Baja_Habitacion_Id_hotel_Habitacion_Nro_Habitacion_Piso] FOREIGN KEY 
		(Id_Hotel, Habitacion_Nro, Habitacion_Piso) REFERENCES
		[LA_MAYORIA].[Habitacion](Id_Hotel,Nro,Piso),
	CONSTRAINT [FK_Historial_Baja_Habitacion_Id_Usuario] FOREIGN KEY (Id_Usuario)
		REFERENCES [LA_MAYORIA].[Usuario](Id_Usuario)
)

--TABLA NACIONALIDAD
/*
	Tabla de parametria de las nacionalidades
*/
CREATE TABLE [LA_MAYORIA].[Nacionalidad](
	[Id_Nacionalidad][Int]IDENTITY(1,1) NOT NULL,
	[Descripcion][varchar](255) NOT NULL

	CONSTRAINT [PK_Nacionalidad_Id_Nacionalidad] PRIMARY KEY (Id_Nacionalidad),
	CONSTRAINT UQ_Nacionalidad_Descripcion UNIQUE (Descripcion)
)

INSERT INTO LA_MAYORIA.Nacionalidad (Descripcion)
SELECT DISTINCT(UPPER(LTRIM(RTRIM(m.Cliente_Nacionalidad)))) 
	FROM gd_esquema.Maestra m
	WHERE m.Cliente_Nacionalidad IS NOT NULL

--TABLA TEMP_CLIENTES
/*
	Tabla temporal para migrar los clientes
*/
CREATE TABLE [LA_MAYORIA].[Temp_Clientes](
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
INSERT INTO LA_MAYORIA.Temp_Clientes (Nombre, Apellido, Nro_Identificacion, Mail, Calle_Direccion, Calle_Nro,
	Calle_Piso, Calle_Depto, Nacionalidad, Fecha_Nacimiento)
SELECT DISTINCT Cliente_Nombre, Cliente_Apellido, Cliente_Pasaporte_Nro, Cliente_Mail, Cliente_Dom_Calle, Cliente_Nro_Calle,
	Cliente_Piso, Cliente_Depto, Cliente_Nacionalidad, Cliente_Fecha_Nac FROM gd_esquema.Maestra WHERE Cliente_Nombre IS NOT NULL
	AND Estadia_Fecha_Inicio IS NULL

--TABLA CLIENTES
/*
	Tabla con los datos personales de los clientes registrados en el sistema
*/
CREATE TABLE [LA_MAYORIA].[Clientes](
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

	CONSTRAINT [PK_Clientes_Id_Cliente] PRIMARY KEY (Id_Cliente),
	CONSTRAINT [FK_Clientes_Tipo_Identificacion] FOREIGN KEY (Tipo_Identificacion)
		REFERENCES [LA_MAYORIA].[Tipo_Identificacion](Id_Tipo_Identificacion),
	CONSTRAINT [FK_Clientes_Nacionalidad] FOREIGN KEY (Nacionalidad)
		REFERENCES [LA_MAYORIA].[Nacionalidad](Id_Nacionalidad),
	--CONSTRAINT [UQ_Clientes_Tipo_Identificacion_Nro_Identificacion] UNIQUE (Tipo_Identificacion, Nro_Identificacion),
	--CONSTRAINT UQ_Clientes_Mail UNIQUE (Mail)
)


INSERT INTO LA_MAYORIA.Clientes (Nombre, Apellido, Tipo_Identificacion, Nro_Identificacion, Mail, Telefono, Calle_Direccion, Calle_Nro,
	Calle_Piso, Calle_Depto, Nacionalidad, Fecha_Nacimiento, Habilitado)
SELECT tc.Nombre, tc.Apellido, ti.Id_Tipo_Identificacion, tc.Nro_Identificacion, tc.Mail, tc.Telefono, tc.Calle_Direccion,
	tc.Calle_Nro, tc.Calle_Piso, tc.Calle_Depto, n.Id_Nacionalidad, tc.Fecha_Nacimiento, 1
	FROM LA_MAYORIA.Temp_Clientes tc
		INNER JOIN LA_MAYORIA.Tipo_Identificacion ti ON ti.Descripcion = 'PASAPORTE ARGENTINA'
		INNER JOIN LA_MAYORIA.Nacionalidad n ON UPPER(LTRIM(RTRIM(tc.Nacionalidad))) = UPPER(n.Descripcion)

/* TODO: Pensar un fix para el nro de pasaporte = 1652782 */

--ELIMINO TABLA TEMPORAL DE CLIENTES
DROP TABLE LA_MAYORIA.Temp_Clientes

/*
	Despues de correr todos los scripts nos dimos cuenta que hay un cliente con codigo de documento: para el nro de pasaporte = 1652782
	por lo cual consideramos crear la constraint pero no checkear todavia. 
	Los datos de clientes y marca ese error y esperar que se modifique la primera vez que se ejecute la aplicacion
*/
--ALTER TABLE LA_MAYORIA.Clientes WITH NOCHECK
--	ADD CONSTRAINT [UQ_Clientes_Tipo_Identificacion_Nro_Identificacion] UNIQUE (Tipo_Identificacion, Nro_Identificacion)
/*
	Al igual que el caso anterior, descubrimos el caso del mail "aaron_Blanco@gmail.com"
	Al igual que el caso anterior, se debe resolver al arrancar la aplicacion
*/
--ALTER TABLE LA_MAYORIA.Clientes WITH NOCHECK ADD CONSTRAINT UQ_Clientes_Mail UNIQUE (Mail)

--TABLA ESTADO_RESERVA
/*
	Tabla con la parametria de los estados de las reservas
*/

CREATE TABLE [LA_MAYORIA].[Estado_Reserva](
	[Id_Estado][Int]IDENTITY(1,1) NOT NULL,
	[Descripcion][varchar](50) NOT NULL
	
	CONSTRAINT [PK_Estado_Reserva_Id_Estado] PRIMARY KEY (Id_Estado),
	CONSTRAINT UQ_Estado_Reserva_Descripcion UNIQUE (Descripcion)
)

INSERT INTO LA_MAYORIA.Estado_Reserva (Descripcion) VALUES ('Reserva Correcta')
INSERT INTO LA_MAYORIA.Estado_Reserva (Descripcion) VALUES ('Reserva Modificada')
INSERT INTO LA_MAYORIA.Estado_Reserva (Descripcion) VALUES ('Reserva Cancelada Por Recepcion')
INSERT INTO LA_MAYORIA.Estado_Reserva (Descripcion) VALUES ('Reserva Cancelada Por Cliente')
INSERT INTO LA_MAYORIA.Estado_Reserva (Descripcion) VALUES ('Reserva Cancelada Por No-Show')
INSERT INTO LA_MAYORIA.Estado_Reserva (Descripcion) VALUES ('Reserva con ingreso')

--TABLA RESERVA
/*
	Tabla con todas las reservas hasta la fecha
*/
CREATE TABLE [LA_MAYORIA].[Reserva](
	[Id_Reserva][numeric](18,0)IDENTITY(1,1) NOT NULL,
	[Fecha_Inicio][datetime] NOT NULL,
	[Estadia][Int] NOT NULL,
	[Tipo_Regimen][Int] NOT NULL,
	[Estado][Int] NOT NULL,
	[Id_Usuario][varchar](20) NOT NULL

	CONSTRAINT [FK_Reserva_Tipo_Regimen] FOREIGN KEY (Tipo_Regimen)
		REFERENCES [LA_MAYORIA].[Regimen](Id_Regimen),
	CONSTRAINT [FK_Reserva_Estado] FOREIGN KEY (Estado)
		REFERENCES [LA_MAYORIA].[Estado_Reserva](Id_Estado),
	CONSTRAINT [PK_Reservar_Id_Reserva] PRIMARY KEY (Id_Reserva),
	CONSTRAINT [FK_Reserva_Id_Usuario] FOREIGN KEY (Id_Usuario)
		REFERENCES [LA_MAYORIA].[Usuario](Id_Usuario)
)

SET IDENTITY_INSERT [LA_MAYORIA].Reserva ON

INSERT INTO LA_MAYORIA.Reserva(Id_Reserva, Fecha_Inicio, Estadia, Tipo_Regimen, Estado, Id_Usuario)
SELECT m.Reserva_Codigo, m.Reserva_Fecha_Inicio, m.Reserva_Cant_Noches, r.Id_Regimen, 1, 'admin' 
	FROM gd_esquema.Maestra m 
	INNER JOIN LA_MAYORIA.Regimen r
	ON UPPER(LTRIM(RTRIM(m.Regimen_Descripcion))) = UPPER(LTRIM(RTRIM(r.Descripcion)))
	GROUP BY m.Reserva_Codigo, m.Reserva_Fecha_Inicio, m.Reserva_Cant_Noches, r.Id_Regimen

--ACTUALIZO A ESTADO 'Reserva con ingreso' a todas aquellas reservas ques se facturaron

UPDATE LA_MAYORIA.Reserva
SET Estado = (SELECT Id_Estado FROM LA_MAYORIA.Estado_Reserva 
WHERE UPPER(LTRIM(RTRIM(Descripcion))) = UPPER(LTRIM(RTRIM('Reserva con ingreso'))))
WHERE EXISTS(SELECT 1 FROM gd_esquema.Maestra
	WHERE Id_Reserva = Reserva_Codigo AND Factura_Nro IS NOT NULL AND Consumible_Codigo IS NULL)

--ACTUALIZO A ESTADO 'Reserva Cancelada Por Cliente' a aquellas que paso la fecha de incio y el periodo de estadia y no tiene facturacion
UPDATE LA_MAYORIA.Reserva
SET Estado = (SELECT Id_Estado FROM LA_MAYORIA.Estado_Reserva 
	WHERE UPPER(LTRIM(RTRIM(Descripcion))) = UPPER(LTRIM(RTRIM('Reserva Cancelada Por Cliente'))))
WHERE EXISTS(SELECT 1 FROM gd_esquema.Maestra
	WHERE Id_Reserva = Reserva_Codigo AND DATEADD(DAY, Reserva_Cant_Noches, Reserva_Fecha_Inicio) > GETDATE()
	AND Factura_Nro IS NULL
)

SET IDENTITY_INSERT [LA_MAYORIA].Reserva OFF

--TABLA HABITACION_RESERVA
/*
	Tabla con las habitaciones reservadas en cada hotel por reserva
*/
CREATE TABLE [LA_MAYORIA].[Habitacion_Reserva](
	[Id_Hotel][Int] NOT NULL,
	[Id_Reserva][numeric](18,0) NOT NULL,
	[Habitacion_Nro][Int] NOT NULL,
	[Habitacion_Piso][Int] NOT NULL

	CONSTRAINT [FK_Habitacion_Reserva_Id_Reserva] FOREIGN KEY (Id_Reserva)
		REFERENCES [LA_MAYORIA].[Reserva](Id_Reserva),
	CONSTRAINT [FK_Habitacion_Reserva_Id_Hotel_Habitacion_Nro_Habitacion_Piso] FOREIGN KEY (Id_Hotel,Habitacion_Nro, Habitacion_Piso)
		REFERENCES [LA_MAYORIA].[Habitacion](Id_Hotel,Nro,Piso)
)
/*
Comprobado por la query 
SELECT Reserva_Codigo, COUNT(Reserva_Codigo) FROM LA_MAYORIA.Temp_Reservas
WHERE Estadia_Fecha_Inicio IS NULL
GROUP BY Reserva_Codigo
HAVING COUNT(*) > 1

No existen reservas con mas de una habitacion
*/
INSERT INTO LA_MAYORIA.Habitacion_Reserva (Id_Hotel, Id_Reserva, Habitacion_Nro, Habitacion_Piso)
SELECT h.Id_Hotel, m.Reserva_Codigo, m.Habitacion_Numero, m.Habitacion_Piso FROM gd_esquema.Maestra m 
	INNER JOIN LA_MAYORIA.Hotel h
	ON m.Hotel_Ciudad = h.Ciudad AND m.Hotel_Calle = h.Calle_Direccion AND m.Hotel_Nro_Calle = h.Calle_Nro
	GROUP BY m.Reserva_Codigo, m.Habitacion_Numero, m.Habitacion_Piso, h.Id_Hotel

--TABLA RESERVA_CLIENTE
/*
	Tabña que almacena la relacion entre la reserva y el cliente que la realizo
*/
CREATE TABLE [LA_MAYORIA].[Reserva_Cliente](
	[Id_Reserva][numeric](18,0) NOT NULL,
	[Id_Cliente][Int] NOT NULL,

	CONSTRAINT [FK_Reserva_Cliente_Id_Reserva] FOREIGN KEY (Id_Reserva)
		REFERENCES [LA_MAYORIA].[Reserva](Id_Reserva),
	CONSTRAINT [FK_Reserva_Cliente_Id_Cliente] FOREIGN KEY (Id_Cliente)
		REFERENCES [LA_MAYORIA].[Clientes](Id_Cliente)
)

INSERT INTO LA_MAYORIA.Reserva_Cliente (Id_Reserva,Id_Cliente)
SELECT m.Reserva_Codigo, c.Id_Cliente FROM gd_esquema.Maestra m
	INNER JOIN LA_MAYORIA.Clientes c 
	ON m.Cliente_Pasaporte_Nro = c.Nro_Identificacion AND m.Cliente_Nombre = c.Nombre
		AND m.Cliente_Apellido = Apellido AND m.Cliente_Mail = c.Mail
		AND  m.Reserva_Codigo IS NOT NULL 
		AND m.Estadia_Fecha_Inicio IS NULL 
		AND m.Factura_Nro IS NULL

--TABLA HISTORIAL_CANCELACION_RESERVA
/*
	Tabla con los registros de las cancelaciones realizadas, con fecha y motivo de la misma
*/
CREATE TABLE [LA_MAYORIA].[Historial_Cancelacion_Reserva](
	[Id_Reserva][numeric](18,0) NOT NULL,
	[Motivo][varchar](200),
	[Fecha_Cancelacion][datetime] NOT NULL,
	[Id_Usuario][varchar](20) NOT NULL

	CONSTRAINT [FK_Historial_Cancelacion_Reserva] FOREIGN KEY (Id_Reserva)
		REFERENCES [LA_MAYORIA].[Reserva](Id_Reserva)
)

--TABLA ESTADIA
/*
	Tabla con las fechas de check in y check out de cada reserva y con los respectivos usuarios que la llevaron a cabo
*/
CREATE TABLE [LA_MAYORIA].[Estadia](
	[Id_Estadia][int]IDENTITY(1,1) NOT NULL,
	[Id_Reserva][numeric](18,0) NOT NULL,
	[Check_In][datetime],
	[Id_Usuario_Check_In][varchar](20),
	[Check_Out][datetime],
	[Id_Usuario_Check_Out][varchar](20)

	CONSTRAINT [PK_Estadia_Id_Estadia] PRIMARY KEY (Id_Estadia),
	CONSTRAINT [FK_Estadia_Id_Reserva] FOREIGN KEY (Id_Reserva)
		REFERENCES [LA_MAYORIA].[Reserva](Id_Reserva)
)

--Migro las estadias que solo tienen check-in
/*
	SE EJECUTO LA SIGUIENTE QUERY Y NO EXISTEN REGISTROS DE ESE TIPO DE CONDICION
	SELECT * FROM gd_esquema.Maestra m
		WHERE m.Estadia_Fecha_Inicio IS NOT NULL
		AND NOT EXISTS (SELECT 1 FROM gd_esquema.Maestra m2 WHERE m2.Reserva_Codigo = m.Reserva_Codigo
			AND m2.Factura_Fecha IS NOT NULL)
*/

--Migro las reservas completadas
INSERT INTO LA_MAYORIA.Estadia (Id_Reserva, Check_In, Id_Usuario_Check_In, Check_Out, Id_Usuario_Check_Out)
SELECT DISTINCT m.Reserva_Codigo, m.Estadia_Fecha_Inicio, 'admin', 
	DATEADD(DAY, m.Reserva_Cant_Noches, CAST(m.Estadia_Fecha_Inicio AS DATE)), 'admin' 
	FROM gd_esquema.Maestra m
	WHERE m.Estadia_Fecha_Inicio IS NOT NULL 
	AND m.Factura_Fecha IS NOT NULL
	

--TABLA CONSUMIBLE
/*
	Tabla con todos los productos consumibles disponibles
*/
CREATE TABLE [LA_MAYORIA].[Consumible](
	[Id_Codigo][numeric](18,0) NOT NULL,
	[Descripcion][varchar](255) NOT NULL,
	[Precio][numeric](18,2) NOT NULL

	CONSTRAINT [PK_Consumible_Id_Codigo] PRIMARY KEY (Id_Codigo)
)

INSERT INTO LA_MAYORIA.Consumible (Id_Codigo, Descripcion, Precio)
SELECT DISTINCT Consumible_Codigo, UPPER(LTRIM(RTRIM(Consumible_Descripcion))), Consumible_Precio FROM gd_esquema.Maestra
	WHERE Consumible_Codigo IS NOT NULL AND Consumible_Precio IS NOT NULL AND Consumible_Descripcion IS NOT NULL

--TABLA CONSUMIBLE_RESERVA
/*
	Tabla que almacena los gastos de consumibles por reserva
*/
CREATE TABLE [LA_MAYORIA].[Consumible_Reserva](
	[Id_Estadia][int] NOT NULL,
	[Id_Codigo][numeric](18,0) NOT NULL,
	[Cantidad][int] NOT NULL,
	[Fecha][datetime] NOT NULL,
	[Id_Usuario][varchar](20) NOT NULL

	CONSTRAINT [FK_Consumible_Reserva_Id_Estadia] FOREIGN KEY (Id_Estadia)
		REFERENCES [LA_MAYORIA].[Estadia](Id_Estadia),
	CONSTRAINT [FK_Consumible_Reserva_Id_Codigo] FOREIGN KEY (Id_Codigo)
		REFERENCES [LA_MAYORIA].[Consumible](Id_Codigo),
	CONSTRAINT [FK_Consumible_Reserva_Id_Usuario] FOREIGN KEY (Id_Usuario)
		REFERENCES [LA_MAYORIA].[Usuario](Id_Usuario)
)

INSERT INTO LA_MAYORIA.Consumible_Reserva (Id_Estadia, Id_Codigo, Cantidad, Fecha, Id_Usuario)
SELECT Id_Estadia, Consumible_Codigo, Item_Factura_Cantidad, Estadia_Fecha_Inicio, 'admin' 
	FROM gd_esquema.Maestra m
	INNER JOIN LA_MAYORIA.Estadia e 
		ON m.Reserva_Codigo = e.Id_Reserva
	WHERE Consumible_Codigo IS NOT NULL

--TABLA FACTURACION
/*
	Tabla con el registro completa de la factura, sin el detalle
*/
CREATE TABLE [LA_MAYORIA].[Facturacion](
	[Id_Factura][numeric](18,0)IDENTITY(1,1) NOT NULL,
	[Id_Estadia][Int] NOT NULL,
	[Id_Cliente][Int] NOT NULL,
	[Total_Factura][numeric](18,2) NOT NULL DEFAULT 0.0,
	[Total_Estadia][numeric](18,2) NOT NULL DEFAULT 0.0,
	[Total_Consumibles][numeric](18,2) NOT NULL DEFAULT 0.0,
	[Fecha_Facturacion] datetime NOT NULL

	CONSTRAINT [PK_Facturacion_Id_Factura] PRIMARY KEY(Id_Factura),
	CONSTRAINT [FK_Facturacion_Id_Estadia] FOREIGN KEY(Id_Estadia)
		REFERENCES [LA_MAYORIA].[Estadia](Id_Estadia),
	CONSTRAINT [FK_Facturacion_Id_Cliente] FOREIGN KEY(Id_Cliente)
		REFERENCES [LA_MAYORIA].[Clientes](Id_Cliente)
)

SET IDENTITY_INSERT [LA_MAYORIA].Facturacion ON

--INSERTO LA FACTURAS DE LOS QUE SON NO ALL INCLUSIVE
INSERT INTO LA_MAYORIA.Facturacion (Id_Factura, Id_Estadia, Id_Cliente, Total_Factura, Total_Estadia,
	Total_Consumibles,Fecha_Facturacion)
SELECT m.Factura_Nro, e.Id_Estadia, c.Id_Cliente, m.Factura_Total + m.Item_Factura_Monto, 
	m.Item_Factura_Monto, m.Factura_Total, m.Factura_Fecha 
	FROM gd_esquema.Maestra m 
	INNER JOIN LA_MAYORIA.Clientes c
		ON m.Cliente_Pasaporte_Nro = c.Nro_Identificacion
		AND UPPER(m.Cliente_Nombre) = UPPER(c.Nombre)
		AND UPPER(m.Cliente_Apellido) = UPPER(c.Apellido)
		AND UPPER(m.Cliente_Mail) = UPPER(c.Mail)
	INNER JOIN LA_MAYORIA.Estadia e
		ON m.Reserva_Codigo = e.Id_Reserva
	WHERE m.Factura_Total IS NOT NULL
		AND m.Consumible_Codigo IS NULL
		AND UPPER(m.Regimen_Descripcion) != UPPER('All Inclusive')

--INSERTO LA FACTURAS DE LOS QUE SON ALL INCLUSIVE
INSERT INTO LA_MAYORIA.Facturacion (Id_Factura, Id_Estadia, Id_Cliente, Total_Factura, Total_Estadia,
	Total_Consumibles,Fecha_Facturacion)
SELECT m.Factura_Nro, e.Id_Estadia, c.Id_Cliente, 0 + m.Item_Factura_Monto, 
	m.Factura_Total, 0, m.Factura_Fecha 
	FROM gd_esquema.Maestra m 
	INNER JOIN LA_MAYORIA.Clientes c
		ON m.Cliente_Pasaporte_Nro = c.Nro_Identificacion
		AND UPPER(m.Cliente_Nombre) = UPPER(c.Nombre)
		AND UPPER(m.Cliente_Apellido) = UPPER(c.Apellido)
		AND UPPER(m.Cliente_Mail) = UPPER(c.Mail)
	INNER JOIN LA_MAYORIA.Estadia e
		ON m.Reserva_Codigo = e.Id_Reserva
	WHERE m.Factura_Total IS NOT NULL
		AND m.Consumible_Codigo IS NULL
		AND UPPER(m.Regimen_Descripcion) = UPPER('All Inclusive')

SET IDENTITY_INSERT [LA_MAYORIA].Facturacion OFF

--TABLA FACTURACION_DETALLE
/*
	Tabla con los items de cada factura
*/
CREATE TABLE [LA_MAYORIA].[Facturacion_Detalle](
	[Id_Factura][numeric](18,0) NOT NULL,
	[Id_Estadia][Int] NOT NULL,
	[Descripcion][varchar](50) NOT NULL,
	[Precio][numeric](18,2) NOT NULL DEFAULT 0.0,
	[Cantidad][Int] NOT NULL DEFAULT 1

	CONSTRAINT [FK_Facturacion_Detalle_Id_Factura] FOREIGN KEY (Id_Factura)
		REFERENCES [LA_MAYORIA].[Facturacion](Id_Factura),
	CONSTRAINT [FK_Facturacion_Detalle_Id_Estadia] FOREIGN KEY (Id_Estadia)
		REFERENCES [LA_MAYORIA].[Estadia](Id_Estadia)
)

--Migro la factura de la estancia
INSERT INTO LA_MAYORIA.Facturacion_Detalle (Id_Factura, Id_Estadia, Descripcion, Precio, Cantidad)
SELECT m.Factura_Nro, e.Id_Estadia, 'Estadia', m.Item_Factura_Monto, m.Item_Factura_Cantidad
	FROM gd_esquema.Maestra m
	INNER JOIN LA_MAYORIA.Estadia e
		ON m.Reserva_Codigo = e.Id_Reserva
	WHERE m.Consumible_Codigo IS NULL
		AND m.Item_Factura_Monto IS NOT NULL

--Migro los consumibles de cada factura
INSERT INTO LA_MAYORIA.Facturacion_Detalle (Id_Factura, Id_Estadia, Descripcion, Precio, Cantidad)
SELECT m.Factura_Nro, e.Id_Estadia, m.Consumible_Descripcion , m.Item_Factura_Monto, m.Item_Factura_Cantidad
	FROM gd_esquema.Maestra m
	INNER JOIN LA_MAYORIA.Estadia e
		ON m.Reserva_Codigo = e.Id_Reserva
	WHERE m.Consumible_Codigo IS NOT NULL
		AND m.Item_Factura_Monto IS NOT NULL

--Migro los consumibles que deben ser descontados por All Inclusive
INSERT INTO LA_MAYORIA.Facturacion_Detalle (Id_Factura, Id_Estadia, Descripcion, Precio, Cantidad)
SELECT m.Factura_Nro, e.Id_Estadia, 'Devolucion Regimen All Inclusive' , 0 - m.Factura_Total, m.Item_Factura_Cantidad
	FROM gd_esquema.Maestra m
	INNER JOIN LA_MAYORIA.Estadia e
		ON m.Reserva_Codigo = e.Id_Reserva
	WHERE UPPER(m.Regimen_Descripcion) = UPPER('All Inclusive')
		AND m.Consumible_Codigo IS NULL
		AND m.Item_Factura_Monto IS NOT NULL

--TABLA Tipo De Pago
/*
	Parametrizacion de los distintos tipos de pagos que se pueden elegir a la hora de pagar la facturacion
*/
CREATE TABLE [LA_MAYORIA].[Tipo_Pago](
	[Id_Tipo_Pago][int]IDENTITY(1,1),
	[Descripcion][varchar](255),

	CONSTRAINT [PK_Tipo_Pago_Id_Tipo_Pago] PRIMARY KEY(Id_Tipo_Pago),
	CONSTRAINT [UQ_Tipo_Pago_Descripcion] UNIQUE(Descripcion)
)

INSERT INTO LA_MAYORIA.Tipo_Pago(Descripcion) VALUES('Efectivo')
INSERT INTO LA_MAYORIA.Tipo_Pago(Descripcion) VALUES('Tarjeta Credito')

--TABLA FORMA PAGO
/*
	Tabla donde se almacenan los tipos de pagos respecto de cada factura
*/
CREATE TABLE [LA_MAYORIA].[Forma_Pago](
	[Id_Factura][numeric](18,0) NOT NULL,
	[Id_Tipo_Pago][Int] NOT NULL,
	[Tarjeta_Numero][Int] NULL,

	CONSTRAINT [FK_Forma_Pago_Id_Factura] FOREIGN KEY(Id_Factura)
	REFERENCES [LA_MAYORIA].[Facturacion](Id_Factura),
	CONSTRAINT [FK_Forma_Pago_Id_Tipo_Pago] FOREIGN KEY(Id_Tipo_Pago)
	REFERENCES [LA_MAYORIA].[Tipo_Pago](Id_Tipo_Pago)
)

--COMO NO SE ESPECIFICA EN LA TABLA MAESTRA NINGUN TIPO DE PAGO, CONSIDERAMOS QUE TODOS ESTOS SE REALIZARON MEDIANTE EFECTIVO
INSERT INTO LA_MAYORIA.Forma_Pago(Id_Factura,Id_Tipo_Pago)
SELECT f.Id_Factura, tp.Id_Tipo_Pago  FROM LA_MAYORIA.Facturacion f
	INNER JOIN LA_MAYORIA.Tipo_Pago tp
	ON UPPER(tp.Descripcion) = UPPER('efectivo')

/*
	TABLA QUE ALMACENA POR ESTADIA LOS INTEGRANTES QUE SE REGISTRARON
*/
CREATE TABLE [LA_MAYORIA].[Estadia_Cliente](
	[Id_Estadia][Int] NOT NULL,
	[Id_Cliente][Int] NOT NULL

	CONSTRAINT [FK_Estadia_Cliente_Id_Estadia] FOREIGN KEY (Id_Estadia)
		REFERENCES [LA_MAYORIA].[Estadia](Id_Estadia),
	CONSTRAINT [FK_Estadia_Cliente_Id_Cliente] FOREIGN KEY (Id_Cliente)
		REFERENCES [LA_MAYORIA].[Clientes](Id_Cliente),
	CONSTRAINT [UQ_Estadia_Cliente_Id_Estadia_Id_Cliente] UNIQUE (Id_Estadia, Id_Cliente)
)

CREATE TABLE [LA_MAYORIA].[Estadistica](
	[Id_Estadistica][int]IDENTITY(1,1) NOT NULL,
	[Store_Procedure][varchar](100) NOT NULL,
	[Descripcion][varchar](100) NOT NULL
)

INSERT INTO LA_MAYORIA.Estadistica (Store_Procedure, Descripcion) VALUES ('sp_estadistic_top_5_hotel_canceled', 
	'TOP 5 HOTELES MAS CANCELADOS')
INSERT INTO LA_MAYORIA.Estadistica (Store_Procedure, Descripcion) VALUES ('sp_estadistic_top_5_hotel_consumable_charge', 
	'TOP 5 HOTELES MAS CONSUMIBLES FACTURARON')
INSERT INTO LA_MAYORIA.Estadistica (Store_Procedure, Descripcion) VALUES ('sp_estadistic_top_5_hotel_more_days_out', 
	'TOP 5 HOTELES MAYOR CANTIDAD DE DIAS FUERA DE SERVICIO')
INSERT INTO LA_MAYORIA.Estadistica (Store_Procedure, Descripcion) VALUES ('sp_estadistic_top_5_room_hotel_most_occupied', 
	'TOP 5 HABITACIONES MAYOR DÍAS - VECES OCUPADAS')
INSERT INTO LA_MAYORIA.Estadistica (Store_Procedure, Descripcion) VALUES ('sp_estadistic_top_5_client_more_points', 
	'TOP 5 CLIENTES CON MAYOR PUNTOS')

CREATE TABLE [LA_MAYORIA].[Trimestre](
	[Id_Trimestre][Int]IDENTITY(1,1) NOT NULL,
	[Fechas][varchar](20) NOT NULL,
	[Descripcion][varchar](30) NOT NULL
)

INSERT INTO LA_MAYORIA.Trimestre (Fechas, Descripcion) VALUES ('1,1;31,3','1° TRIMESTRE')
INSERT INTO LA_MAYORIA.Trimestre (Fechas, Descripcion) VALUES ('1,4;30,6','2° TRIMESTRE')
INSERT INTO LA_MAYORIA.Trimestre (Fechas, Descripcion) VALUES ('1,7;30,9','3° TRIMESTRE')
INSERT INTO LA_MAYORIA.Trimestre (Fechas, Descripcion) VALUES ('1,10;31,12','4° TRIMESTRE')

CREATE TABLE [LA_MAYORIA].[Ano](
	[Id_Ano][INT]IDENTITY(1,1) NOT NULL,
	[Ano][Int] NOT NULL

	CONSTRAINT [UQ_Ano_Ano] UNIQUE (Ano)
)

INSERT INTO LA_MAYORIA.Ano (Ano) VALUES (2013)
INSERT INTO LA_MAYORIA.Ano (Ano) VALUES (2014)
INSERT INTO LA_MAYORIA.Ano (Ano) VALUES (2015)