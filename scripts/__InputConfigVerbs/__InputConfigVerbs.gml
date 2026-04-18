function __InputConfigVerbs()
{
	enum INPUT_VERB
	{
		UP,
		DOWN,
		LEFT,
		RIGHT,
		
		LOOK_UP,
		LOOK_DOWN,
		LOOK_LEFT,
		LOOK_RIGHT,
		
		SHOOT,
		MENU_ACCEPT,
		MELEE,
		NEXT_WEAPON,
		PAUSE,
		
		MAP, // Added by this version
	}
	
	enum INPUT_CLUSTER
	{
		NAVIGATION,
		LOOKING
	}
	
	// Movement
	InputDefineVerb(INPUT_VERB.UP, "up",
	"W", [-gp_axislv, gp_padu]);
	InputDefineVerb(INPUT_VERB.DOWN, "down",
	"S", [gp_axislv, gp_padd]);
	InputDefineVerb(INPUT_VERB.LEFT, "left",
	"A", [-gp_axislh, gp_padl]);
	InputDefineVerb(INPUT_VERB.RIGHT, "right",
	"D", [gp_axislh, gp_padr]);
	
	InputDefineVerb(INPUT_VERB.LOOK_UP, "look up",
	vk_up, -gp_axisrv);
	InputDefineVerb(INPUT_VERB.LOOK_DOWN, "look down",
	vk_down, gp_axisrv);
	InputDefineVerb(INPUT_VERB.LOOK_LEFT, "look left",
	vk_left, [-gp_axisrh, gp_shoulderlb]);
	InputDefineVerb(INPUT_VERB.LOOK_RIGHT, "look right",
	vk_right, [gp_axisrh, gp_shoulderrb]);
	
	// Actions
	
	var faceA = !INPUT_ON_SWITCH  ? gp_face1 : gp_face2,
		  faceB = !INPUT_ON_SWITCH  ? gp_face2 : gp_face1;
		
	InputDefineVerb(INPUT_VERB.PAUSE, "pause", [vk_backspace, vk_escape], gp_start);
	InputDefineVerb(INPUT_VERB.MENU_ACCEPT, "menu accept", vk_space, faceA);
	InputDefineVerb(INPUT_VERB.SHOOT, "shoot", [vk_lcontrol], [gp_face3, faceB, gp_shoulderr]);
	InputDefineVerb(INPUT_VERB.NEXT_WEAPON, "next weapon", vk_lcontrol, [gp_face3, faceB]);
	InputDefineVerb(INPUT_VERB.MELEE, "melee", vk_shift, [gp_face4, gp_shoulderl]);
	
	InputDefineVerb(INPUT_VERB.MAP, "map", vk_tab, INPUT_ON_PS5 ? gp_touchpadbutton : gp_select);
	
	
	InputDefineCluster(INPUT_CLUSTER.NAVIGATION, INPUT_VERB.UP, INPUT_VERB.RIGHT, INPUT_VERB.DOWN, INPUT_VERB.LEFT);
	InputDefineCluster(INPUT_CLUSTER.LOOKING, INPUT_VERB.LOOK_UP, INPUT_VERB.LOOK_RIGHT, INPUT_VERB.LOOK_DOWN, INPUT_VERB.LOOK_LEFT);
}
