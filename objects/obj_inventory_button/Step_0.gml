// In Step Event of obj_inventory_button (SIMPLIFIED)

// Check if a new mouse/touch press happened this frame
if (mouse_check_button_pressed(mb_left)) {

    var touch_x = device_mouse_x_to_gui(0);
    var touch_y = device_mouse_y_to_gui(0);

    // Define the clickable area using the object's own, now-correct coordinates
    var button_x1 = x;
    var button_y1 = y;
    var button_x2 = x + sprite_width;
    var button_y2 = y + sprite_height;

    // Check if the click was inside that area
    if (point_in_rectangle(touch_x, touch_y, button_x1, button_y1, button_x2, button_y2)) {
    
        show_debug_message("SUCCESS: Inventory Button Click Detected (Final Method)");

        if (!global.menu_open) {
            instance_create_layer(0, 0, "Compatibility_Instances_Depth_0", obj_inventory_menu);
            global.menu_open = true;
        }
    }
}