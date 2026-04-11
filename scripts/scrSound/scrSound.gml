function sound_play(snd)
{
	return audio_play_sound(snd, 10, false);
}

function sound_loop(snd)
{
	return audio_play_sound(snd, 10, true);
}

#macro sound_isplaying audio_is_playing
#macro sound_stop audio_stop_sound
#macro sound_stop_all audio_stop_all
#macro sound_volume audio_sound_gain

#macro scrMusic MusCont.play