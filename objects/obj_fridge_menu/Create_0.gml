// Create Event for obj_fridge_menu
show_debug_message("TEST 4 PASSED: obj_fridge_menu has been successfully created!");
// An array holding the names of ALL items we can get
menu_options = [
    "Bread",
    "Tomato",
    "Cheese",
    "Milk",
    "Tea Leaves",
    "Sugar",
    "Water"
];

// The visual properties of the menu
menu_width = 250;
menu_height = 450; // Increased height to fit the new items
// Center the menu on the screen
menu_x = (display_get_gui_width() / 2) - (menu_width / 2);
menu_y = (display_get_gui_height() / 2) - (menu_height / 2);