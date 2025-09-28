// Check for a left mouse click
if (mouse_check_button_pressed(mb_left)) {
    var touch_x = device_mouse_x_to_gui(0);
    var touch_y = device_mouse_y_to_gui(0);
    
    // --- Check Clicks on Ingredient Buttons ---
    for (var i = 0; i < array_length(menu_options); i++) {
        // Define the clickable area for this button
        var button_y = menu_y + 40 + (i * 50);
        if (point_in_rectangle(touch_x, touch_y, menu_x, button_y, menu_x + menu_width, button_y + 40)) {
            
            // Add the clicked item to the player's inventory
            array_push(o_player.inventory, menu_options[i]);
            show_debug_message("Added " + menu_options[i] + " to inventory.");
            return; // Stop checking after a successful click
        }
    }
    
    // --- Check Click on Close Button ---
    var close_button_y = menu_y + menu_height - 60;
    if (point_in_rectangle(touch_x, touch_y, menu_x, close_button_y, menu_x + menu_width, close_button_y + 40)) {
        instance_destroy(); // Close the menu
    }
}