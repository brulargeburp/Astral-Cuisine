// In Draw GUI Event of obj_fridge_menu (CORRECTED AND UPGRADED)

// Draw the menu background
draw_set_color(c_black);
draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);

// Draw the title
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(menu_x + menu_width / 2, menu_y + 10, "Refrigerator");

// --- Draw the Ingredient Buttons with Sprites ---
draw_set_halign(fa_left);
for (var i = 0; i < array_length(menu_options); i++) {
    var ingredient_name = menu_options[i];
    var button_y = menu_y + 40 + (i * 50);
    
    // --- CORRECTED BUTTON DRAWING ---
    // First, draw the solid dark grey background for the button
    draw_set_color(c_dkgray);
    draw_rectangle(menu_x + 10, button_y, menu_x + menu_width - 10, button_y + 40, false);
    
    // Then, draw the white outline over it
    draw_set_color(c_white);
    draw_rectangle(menu_x + 10, button_y, menu_x + menu_width - 10, button_y + 40, true);
    
    
    // --- CORRECTED ALIGNMENT ---
    // Look up the ingredient's sprite in our global database
    var ingredient_sprite = global.item_sprites[$ ingredient_name];
    
    // Draw the sprite and the text with much closer spacing
    draw_set_color(c_white);
    draw_sprite(ingredient_sprite, 0, menu_x + 35, button_y + 20); // Sprite position is good
    draw_text(menu_x + 60, button_y + 10, ingredient_name);     // Moved text from 75 to 60
}

// --- Draw the Close Button ---
var close_button_y = menu_y + menu_height - 60;
draw_set_color(c_dkgray);
draw_rectangle(menu_x + 10, close_button_y, menu_x + menu_width - 10, close_button_y + 40, false);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(menu_x + menu_width / 2, close_button_y + 10, "Close");