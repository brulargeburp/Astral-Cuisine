// Create Event of o_customer

// --- State Machine ---
state = "walking"; // Possible states: "walking", "ordering", "leaving"

// --- Movement ---
move_speed = 1.5;
target_instance = noone; // The queue manager will assign this

// --- Order ---
order = noone; // This will hold the recipe struct they want

// --- Appearance ---
// Randomly choose one of the base customer sprites
var skin = choose(1, 2, 3);
var facing = choose("B", "F", "S"); // For now, we'll just use one direction
sprite_index = asset_get_index("s_customer_" + facing + "_" + string(skin));
image_speed = 0.2; // A slow walking animation