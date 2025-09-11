// Draw GUI Event for obj_touch_controls

// Get the dimensions of the GUI layer
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

// --- Position and Draw the Controls ---

// Position the D-pad in the bottom-left corner
dpad_x = 120;
dpad_y = gui_height - 120;
// CHANGED: Using your D-pad sprite name
draw_sprite(dpad_sprite, 0, dpad_x, dpad_y);

// Position the Action button in the bottom-right corner
button_a_x = gui_width - 120;
button_a_y = gui_height - 120;
// CHANGED: Using your action button sprite name
draw_sprite(interact_sprite, 0, button_a_x, button_a_y);

// Position the Back button next to the Action button
button_b_x = gui_width - 240; // Position it a bit to the left of the other button
button_b_y = gui_height - 120;
draw_sprite(spr_back_button, 0, button_b_x, button_b_y);

// --- Visual Feedback (Optional but Recommended) ---
if (global.v_left || global.v_right || global.v_up || global.v_down) {
    // CHANGED: Using your D-pad sprite name
    draw_sprite_ext(dpad_sprite, 0, dpad_x, dpad_y, 1, 1, 0, c_white, 0.5);
}

if (global.v_action1) {
    // CHANGED: Using your action button sprite name
    draw_sprite_ext(interact_sprite, 0, button_a_x, button_a_y, 1, 1, 0, c_white, 0.5);
}

if (global.v_action2) {
    draw_sprite_ext(spr_back_button, 0, button_b_x, button_b_y, 1, 1, 0, c_white, 0.5);
}