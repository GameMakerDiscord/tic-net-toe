var _type = async_load[? "type"];

switch(_type){
	case network_type_data:
		var _to = async_load[? "id"],
			_buffer = async_load[? "buffer"];
		
		if(_to != socket){
			exit;	
		}
		
		client_process_packet(buffer_read(_buffer,buffer_u8),_buffer);
	break;
	case network_type_disconnect:
		with(GameBoard){
			ds_grid_clear(grid,-1);
			state = gameboard_states.waiting;
			push_notification("Lost connection to server! The game is over",room_speed*2,on_disconnect);
		}
		ds_list_clear(client_sockets);
	break;
}