// Draw GUI Event for obj_touch_controls

// DO NOT draw the object's own sprite. We are drawing everything manually.
// draw_self(); // <--- DELETE THIS LINE

// Get the dimensions of the GUI layer
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

// To align everything and move it down, we will use ONE variable.
var control_height = gui_height - 150;

// --- Position and Draw the Controls ---

// Position the D-pad in the bottom-left corner
// We store these in instance variables so the visual feedback part can see them
dpad_x = 150
dpad_y = control_height;
draw_sprite(dpad_sprite, 0, dpad_x, dpad_y);

// Position the Action button in the bottom-right corner
button_a_x = gui_width - 120;
button_a_y = control_height;
draw_sprite(interact_sprite, 0, button_a_x, button_a_y);

//// Position the Back button next to the Action button
//button_b_x = gui_width - 240;
//button_b_y = control_height;
//draw_sprite(spr_back_button, 0, button_b_x, button_b_y);


// --- Visual Feedback (Optional but Recommended) ---

if (global.v_left || global.v_right || global.v_up || global.v_down) {
    draw_sprite_ext(dpad_sprite, 0, dpad_x, dpad_y, 1, 1, 0, c_white, 0.5);
}

if (global.v_action1) {
    draw_sprite_ext(interact_sprite, 0, button_a_x, button_a_y, 1, 1, 0, c_white, 0.5);
}

//if (global.v_action2) {
//    draw_sprite_ext(spr_back_button, 0, button_b_x, button_b_y, 1, 1, 0, c_white, 0.5);
//}