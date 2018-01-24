if(is_server()){
	with(GameBoard){
		state = gameboard_states.my_turn;
		push_notification("New game started! It's your turn...",-1);
	}
}else{
	with(GameBoard){
		state = gameboard_states.waiting;
		push_notification("New game started! Waiting for opponent...",-1);
	}
}
