// Step Event for obj_stove_menu

// Make the error message fade away
if (error_timer > 0) {
    error_timer--;
}

// --- 1. CHECK IF WE CAN COOK THE SELECTED RECIPE ---
var selected_recipe = global.recipes[selected_recipe_index];
var ingredient_names = variable_struct_get_names(selected_recipe.ingredients);
can_cook = true; // Assume we can cook, prove otherwise

for (var i = 0; i < array_length(ingredient_names); i++) {
    var ingredient = ingredient_names[i];
    var amount_needed = selected_recipe.ingredients[$ ingredient];
    var amount_owned = script_execute(array_count_occurrences, o_player.inventory, ingredient);
    
    if (amount_owned < amount_needed) {
        can_cook = false; // Found an ingredient we don't have enough of
        break; // Stop checking
    }
}

// --- 2. HANDLE MOUSE/TOUCH CLICKS ---
if (mouse_check_button_pressed(mb_left)) {
    var touch_x = device_mouse_x_to_gui(0);
    var touch_y = device_mouse_y_to_gui(0);

    // Check clicks on recipe list
    for (var i = 0; i < array_length(global.recipes); i++) {
        if (point_in_rectangle(touch_x, touch_y, 50, 100 + (i * 50), 250, 140 + (i * 50))) {
            selected_recipe_index = i;
            return;
        }
    }

    // Check click on COOK button
    if (point_in_rectangle(touch_x, touch_y, 300, 350, 500, 400)) {
    if (can_cook) {
        // SUCCESS!
        
        // 1. Add points
        global.points += selected_recipe.points;
        
        // --- THIS IS THE NEW LINE ---
        // 2. Add the finished dish to the player's inventory
        array_push(o_player.inventory, selected_recipe.name);
        show_debug_message("CRAFTED: Added " + selected_recipe.name + " to inventory.");
        
        // 3. Remove ingredients
        for (var i = 0; i < array_length(ingredient_names); i++) {
            var ingredient = ingredient_names[i];
            var amount_to_remove = selected_recipe.ingredients[$ ingredient];
            for (var j = 0; j < amount_to_remove; j++) {
                script_execute(array_remove_value, o_player.inventory, ingredient);
            }
        }
        // 4. Close the menu
        instance_destroy(); 
    }  else {
            // FAILURE!
            error_message = "Not enough ingredients!";
            error_timer = 120; // Show message for 2 seconds (at 60fps)
        }
    }

    // Check click on CLOSE button
    if (point_in_rectangle(touch_x, touch_y, 550, 50, 600, 100)) {
        instance_destroy();
    }
}