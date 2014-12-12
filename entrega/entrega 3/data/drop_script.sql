DROP PROCEDURE LA_MAYORIA.sp_login_check_valid_user

DROP PROCEDURE LA_MAYORIA.sp_login_check_password

DROP PROCEDURE LA_MAYORIA.sp_password_check_ok

DROP PROCEDURE LA_MAYORIA.sp_password_change

DROP PROCEDURE LA_MAYORIA.sp_rol_exist_one_by_user

DROP PROCEDURE LA_MAYORIA.sp_hotel_exist_one_by_user

DROP PROCEDURE LA_MAYORIA.sp_menu_list_functionality_by_user

DROP PROCEDURE LA_MAYORIA.sp_user_search

DROP PROCEDURE LA_MAYORIA.sp_user_enable_disable

DROP PROCEDURE LA_MAYORIA.sp_user_clean_login

DROP PROCEDURE LA_MAYORIA.sp_user_data_get_by_user

DROP PROCEDURE LA_MAYORIA.sp_user_search_rol_hotel_by_user

DROP PROCEDURE LA_MAYORIA.sp_user_save_update

DROP PROCEDURE LA_MAYORIA.sp_rol_search

DROP PROCEDURE LA_MAYORIA.sp_rol_enable_disable

DROP PROCEDURE LA_MAYORIA.sp_rol_functionality_availability

DROP PROCEDURE LA_MAYORIA.sp_rol_functionality_enabled

DROP PROCEDURE LA_MAYORIA.sp_rol_create

DROP PROCEDURE LA_MAYORIA.sp_rol_functionality_add

DROP PROCEDURE LA_MAYORIA.sp_rol_functionality_remove

DROP PROCEDURE LA_MAYORIA.sp_client_search

DROP PROCEDURE LA_MAYORIA.sp_client_enable_disable

DROP PROCEDURE LA_MAYORIA.sp_client_data_get_by_id_client

DROP PROCEDURE LA_MAYORIA.sp_client_save_update

DROP PROCEDURE LA_MAYORIA.sp_client_check_exist_mail

DROP PROCEDURE LA_MAYORIA.sp_client_check_exist_document

DROP PROCEDURE LA_MAYORIA.sp_hotel_search

DROP PROCEDURE LA_MAYORIA.sp_hotel_regimen_available

DROP PROCEDURE LA_MAYORIA.sp_hotel_regimen_assign

DROP PROCEDURE LA_MAYORIA.sp_hotel_data_get_by_id

DROP PROCEDURE LA_MAYORIA.sp_hotel_save_update

DROP PROCEDURE LA_MAYORIA.sp_hotel_regimen_add

DROP PROCEDURE LA_MAYORIA.sp_hotel_regimen_remove

DROP PROCEDURE LA_MAYORIA.sp_hotel_close_period_valid

DROP PROCEDURE LA_MAYORIA.sp_habitacion_search

DROP PROCEDURE LA_MAYORIA.sp_habitacion_close_period_valid

DROP PROCEDURE LA_MAYORIA.sp_habitacion_exist_hotel_room

DROP PROCEDURE LA_MAYORIA.sp_habitacion_data_get_by_id

DROP PROCEDURE LA_MAYORIA.sp_habitacion_save_update

DROP PROCEDURE LA_MAYORIA.sp_habitacion_person_per_room_by_booking_id

DROP PROCEDURE LA_MAYORIA.sp_regimen_search

DROP PROCEDURE LA_MAYORIA.sp_cancelacion_reserva_search

DROP PROCEDURE LA_MAYORIA.sp_cancelacion_reserva_cancel

DROP PROCEDURE LA_MAYORIA.sp_estadia_booking_search

DROP PROCEDURE LA_MAYORIA.sp_estadia_booking_is_exist

DROP PROCEDURE LA_MAYORIA.sp_estadia_booking_is_cancel

DROP PROCEDURE LA_MAYORIA.sp_estadia_booking_is_hotel

DROP PROCEDURE LA_MAYORIA.sp_estadia_booking_is_before

DROP PROCEDURE LA_MAYORIA.sp_estadia_generate_stay

DROP PROCEDURE LA_MAYORIA.sp_estadia_cancel_is_after_date_check_in

DROP PROCEDURE LA_MAYORIA.sp_estadia_is_for_check_in

DROP PROCEDURE LA_MAYORIA.sp_estadia_exist_full_stay

DROP PROCEDURE LA_MAYORIA.sp_estadia_generate_checkout

DROP PROCEDURE LA_MAYORIA.sp_check_client_search

