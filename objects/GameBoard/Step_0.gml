if(check_win(player_type)){
	push_notification("You WON!",2*room_speed,on_game_end);
	state = gameboard_states.waiting;
	ds_grid_clear(grid,-1);
}else if(check_win(!player_type)){
	push_notification("You LOST!",2*room_speed,on_game_end);
	state = gameboard_states.waiting;
	ds_grid_clear(grid,-1);
}else if(check_stalemate()){
	push_notification("Stale mate!",2*room_speed,on_game_end);
	state = gameboard_states.waiting;
	ds_grid_clear(grid,-1);
}

if(state == gameboard_states.waiting){
	hover_x = -1;
	hover_y = -1;
	exit;
}else{
	player_type = (is_server()) ? player_types.x : player_types.o;
	hover_x = floor((mouse_x - x) / cell_size);
	hover_y = floor((mouse_y - y) / cell_size);

	if(hover_x < 0 || hover_x > 2){
		hover_x = -1;	
	}

	if(hover_y < 0 || hover_y > 2){
		hover_y = -1;	
	}
	
	if(hover_x != -1 && hover_y != -1){
		var _grid_value = grid[# hover_x, hover_y];
		
		if(_grid_value >=0){
			hover_x = -1;
			hover_y = -1;
		}else if(mouse_check_button_pressed(mb_left)){
			grid[# hover_x, hover_y] = player_type;
			
			
			if(is_server()){
				send_game_state(Server.client_sockets[| 0], Server.send_buffer, grid);
			}else{
				send_input(Client.socket, Client.send_buffer, hover_x, hover_y);
			}
			
			push_notification("Waiting for opponents move...",-1);
			state = gameboard_states.waiting;
			hover_x = -1;
			hover_y = -1;
			
		}
	}
}

