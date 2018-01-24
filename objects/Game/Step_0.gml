if(state == game_states.idle){
	if(keyboard_check_pressed(vk_f1)){
		instance_create_depth(0,0,0,Server);
		state = game_states.server;
	}
	if(keyboard_check_pressed(vk_f2)){
		instance_create_depth(0,0,0,Client);	
		state = game_states.client;
	}
		
}