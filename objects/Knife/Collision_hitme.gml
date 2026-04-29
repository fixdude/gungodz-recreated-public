var dmg = (10 + (BackCont.evil * 100));
if other.object_index == God
	dmg += 200;
	
if scrDamageEnemy(other, dmg, 3 * (BackCont.gold + 1), true, 6 + random(2))
	instance_destroy();
