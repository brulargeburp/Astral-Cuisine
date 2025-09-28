// In the standard Draw Event of o_register

// --- IMPORTANT: First, draw the register itself! ---
// An object with a Draw event won't draw its own sprite automatically.
draw_self();
// In Draw GUI Event of o_register (IMPLEMENTING YOUR CONCEPT)

// First, check if there is anyone in the queue
if (array_length(o_queue_manager.queue) > 0) {
    
    // Get the customer at the front of the line
    var customer = o_queue_manager.queue[0];
    
    // If that customer is ordering, draw their order bubble
    if (customer.state == "ordering") {
        
        // --- POSITIONING LOGIC ---
        
        // Convert the register's world position to a GUI position
        var _view_camera = view_camera[0];
        var cam_x = camera_get_view_x(view_camera);
        var cam_y = camera_get_view_y(view_camera);
        var anchor_x = x - cam_x;
        var anchor_y = y - cam_y;
        
        // --- THIS IS THE IMPORTANT PART ---
        // Define the fixed offset from the register to the bubble's center
        // These are the numbers you can tweak to get the perfect position!
        var x_offset = 0; 
        var y_offset = -17; 
        
        // Calculate the bubble's absolute position IN THE ROOM
        var bubble_x = x + x_offset;
        var bubble_y = y + y_offset;
        
        
        // --- DRAW THE BUBBLE AT THE NEW, FIXED POSITION ---
        
        // Draw speech bubble background
        draw_set_color(c_white);
        draw_rectangle(bubble_x - 15, bubble_y - 10, bubble_x + 15, bubble_y + 10, false);
        
        // Draw the sprite of the food they want inside the bubble
        draw_sprite_ext(customer.order.sprite, 0, bubble_x, bubble_y, 0.6, 0.6, 0, c_white, 1);
    }
}