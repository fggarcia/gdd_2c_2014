create procedure SP_Login_User @usuario varchar(20),@password varchar(64),@codigo int output
as
begin
declare	@count int,	@passDB varchar(64),@cant_login int, @habilitado bit
	
select @count=COUNT(Id_Usuario), 
		@passDB=Password,
		@cant_login=Cantidad_Login,
		@habilitado=Habilitado 
from	LA_MINORIA.Usuario
where	Id_Usuario=@usuario
group by Cantidad_Login,Habilitado,Password

	
	if (@count=0) /* si el usuario no existe, devuelvo 0*/
		set @codigo=0;
	else
		begin
			if (@password=@passDB) 
				begin
					if (@habilitado=0) /* si esta inhabilitado, devuelvo 1*/
						set @codigo=1 
					else
						begin
							set @codigo=2; /*si los datos estan correctos, devuelvo 2, borro los 
											intentos fallidos y registro la fecha*/
							update LA_MINORIA.Usuario set Cantidad_Login=0, Ultima_Fecha=SYSDATETIME()
							where Id_Usuario=@usuario;
						end
				end
			else
				begin
					set @codigo=3 /* si el usuario ya intento 3 veces, lo inhabilito*/
					if @cant_login=3
						begin
							update LA_MINORIA.Usuario
							set		Habilitado=0	
							where	Id_Usuario=@usuario
						end
					else
						begin /*si el usuario ingresa mal los datos, sumo 1 a la cantidad de intentos fallidos*/
							update LA_MINORIA.Usuario
							set		Cantidad_Login=Cantidad_Login+1
							where	Id_Usuario=@usuario
						end
				end
		end
	end
go

