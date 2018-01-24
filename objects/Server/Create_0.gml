port = 5000;

socket = network_create_server(network_socket_tcp,port,1);


client_sockets = ds_list_create();
clients = ds_map_create();

send_buffer = buffer_create(128, buffer_grow,1);
global._is_server = true;

if(socket < 0){
	push_notification("Unable to open server on port " + string(port),2*room_speed,on_failed_connection);	
	instance_destroy();
}else{
	push_notification("Opened server - waiting for opponent to join!",-1);
}