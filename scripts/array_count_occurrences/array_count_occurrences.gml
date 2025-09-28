// Script: array_count_occurrences (Legacy Format)

// argument0 is the first input (the array)
// argument1 is the second input (the value to count)
var array = argument0;
var value = argument1;

var count = 0;
var len = array_length(array);
for (var i = 0; i < len; i++) {
    if (array[i] == value) {
        count++;
    }
}
return count;