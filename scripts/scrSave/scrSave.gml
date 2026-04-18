// Unlikely i'll be changing the save format, but if I am then I would regret not adding this
#macro SAVEDATA_VERSION 0

function scrSave()
{
	FORCEINLINE;
	var buff = buffer_create(1024, buffer_fast, 1), typ = buffer_u8;
	buffer_seek(buff, buffer_seek_start, 0);
	
	buffer_write(buff, typ, SAVEDATA_VERSION);
	
	// Simple things, max: 255
	// If they can go past that, most values will be shown as 'A LOT' (if shown)
	
	// 0, 1, 2, 4, 8, 16, 32, 64, 128, 256
	with UberCont
	{
		var dix = 1, diy = 1;
		repeat NUM_WORLDS
		{
			var s = 0x0000, u = unlok[dix];
			repeat NUM_LEVELS
			{
				buffer_write(buff, typ, plays[dix, diy]);
				buffer_write(buff, typ, beats[dix, diy]); // Counted, but never shown
				buffer_write(buff, typ, kills[dix, diy]);
				buffer_write(buff, typ, items[dix, diy]);
				buffer_write(buff, typ, times[dix, diy]); // ???
				buffer_write(buff, typ, stars[dix, diy]);
				
				// unlok
				if u[dix]
					s |= dix + 1;
				
				dix++;
			}
				
			buffer_write(buff, typ, s);
		
			dix = 1;
			diy++;
		}
	}
	
	// BASE ACHIEVEMENTS
	with ACHIEVEMENT
	{
		buffer_write(buff, typ, A1[ACH.UNLOCKED]);
		buffer_write(buff, typ, A2[ACH.UNLOCKED]);
		buffer_write(buff, typ, A3[ACH.UNLOCKED]);
		buffer_write(buff, typ, A4[ACH.UNLOCKED]);
		buffer_write(buff, typ, A5[ACH.UNLOCKED]);
		buffer_write(buff, typ, A6[ACH.UNLOCKED]);
		buffer_write(buff, typ, A7[ACH.UNLOCKED]);
		buffer_write(buff, typ, A8[ACH.UNLOCKED]);
	}
	
	buffer_save(buff, "gg1.bin");
	buffer_delete(buff);
	
	// Less simple things, max: 2,147,483,648
	var buff = buffer_create(1024, buffer_grow, 1), typ = buffer_u32;
	buffer_seek(buff, buffer_seek_start, 0);
	
	with UberCont
	{
		// These are never shown anywhere (or have a reason to be), so I'm not saving them
		/*
		buffer_write(buff, typ, tim); // Total amount of frames elapsed
		buffer_write(buff, typ, totalkills);
		*/
	
		var dix = 1, diy = 1;
		repeat NUM_WORLDS
		{
			repeat NUM_LEVELS
			{
				buffer_write(buff, typ, times[dix, diy]);
				dix++;
			}
		
			dix = 1;
			diy++;
		}
	}
	
	buffer_save(buff, "gg2.bin");
	buffer_delete(buff);
	
	switch_save_data_commit();
}

function scrLoad()
{
	FORCEINLINE;
	var buff = buffer_load("gg1.bin"), typ = buffer_u8;
	if !buffer_exists(buff)
		return;
	
	buffer_seek(buff, buffer_seek_start, 0);
	var savedata_version = buffer_read(buff, typ);
	
	with UberCont
	{
		UberCont.tim = buffer_read(buff, typ);
		UberCont.totalkills = buffer_read(buff, typ);
		dix = 1;
		diy = 1;
	
		var dix = 1, diy = 1;
		repeat NUM_WORLDS
		{
			var u = unlok[dix], s = buffer_read(buff, typ);
			repeat NUM_LEVELS
			{
				UberCont.plays[dix, diy] = buffer_read(buff, typ);
				UberCont.beats[dix, diy] = buffer_read(buff, typ);
				UberCont.kills[dix, diy] = buffer_read(buff, typ);
				UberCont.items[dix, diy] = buffer_read(buff, typ);
				UberCont.stars[dix, diy] = buffer_read(buff, typ);
				
				// unlok
				var b = dix;
				if b == 3
					b = 4;
					
				if s | b
					u[dix] = true;

				dix++;
			}
			
			// Sorry for the ridiculous over-engineering for something so microscopic. I can't help it
			var s = 0x0000, u = unlok[dix];
			for (var i = 0; i < NUM_LEVELS; i++)
			{
				if u[i]
					s |= i + 1;
			}
		
			dix = 1;
			diy++;
		}
	}
	
	buffer_delete(buff);
	
	var buff = buffer_load("gg2.bin"), typ = buffer_u32;
	if !buffer_exists(buff)
		return; // That's weird, but carry on
		
	with UberCont
	{
		repeat NUM_WORLDS
		{
			repeat NUM_LEVELS
			{
				UberCont.times[dix, diy] = buffer_read(buff, typ);
				dix++;
			}
		
			dix = 1;
			diy++;
		}
	}
}