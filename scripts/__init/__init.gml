enum game_states{
	idle,
	server,
	client
}

enum player_types{
	x,
	o
}

enum gameboard_states{
	my_turn,
	waiting
}

#macro VIEW_WIDTH 640
#macro VIEW_HEIGHT 360


#macro MSG_CONNECT    0
#macro MSG_INPUT      1
#macro MSG_GAME_STATE 2
#macro MSG_DISCONNECT 3

global._is_server = false;

gml_pragma("global","__init()");