if(hover_x != -1 && hover_y != -1){
	draw_sprite_ext(spr_game_piece,player_type,x + hover_x * cell_size, y + hover_y * cell_size, image_xscale, image_yscale, 0, c_white, 1);
}

var _cx = 0;
repeat(3){
	var _cy = 0;
	repeat(3){
		var _grid_value = grid[# _cx, _cy];
		if(_grid_value >= 0){
			var _x = x + _cx * cell_size,
				_y = y + _cy * cell_size;
			
			draw_sprite_ext(spr_game_piece,_grid_value,_x,_y,image_xscale,image_yscale,0,c_white,1);
		}
		++_cy;
	}
	++_cx;
}

draw_self();