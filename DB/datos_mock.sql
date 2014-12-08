INSERT INTO LA_MAYORIA.Reserva (Id_Reserva, Fecha_Inicio, Estadia, Tipo_Regimen, Estado)
VALUES (110741, CAST(GETDATE() AS DATE), 4, 3, 1)

INSERT INTO LA_MAYORIA.Habitacion_Reserva (Id_Hotel, Id_Reserva, Habitacion_Nro, Habitacion_Piso) 
VALUES (1, 110741, 2, 8)

INSERT INTO LA_MAYORIA.Reserva_Cliente (Id_Reserva, Id_Cliente) VALUES (110741, 51306)

INSERT INTO LA_MAYORIA.Estadia (Id_Reserva, Check_In, Id_Usuario_Check_In, Check_Out, Id_Usuario_Check_Out)
VALUES (110741, CAST(GETDATE() AS DATE), 'admin', null, null)