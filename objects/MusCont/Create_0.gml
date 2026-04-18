music_bus = audio_bus_create();
music_emitter = audio_emitter_create();
audio_emitter_bus(music_emitter, music_bus);

// To define what SFX means, since it may be subjective sometimes:
// Everything that's not music is SFX.
sfx_bus = audio_bus_create();
sfx_emitter = audio_emitter_create(); // Used by default
sfx_3d_emitter = audio_emitter_create();
audio_emitter_bus(sfx_emitter, sfx_bus);
audio_emitter_bus(sfx_3d_emitter, sfx_bus);

audio_emitter_falloff(sfx_3d_emitter, 300, 600, 1.2);

audio_emitter_gain(music_emitter, 0, 0);
audio_emitter_gain(sfx_emitter, 0, 0);
audio_emitter_gain(sfx_3d_emitter, 0, 0);

currentMusic = noone;
musicStream = noone;
musicHandle = noone;

play = function(mus)
{
	if !audio_exists(mus)
		return;
		
	if sound_isplaying(musicHandle)
		sound_stop(musicHandle);

	currentMusic = mus;
	musicHandle = audio_play_sound_on(music_emitter, mus, true, 100);
	//sound_volume(mus, 0.2);
}
