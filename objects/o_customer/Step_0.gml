// Step Event of o_customer

// --- State Machine Logic ---
switch (state) {
    
    case "walking":
        if (instance_exists(target_instance)) {
            // Move towards the target
            var dir = point_direction(x, y, target_instance.x, target_instance.y);
            x += lengthdir_x(move_speed, dir);
            y += lengthdir_y(move_speed, dir);
            
            // If we've arrived...
            if (distance_to_object(target_instance) < move_speed) {
                x = target_instance.x;
                y = target_instance.y;
                
                // If we arrived at the register, it's time to order
                if (target_instance == register_pos) {
                    state = "ordering";
                    order = global.recipes[irandom(array_length(global.recipes) - 1)];
                    image_speed = 0; // Stop walking animation
                }
            }
        }
        break;

    case "leaving":
        if (instance_exists(exit_pos)) {
            var dir = point_direction(x, y, exit_pos.x, exit_pos.y);
            x += lengthdir_x(move_speed, dir);
            y += lengthdir_y(move_speed, dir);
            
            // If we've reached the exit, disappear
            if (distance_to_object(exit_pos) < move_speed) {
                // Tell the queue manager we're gone
                array_delete(o_queue_manager.queue, 0, 1);
                instance_destroy();
            }
        }
        break;
}