remote_ip = "localhost";
remote_port = 5000;

client = network_create_socket(network_socket_tcp);
socket = network_connect(client,remote_ip,remote_port);
send_buffer = buffer_create(128, buffer_grow,1);

if(socket < 0){
	push_notification("Unable to connect to server at " + string(remote_ip)+":"+string(remote_port),2*room_speed,on_failed_connection);	
	instance_destroy();
}else{
	push_notification("Attempting to connect to server at " + string(Client.remote_ip) +":"+string(Client.remote_port),-1);	
}
	

