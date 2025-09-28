// Reset all inputs
global.v_left = false;
global.v_right = false;
global.v_up = false;
global.v_down = false;
global.v_action1_pressed = false; // Reset the new variable

for (var i = 0; i < 5; ++i) {
    var touch_x = device_mouse_x_to_gui(i);
    var touch_y = device_mouse_y_to_gui(i);
    
    // --- 1. CHECK FOR HOLDS (for D-pad movement) ---
    if (device_mouse_check_button(i, mb_left)) {
        global.v_action1 = true; // This is the old "hold" variable
        
        // D-Pad Check
        if (point_in_circle(touch_x, touch_y, dpad_x, dpad_y, dpad_radius)) {
            var dir = point_direction(dpad_x, dpad_y, touch_x, touch_y);
            if (dir > 135 && dir <= 225) global.v_left = true;
            else if (dir > 315 || dir <= 45) global.v_right = true;
            else if (dir > 45 && dir <= 135) global.v_up = true;
            else if (dir > 225 && dir <= 315) global.v_down = true;
        }
    }
	
    // Check for PRESSES (for actions)
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var button_a_radius = sprite_get_width(interact_sprite) / 2;
        if (point_in_circle(touch_x, touch_y, button_a_x, button_a_y, button_a_radius)) {
            global.v_action1_pressed = true; // Set the ONE-FRAME press variable
        }
    }
}
    
    // --- 2. CHECK FOR PRESSES (for Action Buttons) ---
    if (device_mouse_check_button_pressed(i, mb_left)) {
        // Action Button Check
        var button_a_radius = sprite_get_width(interact_sprite) / 2;
        if (point_in_circle(touch_x, touch_y, button_a_x, button_a_y, button_a_radius)) {
            global.v_action1_pressed = true; // This is our new "pressed" variable
        }
    }