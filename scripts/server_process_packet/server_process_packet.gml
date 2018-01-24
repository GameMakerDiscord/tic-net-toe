/// @param message_id
/// @param buffer 
var _message_id = argument0,
	_buffer = argument1;

switch(_message_id){
	case MSG_INPUT:
		var _cx = buffer_read(_buffer,buffer_u8),
			_cy = buffer_read(_buffer,buffer_u8);
		
		with(GameBoard){
			grid[# _cx, _cy] = player_types.o;	
			state = gameboard_states.my_turn;
		}
		
		push_notification("It's your turn!", -1);

	break;
}