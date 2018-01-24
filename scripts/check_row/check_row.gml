/// @param y 
/// @param player_type
var _y = argument0,
	_player_type = argument1,
	_x = 0;

repeat(3){
	if(grid[# _x, _y] != _player_type){
		return false;	
	}
	++_x;
}

return true;