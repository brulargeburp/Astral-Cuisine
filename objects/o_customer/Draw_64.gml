//// Draw GUI Event of o_customer

//// Only draw the order if we are in the "ordering" state
//if (state == "ordering") {
    
//    // -- CORRECTED VARIABLE NAME --
//    // Get the active camera and its position in the room
//    var current_camera = view_camera[0]; // Store the camera ID in a NEW variable
//    var cam_x = camera_get_view_x(current_camera);
//    var cam_y = camera_get_view_y(current_camera);
    
//    // Convert our world position (x,y) to a screen position
//    var draw_x = x - cam_x;
//    var draw_y = y - cam_y;
    
//    // --- The rest of the drawing code is fine ---
//    // Draw speech bubble background
//    draw_set_color(c_white);
    
//    // Draw the sprite of the food they want
//    draw_sprite(order.sprite, 0, draw_x, draw_y - 45);
//}