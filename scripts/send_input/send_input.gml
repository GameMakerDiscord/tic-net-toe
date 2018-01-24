/// @param socket
/// @param buffer
/// @param cx
/// @param cy
var _socket = argument0,
	_buffer = argument1,
	_cx = argument2,
	_cy = argument3;

//Seek to start 
buffer_seek(_buffer,buffer_seek_start,0);

//Write header 
buffer_write(_buffer, buffer_u8, MSG_INPUT);

//Write packet 
buffer_write(_buffer, buffer_u8, _cx);
buffer_write(_buffer, buffer_u8, _cy);


network_send_packet(_socket,_buffer,buffer_tell(_buffer));

