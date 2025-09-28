// Script: init_game_data
// This script will run ONCE at the start of the game to set up all our data.

function init_game_data() {

    // --- 1. THE MASTER ITEM SPRITE DATABASE ---
    // This connects ALL item names (raw and cooked) to their sprites.
    global.item_sprites = {
        // Raw Ingredients
        "Bread": s_bread,
        "Tomato": s_tomato,
        "Cheese": s_cheese,
        "Milk": s_milk,
        "Tea Leaves": s_tealeaves,
        "Sugar": s_sugar,
        "Water": s_water,
        
        // Cooked Dishes
        "Double Dish Pizza": s_pizza,
        "Gelato": s_gelato,
        "Milk Tea": s_milktea,
        "Soda": s_soda
    };

    // --- 2. THE RECIPE DATABASE ---
    // This is a list of all our recipes. Each recipe is a "struct".
    global.recipes = [
        // Recipe for Double Dish Pizza
        {
            name: "Double Dish Pizza",
            sprite: s_pizza, // The sprite of the finished dish
            points: 100,
            ingredients: { "Bread": 2, "Tomato": 1, "Cheese": 1 }
        },
        // Recipe for Gelato
        {
            name: "Gelato",
            sprite: s_gelato,
            points: 75,
            ingredients: { "Milk": 1, "Sugar": 1 }
        },
        // Recipe for Milk Tea
        {
            name: "Milk Tea",
            sprite: s_milktea,
            points: 60,
            ingredients: { "Milk": 1, "Tea Leaves": 1 }
        },
        // Recipe for Soda
        {
            name: "Soda",
            sprite: s_soda,
            points: 25,
            ingredients: { "Water": 1, "Sugar": 1 }
        }
    ];

    show_debug_message("GAME DATA INITIALIZED: Master sprite list and recipes are ready.");
}