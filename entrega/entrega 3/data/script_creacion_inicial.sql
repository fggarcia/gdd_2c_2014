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

CREATE PROCEDURE [LA_MAYORIA].[sp_password_check_ok](
@p_id varchar(255) = null,
@p_pass varchar(255) = null,
@p_ok int = 0 OUTPUT
)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Usuario
		WHERE Id_Usuario = @p_id
		AND Password = @p_pass)
		SET @p_ok = 1
	ELSE
		SET @p_ok = 0
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_password_change](
@p_id varchar(255) = null,
@p_pass varchar(255) = null
)
AS
BEGIN
	UPDATE LA_MAYORIA.Usuario
		SET Password = @p_pass
	WHERE Id_Usuario = @p_id
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

CREATE PROCEDURE [LA_MAYORIA].[sp_habitacion_person_per_room_by_booking_id](
@p_habitacion_booking_id int,
@p_count_person int = 0 OUTPUT
)
AS
BEGIN
	SELECT @p_count_person = th.Cupo FROM LA_MAYORIA.Habitacion_Reserva hr
	INNER JOIN LA_MAYORIA.Habitacion h
		ON hr.Id_Hotel = h.Id_Hotel
			AND hr.Habitacion_Nro = h.Nro 
			AND hr.Habitacion_Piso = h.Piso
	INNER JOIN LA_MAYORIA.Tipo_Habitacion th
		ON h.Tipo_Habitacion = th.Id_Tipo_Habitacion
	WHERE hr.Id_Reserva = @p_habitacion_booking_id
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

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_booking_is_exist](
@p_stay_booking_id int,
@p_stay_hotel_id int,
@p_stay_booking_exist int = 0 OUTPUT
)
AS
BEGIN
	SET @p_stay_booking_exist = 0
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Reserva r
		WHERE r.Id_Reserva = @p_stay_booking_id)
		SET @p_stay_booking_exist = 1
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_booking_is_cancel](
@p_stay_booking_id int,
@p_stay_hotel_id int,
@p_stay_booking_cancel int = 0 OUTPUT
)
AS
BEGIN
	SET @p_stay_booking_cancel = 0
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Reserva r
		INNER JOIN LA_MAYORIA.Estado_Reserva er
			ON r.Estado = er.Id_Estado
	WHERE r.Id_Reserva = @p_stay_booking_id
		AND UPPER(er.Descripcion) like '%' + 'CANCELADA' + '%')
		SET @p_stay_booking_cancel = 1
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_booking_is_before](
@p_stay_booking_id int,
@p_stay_hotel_id int,
@p_stay_booking_before int = 0 OUTPUT
)
AS
BEGIN
	SET @p_stay_booking_before = 0
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Reserva r
		WHERE r.Id_Reserva = @p_stay_booking_id
			AND CAST(r.Fecha_Inicio AS DATE) < CAST(GETDATE() AS DATE))
		SET @p_stay_booking_before = 1
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_booking_is_hotel](
@p_stay_booking_id int,
@p_stay_hotel_id int,
@p_stay_booking_hotel int = 0 OUTPUT
)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Reserva r
		INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
			ON r.Id_Reserva = hr.Id_Reserva
		WHERE r.Id_Reserva = @p_stay_booking_id
			AND hr.Id_Hotel = @p_stay_hotel_id)
		SET @p_stay_booking_hotel = 1
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_generate_stay](
@p_stay_booking_id int,
@p_stay_user_name varchar(20),
@p_stay_id int = 0 OUTPUT
)
AS
BEGIN
	BEGIN TRANSACTION
		INSERT INTO LA_MAYORIA.Estadia(Id_Reserva, Check_In, Id_Usuario_Check_In, Check_Out, Id_Usuario_Check_Out)
		VALUES (@p_stay_booking_id, CAST(GETDATE() AS DATE), @p_stay_user_name, null, null)
		SET @p_stay_id = @@IDENTITY
	COMMIT TRANSACTION
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_cancel_is_after_date_check_in](
@p_stay_booking_id int,
@p_stay_change_to_cancel int = 0 OUTPUT
)
AS
BEGIN
	SET @p_stay_change_to_cancel = 0
	IF EXISTS(SELECT 1 FROM LA_MAYORIA.Reserva r
		WHERE r.Id_Reserva = @p_stay_booking_id
		AND CAST(r.Fecha_Inicio AS DATE) > CAST(GETDATE() AS DATE)
		)
	BEGIN
		Declare @cancel_no_show int
		SELECT @cancel_no_show = Id_Estado FROM LA_MAYORIA.Estado_Reserva
			WHERE Descripcion = 'Reserva Cancelada Por No-Show'

		BEGIN TRANSACTION

		UPDATE LA_MAYORIA.Reserva SET Estado = @cancel_no_show
			WHERE Id_Reserva = @p_stay_booking_id

		SET @p_stay_change_to_cancel = 1

		COMMIT TRANSACTION
	END
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_is_for_check_in](
@p_stay_booking_id int,
@p_stay_is_check_in int = 0 OUTPUT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM LA_MAYORIA.Estadia e
		WHERE e.Id_Reserva = @p_stay_booking_id)
		SET @p_stay_is_check_in = 0
	ELSE
		SET @p_stay_is_check_in = 1
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_exist_full_stay](
@p_stay_booking_id int,
@p_stay_exist_full_stay int = 0 OUTPUT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM LA_MAYORIA.Estadia e
		WHERE e.Id_Reserva = @p_stay_booking_id
		AND e.Check_In IS NOT NULL
		AND e.Check_Out IS NOT NULL)
		SET @p_stay_exist_full_stay = 1
	ELSE
		SET @p_stay_exist_full_stay = 0
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_generate_checkout](
@p_stay_booking_id int,
@p_stay_user_name varchar(20)
)
AS
BEGIN
	Declare @stay_id int
	SELECT @stay_id = e.Id_Estadia FROM LA_MAYORIA.Estadia e
		WHERE e.Id_Reserva = @p_stay_booking_id
	BEGIN TRANSACTION
		UPDATE LA_MAYORIA.Estadia SET Check_Out = CAST(GETDATE() AS DATE),
			Id_Usuario_Check_Out = @p_stay_user_name
		WHERE Id_Estadia = @stay_id
	COMMIT TRANSACTION
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_check_client_search](
@p_check_client_name varchar(255) = null,
@p_check_client_lastname varchar(255) = null,
@p_check_client_document_number varchar(255) = null
)
AS
BEGIN
	SELECT DISTINCT
				
		c.Id_Cliente 'Id Cliente',
		c.Nombre 'Nombre',
		c.Apellido 'Apellido',
		c.Nro_Identificacion 'Nro Documento',
		c.Mail 'Mail'
		
		FROM LA_MAYORIA.Clientes c
		WHERE
		( (@p_check_client_name IS NULL) OR (UPPER(c.Nombre) like UPPER(@p_check_client_name) + '%'))
		AND ((@p_check_client_lastname IS NULL) OR (UPPER(c.Apellido) like UPPER(@p_check_client_lastname) + '%'))
		AND ((@p_check_client_document_number IS NULL) OR (LTRIM(RTRIM(STR(c.Nro_Identificacion))) like @p_check_client_document_number + '%'))
		AND (c.Habilitado = 1)
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_save_stay_client](
@p_stay_id int,
@p_stay_client_id int
)
AS
BEGIN
	INSERT INTO LA_MAYORIA.Estadia_Cliente (Id_Estadia, Id_Cliente)
	VALUES (@p_stay_id, @p_stay_client_id)
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_consumibles_estadias_search](

@p_id_hotel int,
@p_id_reserva int
)
AS
BEGIN
	SELECT DISTINCT
		e.Id_Estadia as 'Estadia'
		, e.Check_In
		, e.Check_Out  

	FROM LA_MAYORIA.Estadia e
	INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
		ON e.Id_Reserva = hr.Id_Reserva
	
	WHERE hr.Id_Hotel = @p_id_hotel
	AND e.Id_Reserva = @p_id_reserva
	AND e.Check_Out IS NULL
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_consumible_filter](

@p_d_filter varchar(255) = ''
)
AS
BEGIN
	SELECT 
		c.Id_Codigo as 'id'
		, c.descripcion
		, c.precio 

	FROM LA_MAYORIA.Consumible c

	WHERE c.descripcion like ('%' + @p_d_filter + '%') order by 1 asc
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_consumible_by_estadia_search](

@p_id_estadia int
)
AS
BEGIN
	SELECT 
		c.Id_Codigo as 'id'
		, c.descripcion
		, cr.Cantidad
		, CAST(cr.Fecha AS DATE)

	FROM LA_MAYORIA.Consumible_Reserva cr

	INNER JOIN LA_MAYORIA.Consumible c
		ON cr.Id_Codigo = c.Id_Codigo
	INNER JOIN LA_MAYORIA.Estadia e
		ON cr.Id_Estadia = e.Id_Estadia

	WHERE e.Id_Estadia = @p_id_estadia 

	ORDER BY 1 ASC
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_consumible_add](
@p_id_usuario varchar(255),
@p_id_estadia int,
@p_id_consumible int,
@p_cantidad int

)
AS
BEGIN
	BEGIN TRANSACTION
		IF ( EXISTS(SELECT 1 FROM LA_MAYORIA.Consumible_Reserva cr
					WHERE 	cr.Id_Estadia = @p_id_estadia
						AND cr.Id_Codigo = @p_id_consumible
						AND CAST(cr.Fecha AS DATE) = CAST(GETDATE() AS DATE)
					)
		)
		BEGIN
			
				UPDATE LA_MAYORIA.Consumible_Reserva SET Cantidad = Cantidad + @p_cantidad
				WHERE 	Id_Estadia = @p_id_estadia
					AND Id_Codigo = @p_id_consumible
					AND CAST(Fecha AS DATE) = CAST(GETDATE() AS DATE)
		END
		ELSE
		BEGIN
			INSERT INTO LA_MAYORIA.Consumible_Reserva (Id_Estadia, Id_Codigo, Cantidad, Fecha, Id_Usuario)
			VALUES (@p_id_estadia, @p_id_consumible,@p_cantidad, GETDATE(), @p_id_usuario)
		END

	COMMIT TRANSACTION
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadia_consumible_remove](
@p_id_estadia int,
@p_id_consumible int

)
AS
BEGIN
	BEGIN TRANSACTION
		IF ( EXISTS(SELECT 1 FROM LA_MAYORIA.Consumible_Reserva cr
					WHERE cr.Id_Estadia = @p_id_estadia
						AND cr.Id_Codigo = @p_id_consumible
						AND CAST(cr.Fecha AS DATE) = CAST(GETDATE() AS DATE)
					)
		)
		BEGIN
		
			DELETE 
			FROM LA_MAYORIA.Consumible_Reserva
			WHERE Id_Estadia = @p_id_estadia
				AND Id_Codigo = @p_id_consumible
				AND CAST(Fecha AS DATE) = CAST(GETDATE() AS DATE)
		END
	COMMIT TRANSACTION
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_facturar_estadia_booking_search](
@p_charge_stay_booking_id int,
@p_charge_stay_hotel_id int
)
AS
BEGIN
	SELECT DISTINCT
		e.Id_Reserva 'Nro Reserva',
		e.Id_Estadia 'Id Estadia',
		e.Check_In 'Check In',
		e.Check_Out 'Check Out',
		r.Estadia 'Estadia',
		c.Id_Cliente 'Id Cliente',
		c.Nombre 'Nombre',
		c.Apellido 'Apellido'

	FROM LA_MAYORIA.Estadia e
	INNER JOIN LA_MAYORIA.Reserva r
		ON r.Id_Reserva = e.Id_Reserva
	INNER JOIN LA_MAYORIA.Reserva_Cliente rc
		ON r.Id_Reserva = rc.Id_Reserva
	INNER JOIN LA_MAYORIA.Clientes c
		ON rc.Id_Cliente = c.Id_Cliente
	INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
		ON hr.Id_Reserva = e.Id_Reserva
	WHERE e.Check_In IS NOT NULL
		AND e.Check_Out IS NOT NULL
		AND e.Id_Reserva = @p_charge_stay_booking_id
		AND hr.Id_Hotel = @p_charge_stay_hotel_id
		AND NOT EXISTS (SELECT 1 FROM LA_MAYORIA.Facturacion f WHERE f.Id_Estadia = e.Id_Estadia)
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_facturar_estadia_is_check_in](
@p_charge_stay_booking_id int,
@p_charge_stay_is_check_in int = 0 OUTPUT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM LA_MAYORIA.Estadia e
		WHERE e.Id_Reserva = @p_charge_stay_booking_id
		AND e.Check_In IS NOT NULL
		AND e.Check_Out IS NULL)
		SET @p_charge_stay_is_check_in = 1
	ELSE
		SET @p_charge_stay_is_check_in = 0
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_facturar_estadia_is_exist](
@p_charge_stay_booking_id int,
@p_charge_stay_is_exist int = 0 OUTPUT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM LA_MAYORIA.Estadia e
		WHERE e.Id_Reserva = @p_charge_stay_booking_id
	)
		SET @p_charge_stay_is_exist = 1
	ELSE
		SET @p_charge_stay_is_exist = 0
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_facturar_estadia_was_charged](
@p_charge_stay_booking_id int,
@p_charge_stay_was_charged int = 0 OUTPUT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM LA_MAYORIA.Estadia e
		INNER JOIN LA_MAYORIA.Facturacion f
			ON e.Id_Estadia = f.Id_Estadia
		WHERE e.Id_Reserva = @p_charge_stay_booking_id
	)
		SET @p_charge_stay_was_charged = 1
	ELSE
		SET @p_charge_stay_was_charged = 0
