var _cx = 0;
repeat(3){
	var _cy = 0;
	repeat(3){
		if(grid[# _cx, _cy] == -1){
			return false;	
		}
		++_cy;
	}
	++_cx;
}

return true;