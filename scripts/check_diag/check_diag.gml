/// @param start_x
/// @param player_type
var _start_x = argument0,
	_x = _start_x,
	_player_type = argument1,
	_y = 0;
	
repeat(3){
	if(grid[# _x, _y] != _player_type){
		return false;
	}
	
	if(_start_x == 0){
		++_x;
	}else{
		--_x;	
	}
	++_y;
}
return true;