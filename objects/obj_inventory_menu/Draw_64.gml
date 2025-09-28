// In Draw GUI Event of obj_inventory_menu (CORRECTED)

// Draw background and title
draw_set_color(c_black);
draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(menu_x + menu_width / 2, menu_y + 10, "Inventory");

// --- Draw Items in a Grid ---
draw_set_halign(fa_left);
var columns = 2; // How many items per row
var padding = 20;
var item_box_size = 48;

for (var i = 0; i < array_length(display_items); i++) {
    var item_name = display_items[i];
    var item_count = item_counts[$ item_name];
    
    // This is the line we are fixing
    var item_sprite = global.item_sprites[$ item_name];

    // Calculate grid position
    var col = i % columns;
    var row = i div columns;
    
    var draw_x = menu_x + padding + (col * (menu_width / columns));
    var draw_y = menu_y + 50 + (row * item_box_size);
    
    // Draw the sprite and the count
    draw_sprite(item_sprite, 0, draw_x, draw_y);
    draw_text(draw_x + 30, draw_y, "x" + string(item_count));
}

// --- Draw Close Button ---
var close_button_y = menu_y + menu_height - 50;
draw_set_color(c_dkgray);
draw_rectangle(menu_x + 10, close_button_y, menu_x + menu_width - 10, close_button_y + 40, false);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(menu_x + menu_width / 2, close_button_y + 10, "Close");