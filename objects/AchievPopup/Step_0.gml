var v = 0.08 fmt;

if spd != 0
{
	if leaving == true
		extend_x = lerp(extend_x, 0, v);
		
	x += spd;
	if x >= 0
	{
		leaving = true;
		x = 0;
		spd = 0;
		alarm[0] = 120 fmt;
	}
}
else if leaving == true
	extend_x = lerp(extend_x, len + 16, v);