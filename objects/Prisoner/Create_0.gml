event_inherited();
my_health = 8;
kick = 1;
spridle = sprPrisoner;
sprwalk = sprPrisonerWalk;
sprdead = sprPrisonerDie;
sprfire = sprPrisonerFire;
sprhurt = sprPrisonerHurt;
my_dsound = choose(sndPrisonerDie1, sndPrisonerDie2, sndPrisonerDie3);
my_asound = choose(sndPrisonerSee1, sndPrisonerSee2, sndPrisonerSee3);
alarm[2] = 1 + random(90);
awaremax = 40 + random(10);

active = true;
walk = infinity;
angry = false;
target = Player;