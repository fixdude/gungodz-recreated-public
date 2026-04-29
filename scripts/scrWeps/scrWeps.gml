function Weapon(spr, auto, reload = 6, press = noone, hold = noone, release = noone, cost = 1, goldshake = 3) constructor
{
	sprite_index = spr;
	image_speed = 0.1;
	self.auto = auto;
	self.reload = reload;
	self.cost = cost;
	self.press = press;
	self.hold = hold;
	self.released = release;
	self.goldshake = goldshake;
}

#macro wepDefaults global.__wepDefaults
wepDefaults = {
	Pistol: new Weapon(sprPistol, false, 30, function(player, gold)
	{
		with (player)
		{
			gunanim = 3;
			sound_play(sndPistol);
			
			with instance_create(x, y, Bullet)
			{
				direction = other.angle;
				zspeed = 0;
				scrBulletMove();
			}
		}
			
		scrFogFlash(2);
	}),
	Shotgun: new Weapon(sprShotgun, false, 30, function(player, gold)
	{
		scrShake(2);
			
		with (player)
		{
			gunanim = 5;
			sound_play(sndShotgun);
			
			repeat (8)
			{
				with instance_create(x, y, Bullet)
				{
					direction = (other.angle + random(14)) - 7;
					zspeed = random(6) - 3;
					scrBulletMove();
				}
			}
		}
			
		scrFogFlash(2);
		return true;
	}),
	Minigun: new Weapon(sprMinigun, false, 5, function()
	{
		sound_stop(sndMinigunEnd);
		sound_play(sndMinigunStart);
	}, function(player, gold)
	{
		scrShake(1);
		
		with (player)
		{
			if gunanim < 1
				gunanim = 4;
			
			sound_play(sndMinigun);
			with instance_create(x, y, Bullet)
			{
				direction = (other.angle + random(3)) - 1.5;
				zspeed = random(3) - 1.5;
				scrBulletMove();
			}
		}
			
		scrFogFlash();
		return true;
	}, function()
	{
		sound_stop(sndMinigun);
		sound_play(sndMinigunEnd);
	}, 1),
	Bazooka: new Weapon(sprBazooka, false, 50, noone, function(player, gold)
	{
		scrShake(1);
			
		with (player)
		{
			gunanim = 5;
			sound_play(sndBazooka);
			
			with instance_create(x + lengthdir_x(10, angle), y + lengthdir_y(10, angle), Rocket)
			{
				direction = other.angle;
				image_angle = direction;
				zspeed = 0;
				speed = 2;
			}
		}
			
		scrFogFlash();
		return true;
	}),
	Knife: new Weapon(sprKnifeWeapon, false, 0, function(player, gold)
	{
		with (player)
		{
			gunanim = 4;
			with instance_create(x, y, Knife)
				image_angle = other.angle;
		}
		return true;
	}, noone, noone, 0, 0)
};

function scrFogFlash(time = 2)
{
	with (Player)
	{
		fog = false;
		alarm[1] = time fmt;
	}
}

function scrWeps()
{
	weapons = [undefined];
	
	weapons[Weapons.Pistol] = wepDefaults.Pistol;
	weapons[Weapons.Shotgun] = wepDefaults.Shotgun;
	weapons[Weapons.Minigun] = wepDefaults.Minigun;
	weapons[Weapons.Bazooka] = wepDefaults.Bazooka;
	weapons[Weapons.Knife] = wepDefaults.Knife;
	ammo = UberCont.p_ammo;
	ammo[Weapons.Knife] = 1;
}