/// @param socket
/// @param buffer
var _socket = argument0,
	_buffer = argument1;
//Seek to start 
buffer_seek(_buffer,buffer_seek_start,0);

//Write header 
buffer_write(_buffer, buffer_u8, MSG_CONNECT);

network_send_packet(_socket,_buffer,buffer_tell(_buffer));

	