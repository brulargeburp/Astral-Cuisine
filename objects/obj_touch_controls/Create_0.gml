// Create Event for obj_touch_controls
show_debug_message("obj_touch_controls EXISTS and has been CREATED.");

// These variables will tell the player object what to do.
global.v_left = false;
global.v_right = false;
global.v_up = false;
global.v_down = false;
global.v_action1 = false;
global.v_action2 = false; // Virtual "B" button is pressed
global.v_action1_pressed = false; // This will be true for ONLY one frame

// CHANGED: Using your correct sprite name to get the size for collision checks.
dpad_radius = sprite_get_width(dpad_sprite) / 2;

// We will calculate the positions in the Draw GUI event
// so they scale correctly with different screen sizes.
button_b_x = 0;
button_b_y = 0;
dpad_x = 0
dpad_y = 0
button_a_x = 0;
button_a_y = 0;