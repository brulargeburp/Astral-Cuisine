// In Step Event of obj_inventory_menu

// Check for a click on the close button
if (mouse_check_button_pressed(mb_left)) {
    var touch_x = device_mouse_x_to_gui(0);
    var touch_y = device_mouse_y_to_gui(0);
    
    var close_button_y = menu_y + menu_height - 50;
    if (point_in_rectangle(touch_x, touch_y, menu_x, close_button_y, menu_x + menu_width, close_button_y + 40)) {
        instance_destroy();
    }
}