DROP PROCEDURE LA_MAYORIA.sp_estadia_save_stay_client

DROP PROCEDURE LA_MAYORIA.sp_consumibles_estadias_search

DROP PROCEDURE LA_MAYORIA.sp_consumible_filter

DROP PROCEDURE LA_MAYORIA.sp_consumible_by_estadia_search

DROP PROCEDURE LA_MAYORIA.sp_estadia_consumible_add

DROP PROCEDURE LA_MAYORIA.sp_estadia_consumible_remove

DROP PROCEDURE LA_MAYORIA.sp_facturar_estadia_booking_search

DROP PROCEDURE LA_MAYORIA.sp_facturar_estadia_is_check_in

DROP PROCEDURE LA_MAYORIA.sp_facturar_estadia_is_exist

DROP PROCEDURE LA_MAYORIA.sp_facturar_estadia_was_charged

DROP PROCEDURE LA_MAYORIA.sp_facturar_estadia_get_charge

DROP PROCEDURE LA_MAYORIA.sp_facturar_estadia_charge

DROP PROCEDURE LA_MAYORIA.sp_estadistic_top_5_hotel_canceled

DROP PROCEDURE LA_MAYORIA.sp_estadistic_top_5_hotel_consumable_charge

DROP PROCEDURE LA_MAYORIA.sp_estadistic_top_5_hotel_more_days_out

DROP PROCEDURE LA_MAYORIA.sp_estadistic_top_5_room_hotel_most_occupied

DROP PROCEDURE LA_MAYORIA.sp_estadistic_top_5_client_more_points

--NICO

DROP PROCEDURE LA_MAYORIA.sp_reserva_listar

DROP PROCEDURE LA_MAYORIA.sp_hotel_regimen_retrieve

DROP PROCEDURE LA_MAYORIA.sp_tipo_habitacion_available

DROP PROCEDURE LA_MAYORIA.sp_reserva_occupied

DROP PROCEDURE LA_MAYORIA.sp_room_type_total

DROP PROCEDURE LA_MAYORIA.sp_get_reserva

DROP FUNCTION LA_MAYORIA.check_availability

drop procedure LA_MAYORIA.sp_check_hotel_availability

drop procedure LA_MAYORIA.sp_assign_room



DROP TABLE LA_MAYORIA.Datos_Usuario

DROP TABLE LA_MAYORIA.Hotel_Estrellas

DROP TABLE LA_MAYORIA.Usuario_Rol_Hotel

DROP TABLE LA_MAYORIA.Regimen_Hotel

DROP TABLE LA_MAYORIA.Rol_Funcionalidad

DROP TABLE LA_MAYORIA.Historial_Baja_Hotel

DROP TABLE LA_MAYORIA.Historial_Baja_Habitacion

DROP TABLE LA_MAYORIA.Historial_Cancelacion_Reserva

DROP TABLE LA_MAYORIA.Consumible_Reserva

DROP TABLE LA_MAYORIA.Facturacion_Detalle

DROP TABLE LA_MAYORIA.Forma_Pago

DROP TABLE LA_MAYORIA.Estadia_Cliente

--PRINCIPALES/BASE
DROP TABLE LA_MAYORIA.Trimestre

DROP TABLE LA_MAYORIA.Estadistica

DROP TABLE LA_MAYORIA.Ano

DROP TABLE LA_MAYORIA.Tipo_Pago

DROP TABLE LA_MAYORIA.Facturacion

DROP TABLE LA_MAYORIA.Reserva_Cliente

DROP TABLE LA_MAYORIA.Clientes

DROP TABLE LA_MAYORIA.Nacionalidad

DROP TABLE LA_MAYORIA.Tipo_Identificacion

DROP TABLE LA_MAYORIA.Funcionalidad

DROP TABLE LA_MAYORIA.Habitacion_Reserva

DROP TABLE LA_MAYORIA.Estadia

DROP TABLE LA_MAYORIA.Reserva

DROP TABLE LA_MAYORIA.Regimen

DROP TABLE LA_MAYORIA.Consumible

DROP TABLE LA_MAYORIA.Habitacion

DROP TABLE LA_MAYORIA.Tipo_Habitacion

DROP TABLE LA_MAYORIA.Estado_Reserva

DROP TABLE LA_MAYORIA.Rol

DROP TABLE LA_MAYORIA.Hotel

DROP TABLE LA_MAYORIA.Estrellas

DROP TABLE LA_MAYORIA.Frente

DROP TABLE LA_MAYORIA.Usuario

DROP SCHEMA LA_MAYORIA