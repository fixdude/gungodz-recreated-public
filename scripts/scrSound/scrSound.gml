function sound_play(snd)
{
	var emitter = MusCont.sfx_emitter;
	return audio_play_sound_on(emitter, snd, false, 10);
}

function sound_play_3d(snd, x, y, z)
{
	var emitter = MusCont.sfx_3d_emitter;
	audio_emitter_position(emitter, x, y, z);
	return audio_play_sound_on(emitter, snd, false, 10);
}

// I think I'd rather make it an argument in the original functions, but IDK
function sound_loop(snd)
{
	var s = sound_play(snd, true);
	audio_sound_loop(s, true);
	return s;
}

function sound_loop_3d(snd, x, y, z)
{
	var s = sound_play_3d(snd, x, y, z, true);
	audio_sound_loop(s, true);
	return s;
}

#macro sound_isplaying audio_is_playing
#macro sound_stop audio_stop_sound
#macro sound_stop_all audio_stop_all
#macro sound_volume audio_sound_gain

#macro scrMusic MusCont.play