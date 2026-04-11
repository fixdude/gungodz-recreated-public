bus = audio_bus_create();
emitter = audio_emitter_create();
audio_emitter_bus(emitter, bus);

ef_lpf = audio_effect_create(AudioEffectType.Reverb1, { size: 0.6, mix: 0.5 });

bus.effects[0] = ef_lpf;

currentMusic = noone;
musicStream = noone;
musicHandle = noone;

play = function(mus)
{
	sound_stop_all();

	audio_play_sound_on(emitter, mus, true, 100);
	//sound_volume(mus, 0.2);
}