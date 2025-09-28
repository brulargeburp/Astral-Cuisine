// --- Drop Shadow Version ---

var _x = 10;
var _y = 10;
var _text = "Points: " + string(global.points);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

// 1. Draw the shadow
draw_set_color(c_black);
draw_text(_x + 2, _y + 2, _text); // Offset down and right by 2 pixels

// 2. Draw the main text
draw_set_color(c_white);
draw_text(_x, _y, _text);