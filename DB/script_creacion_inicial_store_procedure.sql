USE GD2C2014
GO

create procedure SP_Login_Sucess @usuario varchar(20)
	as
	begin
		update 	LA_MINORIA.Usuario 
		set 	Cantidad_Login=0, 
				Ultima_Fecha=SYSDATETIME()
		where 	Id_Usuario=@usuario;
	end
go

create procedure SP_retrieve_Login @usuario varchar(20), @cant int output
	as
	begin
		
		set @cant=(select Cantidad_Login
						 from	LA_MINORIA.Usuario 
						 where	Id_Usuario=@usuario)
	end
go

create procedure SP_Login_Failed @user varchar (20)
	as
	begin
		update LA_MINORIA.Usuario
				set		Cantidad_Login=Cantidad_Login+1
				where	Id_Usuario=@user
				
				declare @cant_login int
				
				exec SP_retrieve_Login @user,@cant_login output

				if @cant_login=3
					begin
						update LA_MINORIA.Usuario
						set		Habilitado=0	
						where	Id_Usuario=@user
					end
	end
go

create procedure SP_Login_User @usuario varchar(20),@password varchar(64),@codigo int output
as
begin
declare	@count int,	@passDB varchar(64), @habilitado bit
	
select @count=isnull(COUNT(Id_Usuario),0), 
		@passDB=Password,
		@habilitado=Habilitado 
from	LA_MINORIA.Usuario
where	Id_Usuario=@usuario
group by Cantidad_Login,Habilitado,Password

	
	
			if  (@habilitado=0) /* si esta inhabilitado, devuelvo 1*/
				set @codigo=1
			else
				begin
					if (@password=@passDB) 
						 /*si los datos estan correctos, devuelvo 2, 
						 borro los intentos fallidos y registro la fecha*/
						begin
						exec SP_Login_Sucess @usuario
						set @codigo=2
						end
					else
						begin
						exec SP_Login_Failed @usuario
						set @codigo=3
				end
		end
	end
go

create procedure SP_Retrieve_Roles_Quantity @usuario varchar (20), @cantidad int output
as
begin
	select @cantidad=count (*)
	from 	LA_MINORIA.Usuario_Rol
	where	Id_Usuario=@usuario
	
end
go

create procedure SP_Retrieve_Roles_Names @usuario varchar (20)
as
begin
	select	R.Descripcion
	from 	LA_MINORIA.Usuario_Rol UR, LA_MINORIA.Rol R
	where	UR.Id_Rol=R.Id_Rol
	and		UR.Id_Usuario=@usuario
	and		R.Habilitado=1
end
GO

create procedure SP_Retrieve_Hotel_Quantity @usuario varchar (20), @cant int output
as
begin
	select		@cant=count(*)
	from		LA_MINORIA.Usuario_Hotel UH, LA_MINORIA.Hotel H
	where		UH.Id_Usuario=@usuario
	and			UH.Id_Hotel=H.Id_Hotel
end
go

