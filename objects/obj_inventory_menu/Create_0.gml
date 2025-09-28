// In Create Event of obj_inventory_menu
show_debug_message("--- TEST 2 PASSED: Inventory Menu Instance Created! ---");
// --- Process the Inventory ---
// This is the clever part. We convert ["Bread", "Bread", "Tomato"]
// into a struct like { "Bread": 2, "Tomato": 1 }
item_counts = {}; // An empty struct to hold our counts

for (var i = 0; i < array_length(o_player.inventory); i++) {
    var item_name = o_player.inventory[i];
    
    // If we've already seen this item, increment its count
    if (variable_struct_exists(item_counts, item_name)) {
        item_counts[$ item_name]++;
    }
    // Otherwise, this is the first time we've seen it
    else {
        item_counts[$ item_name] = 1;
    }
}

// Get a list of the unique item names we have
display_items = variable_struct_get_names(item_counts);

// --- Menu Visuals ---
menu_width = 300;
menu_height = 400;
menu_x = (display_get_gui_width() / 2) - (menu_width / 2);
menu_y = (display_get_gui_height() / 2) - (menu_height / 2);