END
GO

CREATE PROCEDURE LA_MAYORIA.[sp_facturar_estadia_get_charge](
@p_charge_stay_stay_id int
)
AS
BEGIN
	SELECT 
		c.Descripcion, 
		cr.Cantidad, 
		c.Precio 
		FROM LA_MAYORIA.Estadia e 
		INNER JOIN LA_MAYORIA.Consumible_Reserva cr 
			ON e.Id_Estadia = cr.Id_Estadia
		INNER JOIN LA_MAYORIA.Consumible c
			ON c.Id_Codigo = cr.Id_Codigo
		WHERE e.Id_Estadia = @p_charge_stay_stay_id
	UNION
	SELECT 
		'Estadia por: ' + RTRIM(LTRIM(STR(DATEDIFF(DAY, e.Check_In, e.Check_Out) + 1))) + ' dias. Regimen ' + re.Descripcion,
		1,
		(re.Precio * th.Cupo) + (he.Cantidad_Estrellas * he.recarga)
		FROM LA_MAYORIA.Estadia e 
		INNER JOIN LA_MAYORIA.Reserva r
			ON e.Id_Reserva = r.Id_Reserva 
		INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
			ON e.Id_Reserva = hr.Id_Reserva
		INNER JOIN LA_MAYORIA.Habitacion h
			ON h.Id_Hotel = hr.Id_Hotel
				AND h.Piso = hr.Habitacion_Piso
				AND h.Nro = hr.Habitacion_Nro
		INNER JOIN LA_MAYORIA.Tipo_Habitacion th
			ON h.Tipo_Habitacion = th.Id_Tipo_Habitacion
		INNER JOIN LA_MAYORIA.Hotel_Estrellas he
			ON he.Id_Hotel = h.Id_Hotel
		INNER JOIN LA_MAYORIA.Regimen re
			ON re.Id_Regimen = r.Tipo_Regimen
		WHERE e.Id_Estadia = @p_charge_stay_stay_id
	UNION
	SELECT
		'Descuento por regimen: ' + re.Descripcion,
		1,
		(0 - SUM(cr.Cantidad * c.precio))
		FROM LA_MAYORIA.Estadia e
		INNER JOIN LA_MAYORIA.Reserva r
			ON r.Id_Reserva = e.Id_Reserva
		INNER JOIN LA_MAYORIA.Regimen re
			ON r.Tipo_Regimen = re.Id_Regimen
		INNER JOIN LA_MAYORIA.Consumible_Reserva cr
			ON cr.Id_Estadia = e.Id_Estadia
		INNER JOIN LA_MAYORIA.Consumible c
			ON cr.Id_Codigo = c.Id_Codigo
		WHERE UPPER(LTRIM(RTRIM(re.Descripcion))) like '%' + 'ALL INCLUSIVE' + '%'
			AND e.Id_Estadia = @p_charge_stay_stay_id
	GROUP BY re.Descripcion
	UNION
	SELECT
		'Recargo por retirarse: ' + LTRIM(STR(r.Estadia  - (DATEDIFF(DAY, e.Check_In, e.Check_Out) + 1))) + ' dias antes',
		1,
		0
		FROM LA_MAYORIA.Estadia e
		INNER JOIN LA_MAYORIA.Reserva r
			ON e.Id_Reserva = r.Id_Reserva
		WHERE r.Estadia  - (DATEDIFF(DAY, e.Check_In, e.Check_Out) + 1) > 0
		AND e.Id_Estadia = @p_charge_stay_stay_id
	ORDER BY 3 DESC
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_facturar_estadia_charge](
@p_charge_stay_stay_id int,
@p_charge_stay_client_id int,
@p_charge_stay_number_card int,
@p_charge_stay_type_pay varchar(20)
)
AS
BEGIN
	Declare @charge_stay int
	SELECT @charge_stay = (re.Precio * th.Cupo) + (he.Cantidad_Estrellas * he.recarga)
		FROM LA_MAYORIA.Estadia e 
		INNER JOIN LA_MAYORIA.Reserva r
			ON e.Id_Reserva = r.Id_Reserva 
		INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
			ON e.Id_Reserva = hr.Id_Reserva
		INNER JOIN LA_MAYORIA.Habitacion h
			ON h.Id_Hotel = hr.Id_Hotel
				AND h.Piso = hr.Habitacion_Piso
				AND h.Nro = hr.Habitacion_Nro
		INNER JOIN LA_MAYORIA.Tipo_Habitacion th
			ON h.Tipo_Habitacion = th.Id_Tipo_Habitacion
		INNER JOIN LA_MAYORIA.Hotel_Estrellas he
			ON he.Id_Hotel = h.Id_Hotel
		INNER JOIN LA_MAYORIA.Regimen re
			ON re.Id_Regimen = r.Tipo_Regimen
		WHERE e.Id_Estadia = @p_charge_stay_stay_id

	Declare @consumable int = 0
	SELECT @consumable = SUM(cr.Cantidad * c.precio)
		FROM LA_MAYORIA.Estadia e
		INNER JOIN LA_MAYORIA.Consumible_Reserva cr
			ON cr.Id_Estadia = e.Id_Estadia
		INNER JOIN LA_MAYORIA.Consumible c
			ON cr.Id_Codigo = c.Id_Codigo
		WHERE e.Id_Estadia = @p_charge_stay_stay_id

	Declare @allInclusiveConsumable int
	IF EXISTS (SELECT 1 FROM
		LA_MAYORIA.Estadia e
		INNER JOIN LA_MAYORIA.Reserva r
			ON r.Id_Reserva = e.Id_Reserva
		INNER JOIN LA_MAYORIA.Regimen re
			ON r.Tipo_Regimen = re.Id_Regimen
		WHERE UPPER(LTRIM(RTRIM(re.Descripcion))) like '%' + 'ALL INCLUSIVE' + '%'
			AND e.Id_Estadia = @p_charge_stay_stay_id)
		SET @allInclusiveConsumable = 0 - @consumable
	ELSE
		SET @allInclusiveConsumable = 0

	Declare @day_diff_stop_stay int

	SELECT @day_diff_stop_stay = (r.Estadia  - (DATEDIFF(DAY, e.Check_In, e.Check_Out) + 1))
		FROM LA_MAYORIA.Estadia e
		INNER JOIN LA_MAYORIA.Reserva r
			ON e.Id_Reserva = r.Id_Reserva
		WHERE e.Id_Estadia = @p_charge_stay_stay_id

	BEGIN TRANSACTION
		Declare @invoice int
		INSERT INTO LA_MAYORIA.Facturacion(Id_Estadia, Id_Cliente, Total_Factura, Total_Estadia, Total_Consumibles, Fecha_Facturacion)
		VALUES (@p_charge_stay_stay_id, @p_charge_stay_client_id, @charge_stay + @consumable + @allInclusiveConsumable,
			@charge_stay, @consumable + @allInclusiveConsumable, CAST(GETDATE() AS DATE))
		SET @invoice = @@IDENTITY

		--Estadia
		INSERT INTO LA_MAYORIA.Facturacion_Detalle(Id_Factura, Id_Estadia, Descripcion, Precio, Cantidad)
		VALUES (@invoice, @p_charge_stay_stay_id, 'estadia', @charge_stay, 1)

		--Recargo retirarse antes
		IF (@day_diff_stop_stay != 0)
			INSERT INTO LA_MAYORIA.Facturacion_Detalle (Id_Factura, Id_Estadia, Descripcion, Precio, Cantidad)
			VALUES (@invoice, @p_charge_stay_stay_id, 
				'Recargo por retirarse: ' + LTRIM(STR(@day_diff_stop_stay)) + ' dias antes', 0, 1)

		--Consumibles
		INSERT INTO LA_MAYORIA.Facturacion_Detalle (Id_Factura, Id_Estadia, Descripcion, Precio, Cantidad)
		SELECT @invoice, @p_charge_stay_stay_id, c.Descripcion, c.Precio, cr.Cantidad
		FROM LA_MAYORIA.Estadia e 
		INNER JOIN LA_MAYORIA.Consumible_Reserva cr 
			ON e.Id_Estadia = cr.Id_Estadia
		INNER JOIN LA_MAYORIA.Consumible c
			ON c.Id_Codigo = cr.Id_Codigo
		WHERE e.Id_Estadia = @p_charge_stay_stay_id

		--Descuento all inclusive
		IF (@allInclusiveConsumable < 0)
			INSERT INTO LA_MAYORIA.Facturacion_Detalle (Id_Factura, Id_Estadia, Descripcion, Precio, Cantidad)
			VALUES (@invoice, @p_charge_stay_stay_id, 
				'Descuento por regimen', @allInclusiveConsumable, 1)

		IF (UPPER(LTRIM(RTRIM(@p_charge_stay_type_pay))) = 'EFECTIVO')
		BEGIN
			Declare @typePay int
			SELECT @typePay = Id_Tipo_Pago FROM LA_MAYORIA.Tipo_Pago WHERE UPPER(Descripcion) = UPPER(LTRIM(RTRIM(@p_charge_stay_type_pay)))
			INSERT INTO LA_MAYORIA.Forma_Pago(Id_Factura, Id_Tipo_Pago, Tarjeta_Numero)
			VALUES (@invoice, @typePay, null)
		END
		ELSE
		BEGIN
			Declare @creditCardTypeID int
			SELECT @creditCardTypeID = Id_Tipo_Pago FROM LA_MAYORIA.Tipo_Pago WHERE UPPER(Descripcion) = UPPER('Tarjeta Credito')
			INSERT INTO LA_MAYORIA.Forma_Pago(Id_Factura, Id_Tipo_Pago, Tarjeta_Numero)
			VALUES (@invoice, @creditCardTypeID, @p_charge_stay_number_card)
		END

	COMMIT TRANSACTION
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadistic_top_5_hotel_canceled](
@p_estadistic_from datetime,
@p_estadistic_to datetime
)
AS
BEGIN
	Declare @truncateFrom datetime = CAST(@p_estadistic_from AS DATE)
	Declare @truncateTo datetime = CAST(@p_estadistic_to AS DATE)
	
	SELECT TOP 5 
		hr.Id_Hotel 'Id Hotel',
		COUNT(*)  'Reservas Canceladas'
	FROM LA_MAYORIA.Reserva r
	INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
		ON r.Id_Reserva = hr.Id_Reserva
	INNER JOIN LA_MAYORIA.Estado_Reserva er
		ON r.Estado = er.Id_Estado
	WHERE UPPER(er.Descripcion) LIKE '%' + 'CANCELADA' + '%'
	AND r.Fecha_Inicio BETWEEN @truncateFrom AND @truncateTo
	GROUP BY hr.Id_Hotel
	ORDER BY 2 DESC
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadistic_top_5_hotel_consumable_charge](
@p_estadistic_from datetime,
@p_estadistic_to datetime
)
AS
BEGIN
	Declare @truncateFrom datetime = CAST(@p_estadistic_from AS DATE)
	Declare @truncateTo datetime = CAST(@p_estadistic_to AS DATE)

	SELECT TOP 5 
		hr.Id_Hotel 'Id Hotel',
		SUM(c.Precio) 'Consumibles Facturados'
	FROM LA_MAYORIA.Consumible_Reserva cr
	INNER JOIN LA_MAYORIA.Consumible c
		ON cr.Id_Codigo = c.Id_Codigo
	INNER JOIN LA_MAYORIA.Estadia e
		ON e.Id_Estadia = cr.Id_Estadia
	INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
		ON e.Id_Reserva = hr.Id_Reserva
	INNER JOIN LA_MAYORIA.Facturacion f 
		ON f.Id_Estadia = e.Id_Estadia
	WHERE f.Fecha_Facturacion BETWEEN @truncateFrom AND @truncateTo
	GROUP BY hr.Id_Hotel
	ORDER BY 2 DESC
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadistic_top_5_hotel_more_days_out](
@p_estadistic_from datetime,
@p_estadistic_to datetime
)
AS
BEGIN
	Declare @truncateFrom datetime = CAST(@p_estadistic_from AS DATE)
	Declare @truncateTo datetime = CAST(@p_estadistic_to AS DATE)

	SELECT TOP 5
		hbh.Id_Hotel 'Id Hotel',
		SUM(DATEDIFF(DAY, hbh.Fecha_Inicio, hbh.Fecha_Fin)) 'Días'
	FROM LA_MAYORIA.Historial_Baja_Hotel hbh
	WHERE ( 
		(hbh.Fecha_Inicio BETWEEN @truncateFrom AND @truncateTo) 
		OR (hbh.Fecha_Fin BETWEEN @truncateFrom AND @truncateTo)
	)
	GROUP BY hbh.Id_Hotel
	ORDER BY 2 DESC
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadistic_top_5_room_hotel_most_occupied](
@p_estadistic_from datetime,
@p_estadistic_to datetime
)
AS
BEGIN
	Declare @truncateFrom datetime = CAST(@p_estadistic_from AS DATE)
	Declare @truncateTo datetime = CAST(@p_estadistic_to AS DATE)

	SELECT TOP 5
		hr.Habitacion_Nro 'Habitacion',
		hr.Habitacion_Piso 'Piso',
		hr.Id_Hotel 'Id Hotel',
		SUM(DATEDIFF(DAY, e.Check_In, e.Check_Out)) 'Días',
		COUNT(1) 'Veces'
	FROM LA_MAYORIA.Estadia e
	INNER JOIN LA_MAYORIA.Habitacion_Reserva hr
		ON e.Id_Reserva = hr.Id_Reserva
	WHERE ( 
		(e.Check_In BETWEEN @truncateFrom AND @truncateTo) 
		OR (e.Check_Out BETWEEN @truncateFrom AND @truncateTo)
	)
	GROUP BY hr.Id_Hotel, hr.Habitacion_Piso, hr.Habitacion_Nro
	ORDER BY 4 DESC, 5 DESC
