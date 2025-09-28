// Script: array_remove_value (Legacy Format)

// argument0 is the first input (the array)
// argument1 is the second input (the value to remove)
var array = argument0;
var value = argument1;

var len = array_length(array);
for (var i = 0; i < len; i++) {
    if (array[i] == value) {
        array_delete(array, i, 1);
        return true; // Found and removed
    }
}
return false; // Not found