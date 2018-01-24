/// @param x 
/// @param player_type
var _x = argument0,
	_player_type = argument1,
	_y = 0;

repeat(3){
	if(grid[# _x, _y] != _player_type){
		return false;	
	}
	++_y;
}

return true;