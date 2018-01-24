/// @param message_id
/// @param buffer 
var _message_id = argument0,
	_buffer = argument1;

switch(_message_id){
	case MSG_CONNECT:
		push_notification("Connected to server! Waiting for your turn to start...", -1);
	break;
	case MSG_GAME_STATE:
		with(GameBoard){
			ds_grid_clear(grid,-1);
			var _cx = 0;
			repeat(3){
				var _cy = 0;
				repeat(3){
					grid[# _cx, _cy] = buffer_read(_buffer, buffer_s8);	
					++_cy;
				}
				++_cx;
			}
			state = gameboard_states.my_turn;
			push_notification("It's your turn!", -1);
		}
	break;
}