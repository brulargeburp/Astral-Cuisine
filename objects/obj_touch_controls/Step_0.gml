// Step Event for obj_touch_controls

// --- Reset button states every frame ---
global.v_left = false;
global.v_right = false;
global.v_up = false;
global.v_down = false;
global.v_action1 = false;
global.v_action2 = false;


// --- Check for all active touches on the screen ---
for (var i = 0; i < 5; ++i) {
    // Check if a finger/touch is currently down
    if (device_mouse_check_button(i, mb_left)) {
        
        var touch_x = device_mouse_x_to_gui(i);
        var touch_y = device_mouse_y_to_gui(i);
		var button_b_radius = sprite_get_width(spr_back_button) / 2;
        
        // --- Check D-Pad Touches ---
        if (point_in_circle(touch_x, touch_y, dpad_x, dpad_y, dpad_radius)) {
            var dir = point_direction(dpad_x, dpad_y, touch_x, touch_y);
            
            if (dir > 135 && dir <= 225) {
                global.v_left = true;
            } else if (dir > 315 || dir <= 45) {
                global.v_right = true;
            } else if (dir > 45 && dir <= 135) {
                global.v_up = true;
            } else if (dir > 225 && dir <= 315) {
                global.v_down = true;
            }
        }
        
        // --- Check Action Button Touches ---
        // CHANGED: Using your correct action button sprite name here.
        var button_a_radius = sprite_get_width(interact_sprite) / 2;
        if (point_in_circle(touch_x, touch_y, button_a_x, button_a_y, button_a_radius)) {
            global.v_action1 = true;
			global.v_action2 = true;
        }
    }
}