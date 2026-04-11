if room == romIntro || room == menLevelSelect || room == romCredits
	play(sndINTRO);
else
	play(asset_get_index($"sndLEVEL{UberCont.wld}"));