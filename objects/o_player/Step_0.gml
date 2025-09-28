// In o_player's Step Event (REPLACE your interaction code with this)

if (global.v_action1_pressed) {
    
    var interactive_object = noone; // Start with no object found

    // Define the player's collision box dimensions for easier checking
    var bbox_half_w = (bbox_right - bbox_left) / 2;
    var bbox_half_h = (bbox_bottom - bbox_top) / 2;
    var check_dist = 4; // How many pixels away to check for an object

    // Check a small rectangular "feeler" area in all 4 directions
    var check_right = collision_rectangle(x + bbox_half_w, y - bbox_half_h, x + bbox_half_w + check_dist, y + bbox_half_h, p_solid, false, true);
    var check_left = collision_rectangle(x - bbox_half_w - check_dist, y - bbox_half_h, x - bbox_half_w, y + bbox_half_h, p_solid, false, true);
    var check_down = collision_rectangle(x - bbox_half_w, y + bbox_half_h, x + bbox_half_w, y + bbox_half_h + check_dist, p_solid, false, true);
    var check_up = collision_rectangle(x - bbox_half_w, y - bbox_half_h - check_dist, x + bbox_half_w, y - bbox_half_h, p_solid, false, true);

    // This structure correctly finds the FIRST valid object ID and stores it
    if (check_right != noone) {
        interactive_object = check_right;
    } else if (check_left != noone) {
        interactive_object = check_left;
    } else if (check_down != noone) {
        interactive_object = check_down;
    } else if (check_up != noone) {
        interactive_object = check_up;
    }

    // Now, if we truly found a valid object, proceed.
	if (interactive_object != noone) {
    
    // --- BRANCH 1: REFRIGERATOR ---
    if (interactive_object.object_index == o_refrigerator) {
        if (!global.menu_open) {
            instance_create_layer(0, 0, "Compatibility_Instances_Depth_0", obj_fridge_menu);
            global.menu_open = true;
        }
    }
    
    // --- BRANCH 2: STOVE ---
    else if (interactive_object.object_index == o_stove) {
        if (!global.menu_open) {
            instance_create_layer(0, 0, "Compatibility_Instances_Depth_0", obj_stove_menu);
            global.menu_open = true;
        }
    }
    
    // --- BRANCH 3: CASH REGISTER (Your New System!) ---
    else if (interactive_object.object_index == o_register) {
        
		show_debug_message("DEBUG: Player is interacting with the register.");
		
        // First, check if there is anyone in the queue
        if (array_length(o_queue_manager.queue) > 0) {
            
            // Get the customer at the front of the line (position 0)
            var customer = o_queue_manager.queue[0];
            
            // Check if that customer is actually ordering
            if (customer.state == "ordering") {
                
                var required_item = customer.order.name;
                
                // Check inventory AND remove the item if we have it
                if (script_execute(array_remove_value, inventory, required_item)) {
                    
                    // SUCCESS!
                    show_debug_message("Served " + required_item + " to customer!");
                    global.points += customer.order.points;
                    
                    // Tell the customer to leave
                    customer.state = "leaving";
                    
                } else {
                    // FAILURE!
                    show_debug_message("WARNING: Don't have a " + required_item + " to give!");
                    // You could create a temporary warning message object here
                }
            }
        }
    }
}
}

// --- 3. Gather Inputs for Movement ---
// This code will NOT run if a menu is open because of the 'exit' command above.

var kUp, kDown, kLeft, kRight, kSelect, kBack;

// Mobile controls will override keyboard if active
kUp    = global.v_up    || keyboard_check(vk_up);
kDown  = global.v_down  || keyboard_check(vk_down);
kLeft  = global.v_left  || keyboard_check(vk_left);
kRight = global.v_right || keyboard_check(vk_right);

// Note: We use global.v_action1_pressed for menus, but your template
// might use kSelect for other things, so we leave it.
kSelect = global.v_action1_pressed || keyboard_check_pressed(ord("X"));
kBack   = keyboard_check_pressed(ord("Z"));


// --- 4. Handle Movement & State ---

// Left
if(kLeft && !kRight)
{
    facing = -1;
    state = RUN;
    if (vx > 0) {
        vx = approach(vx,0,fric);
    }
    vx = approach(vx,-vxMax,accel);
    if(!kUp && !kDown) {
        if (vy != 0) {
            vy = approach(vy,0,fric);
        }
    }
    dir = 2;
}

// Right
else if(kRight && !kLeft)
{
    facing = 1;
    state = RUN;
    if (vx < 0) {
        vx = approach(vx,0,fric);
    }
    vx = approach(vx,vxMax,accel);
    if(!kUp && !kDown) {
        if (vy != 0) {
            vy = approach(vy,0,fric);
        }
    }
    dir = 2;
}

// Up
if(kUp && !kDown)
{
    state = RUN;
    if (vy > 0) {
        vy = approach(vy,0,fric);
    }
    vy = approach(vy,-vyMax,accel);
    
    if(!kLeft && !kRight) {
        if (vx != 0) {
            vx = approach(vx,0,fric);
        }
    }
    if((vy*vx) == 0) {
        dir = 1;
    } else {
        dir = 2;
    }
}

// Down
else if(kDown && !kUp)
{
    state = RUN;
    if (vy < 0) {
        vy = approach(vy,0,fric);
    }
    vy = approach(vy,vyMax,accel);
    
    if(!kLeft && !kRight) {
        if (vx != 0) {
            vx = approach(vx,0,fric);
        }
    }
    if((vy*vx) == 0) {
        dir = 0;
    } else {
        dir = 2;
    }
}

// Friction (No input)
if(!kLeft && !kRight && !kUp && !kDown)
{
    state = IDLE;
    vx = approach(vx,0,fric);
    vy = approach(vy,0,fric);
}


// --- 5. Handle Animations ---

// Squash and Stretch
xscale = approach(xscale, 1, .05);
yscale = approach(yscale, 1, .05);

// While character runs
if(state == RUN) {
    if(animation_hit_frame(0) || animation_hit_frame(2)) {
        yscale = 0.80;
        xscale = 1.20;
    }
    if(p_chance(.1)) {
        var _vx = vx;
        var mydepth = depth;
        with(instance_create_layer(x,y+7,"Compatibility_Instances_Depth_0",o_dust)){ // Added layer name
            depth = mydepth;
            vx = _vx*0.25;
            vy = random_range(-0.75,0.25);
        }
    }   
}

