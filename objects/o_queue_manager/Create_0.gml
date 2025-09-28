// Create Event of o_queue_manager

// Prevent duplicates if we return to this room
if (instance_number(object_index) > 1) {
    instance_destroy();
    exit;
}

// This array holds the unique ID of each customer in the queue
queue = [];
max_queue_size = 3;

// A timer to spawn customers periodically
spawn_timer = 1; // Spawn the first one almost instantly
spawn_delay = 300; // Spawn a new customer every 5 seconds (60fps * 5)