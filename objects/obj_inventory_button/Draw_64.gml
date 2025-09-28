// In Draw GUI Event of obj_inventory_button (FINAL VERSION)

// --- 1. Calculate the correct position every single frame ---
var gui_w = display_get_gui_width();
var padding = 10;

// --- 2. Update this object's ACTUAL x and y coordinates ---
// This is the key to the entire fix.
x = gui_w - sprite_width - padding;
y = padding;

// --- 3. Use the simple, foolproof function to draw the sprite ---
// It will now draw at the correct, newly updated x and y.
draw_self();