// Draw GUI Event for obj_stove_menu

// Draw background
draw_set_color(c_black);
draw_rectangle(40, 40, 610, 420, false);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(325, 50, "Cooking Stove");

// --- LEFT SIDE: RECIPE LIST ---
draw_set_halign(fa_left);
for (var i = 0; i < array_length(global.recipes); i++) {
    var recipe = global.recipes[i];
    var box_y = 100 + (i * 50);
    // Highlight the selected recipe
    if (i == selected_recipe_index) {
        draw_set_color(c_yellow);
        draw_rectangle(50, box_y, 250, box_y + 40, true);
    }
    draw_set_color(c_white);
    draw_sprite(recipe.sprite, 0, 70, box_y + 20);
    draw_text(100, box_y + 10, recipe.name);
}

// --- RIGHT SIDE: DETAILS PANEL ---
var recipe = global.recipes[selected_recipe_index];
draw_text(300, 100, "Requires:");
var ingredient_names = variable_struct_get_names(recipe.ingredients);
for (var i = 0; i < array_length(ingredient_names); i++) {
    var ingredient = ingredient_names[i];
    var amount_needed = recipe.ingredients[$ ingredient];
	var ingredient_sprite = global.item_sprites[$ ingredient];
    var text = ingredient + " x" + string(amount_needed);
    
    draw_sprite(ingredient_sprite, 0, 320, 140 + (i * 40));
    draw_text(350, 130 + (i * 40), text);
}

// --- COOK BUTTON ---
if (!can_cook) { draw_set_alpha(0.5); } // Grey out if we can't cook
draw_set_color(c_dkgray);
draw_rectangle(300, 350, 500, 400, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(400, 365, "Cook");
draw_set_halign(fa_left);
draw_set_alpha(1); // Reset alpha

// --- CLOSE BUTTON ---
draw_text(560, 60, "X");

// --- ERROR MESSAGE ---
if (error_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_color(c_red);
    draw_text(325, 20, error_message);
}