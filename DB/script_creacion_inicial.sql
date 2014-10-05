/****** Object:  Schema [LA_MINORIA]    Script Date: 04/10/2014 23:39:06 ******/

/****************************************************************/
--						CREAR ESQUEMA
/****************************************************************/

CREATE SCHEMA [LA_MINORIA] AUTHORIZATION [gd]
GO

/****************************************************************/
--				CREAR TABLAS E INSERTAR DATOS
/****************************************************************/

CREATE TABLE [LA_MINORIA].[Usuario](
	[Id_Usuario][varchar](20) NOT NULL,
	[Password][varchar](64) NOT NULL,
	[Cantidad_Login][Int] NOT NULL,
	[Ultima_Fecha][datetime] NULL,
	[Habilitado][bit] NULL
	
	CONSTRAINT UQ_Usuarios_Id_Usuario UNIQUE(Id_Usuario)
)

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

	CONSTRAINT UQ_Funcionalidad_Id_Funcionalidad UNIQUE(Id_Funcionalidad)
)

INSERT INTO LA_MINORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(1,'Login y Seguridad')
INSERT INTO LA_MINORIA.Funcionalidad(Id_Funcionalidad,Descripcion) VALUES(2,'ABM de Rol')

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

	CONSTRAINT UQ_Usuario_Rol_Id_Usuario UNIQUE(Id_Usuario),
	CONSTRAINT [FK_Usuario_Rol_Usuario_Id_Usuario] FOREIGN KEY(Id_Usuario)
		REFERENCES [LA_MINORIA].[Usuario] (Id_Usuario),
	CONSTRAINT [FK_Usuario_Rol_Rol_Id_Rol] FOREIGN KEY(Id_Rol)
		REFERENCES [LA_MINORIA].[Rol] (Id_Rol)
)