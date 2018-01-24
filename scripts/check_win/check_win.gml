/// @param player_type
var _player_type = argument0;

var _x = 0;
repeat(3){
	if(check_col(_x,_player_type)){
		return true;	
	}
	++_x;
}


var _y = 0;
repeat(3){
	if(check_row(_y,_player_type)){
		return true;	
	}
	++_y;
}

if(check_diag(0,_player_type) || check_diag(2,_player_type)){
	return true;	
}

return false;