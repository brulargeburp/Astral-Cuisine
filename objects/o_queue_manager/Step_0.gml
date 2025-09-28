// Step Event of o_queue_manager

// -- SPAWN NEW CUSTOMERS --
spawn_timer--;
if (spawn_timer <= 0) {
    // Only spawn if the queue is not full
    if (array_length(queue) < max_queue_size) {
        var new_customer = instance_create_layer(x, y, "Compatibility_Instances_Depth_0", o_customer);
        array_push(queue, new_customer);
    }
    spawn_timer = spawn_delay;
}

// -- MANAGE THE QUEUE POSITIONS --
for (var i = 0; i < array_length(queue); i++) {
    var customer = queue[i];
    
    // Position 0 is the register
    if (i == 0) {
        customer.target_instance = register_pos;
    }
    // Position 1 is the first queue spot
    else if (i == 1) {
        customer.target_instance = queue_pos_1;
    }
    // Position 2 is the second queue spot
    else if (i == 2) {
        customer.target_instance = queue_pos_2;
    }
}