/// @param socket
/// @param buffer
/// @param grid
var _socket = argument0,
	_buffer = argument1,
	_grid = argument2;

//Seek to start 
buffer_seek(_buffer,buffer_seek_start,0);

//Write header 
buffer_write(_buffer, buffer_u8, MSG_GAME_STATE);

var _cx = 0;
repeat(3){
	var _cy = 0;
	repeat(3){
		buffer_write(_buffer, buffer_s8, _grid[# _cx, _cy]);
		++_cy;	
	}
	++_cx;
}



network_send_packet(_socket,_buffer,buffer_tell(_buffer));

	