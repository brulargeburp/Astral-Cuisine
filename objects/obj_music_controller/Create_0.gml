// In Create Event of obj_music_controller

// --- Bug Prevention: Self-Destruct if a duplicate exists ---
// This stops you from getting multiple music tracks playing over each other
// if you ever return to the first room.
if (instance_number(object_index) > 1) {
    instance_destroy();
    exit; // Stop running the rest of this event
}


// --- Play the Background Music ---
// This function plays a sound and can loop it.

// audio_play_sound(sound_asset, priority, should_loop);
audio_play_sound(snd_music1, 10, true);