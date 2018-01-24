var _type = async_load[? "type"];

switch(_type){
	case network_type_connect:
		var _client_socket = async_load[? "socket"],
			_client_id = ds_list_size(client_sockets);
		ds_list_add(client_sockets, _client_socket);
		send_connect(_client_socket,send_buffer);
		push_notification("Client joined! It's your turn",-1);
		GameBoard.state = gameboard_states.my_turn;
	break;
	case network_type_data:
		var _to = async_load[? "id"],
			_buffer = async_load[? "buffer"];
		
		server_process_packet(buffer_read(_buffer,buffer_u8),_buffer);
	break;
	case network_type_disconnect:
		with(GameBoard){
			ds_grid_clear(grid,-1);
			state = gameboard_states.waiting;
			push_notification("Client has disconnected! The game is over",room_speed*2,on_disconnect);
		}
		ds_list_clear(client_sockets);
	break;
	case network_type_non_blocking_connect:
	
	break;
}