END
GO

CREATE PROCEDURE [LA_MAYORIA].[sp_estadistic_top_5_client_more_points](
@p_estadistic_from datetime,
@p_estadistic_to datetime
)
AS
BEGIN
	Declare @truncateFrom datetime = CAST(@p_estadistic_from AS DATE)
	Declare @truncateTo datetime = CAST(@p_estadistic_to AS DATE)

	SELECT TOP 5
		c.Id_Cliente 'Id Cliente',
		c.Nombre 'Nombre',
		c.Apellido 'Apellido',
		CONVERT(INT,SUM((f.Total_Estadia / 10) +  (f.Total_Consumibles / 5))) 'Puntos'
	FROM LA_MAYORIA.Facturacion f
	INNER JOIN LA_MAYORIA.Clientes c
		ON f.Id_Cliente = c.Id_Cliente
	WHERE f.Fecha_Facturacion BETWEEN @truncateFrom AND @truncateTo
	GROUP BY c.Id_Cliente, c.Nombre, c.Apellido
	ORDER BY 4 DESC
END
GO


--NICOLAS
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
 		
create procedure [LA_MAYORIA].[sp_assign_room](
@p_hotel_id as int,
@p_id_usuario as varchar (20),
@p_client_id as int,
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
			INSERT INTO LA_MAYORIA.Reserva (Fecha_Inicio, Estadia, Tipo_Regimen, Estado, Id_Usuario)
			VALUES (@p_checkin, @p_stay, (select reg.Id_Regimen
											from LA_MAYORIA.Regimen reg
											where @p_regimen=reg.Descripcion)
					, @estado, @p_id_usuario)
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
							where UPPER(est.Descripcion)=UPPER('Reserva Modificada')),
							Id_Usuario = @p_id_usuario
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
GO