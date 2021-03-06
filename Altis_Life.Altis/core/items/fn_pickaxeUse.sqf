/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	Mod: blaster
	
	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_item","_diff","_itemName","_rng","_rng2"];
_mine = "";

switch (true) do {
	case (player distance (getMarkerPos "me_1") < 40): {_mine = ["dirt",10,"rock",14,"copperore",65,"garnet",5,"quartz",5,"dino",1];};
	case (player distance (getMarkerPos "me_2") < 40): {_mine = ["dirt",5,"salt",85];};
	case (player distance (getMarkerPos "me_3") < 40): {_mine = ["dirt",5,"salt",10];};
	case (player distance (getMarkerPos "me_4") < 40): {_mine = ["dirt",20,"rock",80];};
	case (player distance (getMarkerPos "me_5") < 40): {_mine = ["dirt",10,"rock",20,"sulfur",10,"zincu",30,"leadu",30];};
	case (player distance (getMarkerPos "me_6") < 40): {_mine = ["dirt",10,"rock",25,"copperore",49,"goldnugget",1];};
	case (player distance (getMarkerPos "me_7") < 40): {_mine = ["dirt",10,"rock",20,"tinu",50,"titu",10];};
	case (player distance (getMarkerPos "me_8") < 40): {_mine = ["dirt",5,"rock",5,"coalu",15,"sulfur",75];};
	
	case (player distance (getMarkerPos "mm_1") < 40): {_mine = ["dirt",15,"rock",20,"ruby",1,"emerald",1,"sapphire",1,"topaz",1,"garnet",1];};
	case (player distance (getMarkerPos "mm_2") < 40): {_mine = ["dirt",5,"rock",5,"ironore",85,"garnet",5];};
	case (player distance (getMarkerPos "mm_3") < 40): {_mine = ["dirt",30,"rock",10,"zincu",10,"leadu",10,"mercuryu",40];};
	case (player distance (getMarkerPos "mm_4") < 40): {_mine = ["dirt",20,"rock",20,"zincu",30,"leadu",30];};
	case (player distance (getMarkerPos "mm_5") < 40): {_mine = ["dirt",15,"rock",15,"tinu",65,"diamond",1,"ruby",1,"emerald",1,"sapphire",1,"dino",1];};
	case (player distance (getMarkerPos "mm_6") < 40): {_mine = ["dirt",20,"rock",30,"titu",40,"ruby",5,"emerald",5];};
	case (player distance (getMarkerPos "mm_7") < 40): {_mine = ["dirt",10,"rock",60,"sand",20,"dino",10];};
	case (player distance (getMarkerPos "mm_8") < 40): {_mine = ["dirt",15,"rock",15,"ironore",30,"zincu",5,"leadu",5,"mercuryu",30];};
	case (player distance (getMarkerPos "mm_9") < 40): {_mine = ["dirt",10,"rock",30,"copperore",45,"ironore",10,"goldnugget",5];};
	case (player distance (getMarkerPos "mm_10") < 40): {_mine = ["dirt",10,"rock",20,"copperore",60];};
	
	case (player distance (getMarkerPos "mh_1") < 40): {_mine = ["dirt",5,"rock",5,"tinu",15,"titu",60,"iridiumu",5,"ruby",1,"emerald",1,"sapphire",1,"topaz",1,"garnet",1];};
	case (player distance (getMarkerPos "mh_2") < 40): {_mine = ["dirt",5,"rock",50,"diamond",35,"ruby",2,"emerald",2,"sapphire",2,"topaz",2,"garnet",2];};
	case (player distance (getMarkerPos "mh_3") < 40): {_mine = ["dirt",10,"rock",10,"platinumore",70];};
	case (player distance (getMarkerPos "mh_4") < 40): {_mine = ["dirt",5,"rock",10,"zincu",60,"leadu",25];};
	case (player distance (getMarkerPos "mh_5") < 40): {_mine = ["dirt",5,"rock",10,"zincu",25,"leadu",60];};
	case (player distance (getMarkerPos "mh_6") < 40): {_mine = ["dirt",5,"rock",5,"coalu",80,"sulfur",10];};
	case (player distance (getMarkerPos "mh_7") < 40): {_mine = ["dirt",5,"rock",5,"diamond",5,"ruby",5,"emerald",5,"sapphire",5,"topaz",10,"garnet",20,"quartz",40];};
	case (player distance (getMarkerPos "mh_8") < 40): {_mine = ["dirt",5,"rock",5,"copperore",10,"tinu",3,"titu",3,"iridiumu",2];};
	case (player distance (getMarkerPos "mh_9") < 40): {_mine = ["dirt",5,"rock",10,"tinu",80,"topaz",5];};
	
	case (player distance (getMarkerPos "mvh_1") < 40): {_mine = ["dirt",30,"ironore",10,"goldnugget",55,"platinumore",5];};
	case (player distance (getMarkerPos "mvh_2") < 40): {_mine = ["dirt",20,"rock",50,"uraniumu",30];};
	case (player distance (getMarkerPos "mvh_3") < 40): {_mine = ["dirt",1,"rock",1,"copperore",6,"zincu",46,"leadu",46];};
	case (player distance (getMarkerPos "mvh_4") < 40): {_mine = ["dirt",1,"rock",4,"diamond",20,"ruby",20,"emerald",20,"sapphire",20,"topaz",5,"garnet",5,"quartz",5];};
	case (player distance (getMarkerPos "mvh_5") < 40): {_mine = ["dirt",50,"copperore",5,"ironore",5,"goldnugget",5,"platinumore",5,"iridiumu",5,"mercuryu",5];};
	
	case (player distance (getMarkerPos "muh_1") < 40): {_mine = ["dirt",10,"rock",20,"iridiumu",50];};
	default {_mine = ""};
};
//Mine check
if(_mine == "")) exitWith {hint localize "STR_ISTR_Pick_NotNear"};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

_rng = floor(random 101); //rng generator
_rng2 = (round(random 2)+1); //number to give favor 2

switch (count(_mine)) do {
	case 2: 
		{
		_item = [(_mine select 0),_rng2];
		};
	case 4: 
		{
		_x1 = (_mine select 1);
		_x2 = 100;
		switch (true) do 
			{
			case (0 <= _rng && _rng <= _x1): {_item = [(_mine select 0),_rng2];};
			case (_rng > _x1 && _rng <= _x2): {_item = [(_mine select 2),_rng2];};
			};
		};
	case 6: 
		{
		_x1 = (_mine select 1);
		_x2 = _x1 + (_mine select 3);
		_x3 = 100;
		switch (true) do 
			{
			case (0 <= _rng && _rng <= _x1): {_item = [(_mine select 0),_rng2];};
			case (_rng > _x1 && _rng <= _x2): {_item = [(_mine select 2),_rng2];};
			case (_rng > _x2 && _rng <= _x3): {_item = [(_mine select 4),_rng2];};
			};
		};
	case 8: 
		{
		_x1 = (_mine select 1);
		_x2 = _x1 + (_mine select 3);
		_x3 = _x2 + (_mine select 5);
		_x4 = 100;
		switch (true) do 
			{
			case (0 <= _rng && _rng <= _x1): {_item = [(_mine select 0),_rng2];};
			case (_rng > _x1 && _rng <= _x2): {_item = [(_mine select 2),_rng2];};
			case (_rng > _x2 && _rng <= _x3): {_item = [(_mine select 4),_rng2];};
			case (_rng > _x3 && _rng <= _x4): {_item = [(_mine select 6),_rng2];};
			};
		};
	case 10: 
		{
		_x1 = (_mine select 1);
		_x2 = _x1 + (_mine select 3);
		_x3 = _x2 + (_mine select 5);
		_x4 = _x3 + (_mine select 7);
		_x5 = 100;
		switch (true) do 
			{
			case (0 <= _rng && _rng <= _x1): {_item = [(_mine select 0),_rng2];};
			case (_rng > _x1 && _rng <= _x2): {_item = [(_mine select 2),_rng2];};
			case (_rng > _x2 && _rng <= _x3): {_item = [(_mine select 4),_rng2];};
			case (_rng > _x3 && _rng <= _x4): {_item = [(_mine select 6),_rng2];};
			case (_rng > _x4 && _rng <= _x5): {_item = [(_mine select 8),_rng2];};
			};
		};
	case 12: 
		{
		_x1 = (_mine select 1);
		_x2 = _x1 + (_mine select 3);
		_x3 = _x2 + (_mine select 5);
		_x4 = _x3 + (_mine select 7);
		_x5 = _x4 + (_mine select 9);
		_x6 = 100;
		switch (true) do 
			{
			case (0 >= _rng && _rng >= _x1): {_item = [(_mine select 0),_rng2];};
			case (_rng > _x1 && _rng <= _x2): {_item = [(_mine select 2),_rng2];};
			case (_rng > _x2 && _rng <= _x3): {_item = [(_mine select 4),_rng2];};
			case (_rng > _x3 && _rng <= _x4): {_item = [(_mine select 6),_rng2];};
			case (_rng > _x4 && _rng <= _x5): {_item = [(_mine select 8),_rng2];};
			case (_rng > _x5 && _rng <= _x6): {_item = [(_mine select 10),_rng2];};
			};
		};
	case 14: 
		{
		_x1 = (_mine select 1);
		_x2 = _x1 + (_mine select 3);
		_x3 = _x2 + (_mine select 5);
		_x4 = _x3 + (_mine select 7);
		_x5 = _x4 + (_mine select 9);
		_x6 = _x5 + (_mine select 11);
		_x7 = 100;
		switch (true) do 
			{
			case (0 >= _rng && _rng >= _x1): {_item = [(_mine select 0),_rng2];};
			case (_rng > _x1 && _rng <= _x2): {_item = [(_mine select 2),_rng2];};
			case (_rng > _x2 && _rng <= _x3): {_item = [(_mine select 4),_rng2];};
			case (_rng > _x3 && _rng <= _x4): {_item = [(_mine select 6),_rng2];};
			case (_rng > _x4 && _rng <= _x5): {_item = [(_mine select 8),_rng2];};
			case (_rng > _x5 && _rng <= _x6): {_item = [(_mine select 10),_rng2];};
			case (_rng > _x6 && _rng <= _x7): {_item = [(_mine select 12),_rng2];};
			};
		};
	case 16: 
		{
		_x1 = (_mine select 1);
		_x2 = _x1 + (_mine select 3);
		_x3 = _x2 + (_mine select 5);
		_x4 = _x3 + (_mine select 7);
		_x5 = _x4 + (_mine select 9);
		_x6 = _x5 + (_mine select 11);
		_x7 = _x6 + (_mine select 13);
		_x8 = 100;
		switch (true) do 
			{
			case (0 >= _rng && _rng >= _x1): {_item = [(_mine select 0),_rng2];};
			case (_rng > _x1 && _rng <= _x2): {_item = [(_mine select 2),_rng2];};
			case (_rng > _x2 && _rng <= _x3): {_item = [(_mine select 4),_rng2];};
			case (_rng > _x3 && _rng <= _x4): {_item = [(_mine select 6),_rng2];};
			case (_rng > _x4 && _rng <= _x5): {_item = [(_mine select 8),_rng2];};
			case (_rng > _x5 && _rng <= _x6): {_item = [(_mine select 10),_rng2];};
			case (_rng > _x6 && _rng <= _x7): {_item = [(_mine select 12),_rng2];};
			case (_rng > _x7 && _rng <= _x8): {_item = [(_mine select 14),_rng2];};
			};
		};
	case 18: 
		{
		_x1 = (_mine select 1);
		_x2 = _x1 + (_mine select 3);
		_x3 = _x2 + (_mine select 5);
		_x4 = _x3 + (_mine select 7);
		_x5 = _x4 + (_mine select 9);
		_x6 = _x5 + (_mine select 11);
		_x7 = _x6 + (_mine select 13);
		_x8 = _x7 + (_mine select 15);
		_x9 = 100;
		switch (true) do 
			{
			case (0 >= _rng && _rng >= _x1): {_item = [(_mine select 0),_rng2];};
			case (_rng > _x1 && _rng <= _x2): {_item = [(_mine select 2),_rng2];};
			case (_rng > _x2 && _rng <= _x3): {_item = [(_mine select 4),_rng2];};
			case (_rng > _x3 && _rng <= _x4): {_item = [(_mine select 6),_rng2];};
			case (_rng > _x4 && _rng <= _x5): {_item = [(_mine select 8),_rng2];};
			case (_rng > _x5 && _rng <= _x6): {_item = [(_mine select 10),_rng2];};
			case (_rng > _x6 && _rng <= _x7): {_item = [(_mine select 12),_rng2];};
			case (_rng > _x7 && _rng <= _x8): {_item = [(_mine select 14),_rng2];};
			case (_rng > _x8 && _rng <= _x9): {_item = [(_mine select 16),_rng2];};
			};
		};
	case 20: 
		{
		_x1 = (_mine select 1);
		_x2 = _x1 + (_mine select 3);
		_x3 = _x2 + (_mine select 5);
		_x4 = _x3 + (_mine select 7);
		_x5 = _x4 + (_mine select 9);
		_x6 = _x5 + (_mine select 11);
		_x7 = _x6 + (_mine select 13);
		_x8 = _x7 + (_mine select 15);
		_x9 = _x8 + (_mine select 17);
		_x10 = 100;
		switch (true) do 
			{
			case (0 >= _rng && _rng >= _x1): {_item = [(_mine select 0),_rng2];};
			case (_rng > _x1 && _rng <= _x2): {_item = [(_mine select 2),_rng2];};
			case (_rng > _x2 && _rng <= _x3): {_item = [(_mine select 4),_rng2];};
			case (_rng > _x3 && _rng <= _x4): {_item = [(_mine select 6),_rng2];};
			case (_rng > _x4 && _rng <= _x5): {_item = [(_mine select 8),_rng2];};
			case (_rng > _x5 && _rng <= _x6): {_item = [(_mine select 10),_rng2];};
			case (_rng > _x6 && _rng <= _x7): {_item = [(_mine select 12),_rng2];};
			case (_rng > _x7 && _rng <= _x8): {_item = [(_mine select 14),_rng2];};
			case (_rng > _x8 && _rng <= _x9): {_item = [(_mine select 16),_rng2];};
			case (_rng > _x9 && _rng <= _x10): {_item = [(_mine select 18),_rng2];};
			};
		};
	case 22: 
		{
		_x1 = (_mine select 1);
		_x2 = _x1 + (_mine select 3);
		_x3 = _x2 + (_mine select 5);
		_x4 = _x3 + (_mine select 7);
		_x5 = _x4 + (_mine select 9);
		_x6 = _x5 + (_mine select 11);
		_x7 = _x6 + (_mine select 13);
		_x8 = _x7 + (_mine select 15);
		_x9 = _x8 + (_mine select 17);
		_x10 = _x9 + (_mine select 19);
		_x11 = 100;
		switch (true) do 
			{
			case (0 >= _rng && _rng >= _x1): {_item = [(_mine select 0),_rng2];};
			case (_rng > _x1 && _rng <= _x2): {_item = [(_mine select 2),_rng2];};
			case (_rng > _x2 && _rng <= _x3): {_item = [(_mine select 4),_rng2];};
			case (_rng > _x3 && _rng <= _x4): {_item = [(_mine select 6),_rng2];};
			case (_rng > _x4 && _rng <= _x5): {_item = [(_mine select 8),_rng2];};
			case (_rng > _x5 && _rng <= _x6): {_item = [(_mine select 10),_rng2];};
			case (_rng > _x6 && _rng <= _x7): {_item = [(_mine select 12),_rng2];};
			case (_rng > _x7 && _rng <= _x8): {_item = [(_mine select 14),_rng2];};
			case (_rng > _x8 && _rng <= _x9): {_item = [(_mine select 16),_rng2];};
			case (_rng > _x9 && _rng <= _x10): {_item = [(_mine select 18),_rng2];};
			case (_rng > _x10 && _rng <= _x10): {_item = [(_mine select 20),_rng2];};
			};
		};
	case 24: 
		{
		_x1 = (_mine select 1);
		_x2 = _x1 + (_mine select 3);
		_x3 = _x2 + (_mine select 5);
		_x4 = _x3 + (_mine select 7);
		_x5 = _x4 + (_mine select 9);
		_x6 = _x5 + (_mine select 11);
		_x7 = _x6 + (_mine select 13);
		_x8 = _x7 + (_mine select 15);
		_x9 = _x8 + (_mine select 17);
		_x10 = _x9 + (_mine select 19);
		_x11 = _x10 + (_mine select 21);
		_x12 = 100;
		switch (true) do 
			{
			case (0 >= _rng && _rng >= _x1): {_item = [(_mine select 0),_rng2];};
			case (_rng > _x1 && _rng <= _x2): {_item = [(_mine select 2),_rng2];};
			case (_rng > _x2 && _rng <= _x3): {_item = [(_mine select 4),_rng2];};
			case (_rng > _x3 && _rng <= _x4): {_item = [(_mine select 6),_rng2];};
			case (_rng > _x4 && _rng <= _x5): {_item = [(_mine select 8),_rng2];};
			case (_rng > _x5 && _rng <= _x6): {_item = [(_mine select 10),_rng2];};
			case (_rng > _x6 && _rng <= _x7): {_item = [(_mine select 12),_rng2];};
			case (_rng > _x7 && _rng <= _x8): {_item = [(_mine select 14),_rng2];};
			case (_rng > _x8 && _rng <= _x9): {_item = [(_mine select 16),_rng2];};
			case (_rng > _x9 && _rng <= _x10): {_item = [(_mine select 18),_rng2];};
			case (_rng > _x10 && _rng <= _x10): {_item = [(_mine select 20),_rng2];};
			case (_rng > _x11 && _rng <= _x12): {_item = [(_mine select 22),_rng2];};
			};
		};
	case 26: 
		{
		_x1 = (_mine select 1);
		_x2 = _x1 + (_mine select 3);
		_x3 = _x2 + (_mine select 5);
		_x4 = _x3 + (_mine select 7);
		_x5 = _x4 + (_mine select 9);
		_x6 = _x5 + (_mine select 11);
		_x7 = _x6 + (_mine select 13);
		_x8 = _x7 + (_mine select 15);
		_x9 = _x8 + (_mine select 17);
		_x10 = _x9 + (_mine select 19);
		_x11 = _x10 + (_mine select 21);
		_x12 = _x11 + (_mine select 23);
		_x13 = 100;
		switch (true) do 
			{
			case (0 >= _rng && _rng >= _x1): {_item = [(_mine select 0),_rng2];};
			case (_rng > _x1 && _rng <= _x2): {_item = [(_mine select 2),_rng2];};
			case (_rng > _x2 && _rng <= _x3): {_item = [(_mine select 4),_rng2];};
			case (_rng > _x3 && _rng <= _x4): {_item = [(_mine select 6),_rng2];};
			case (_rng > _x4 && _rng <= _x5): {_item = [(_mine select 8),_rng2];};
			case (_rng > _x5 && _rng <= _x6): {_item = [(_mine select 10),_rng2];};
			case (_rng > _x6 && _rng <= _x7): {_item = [(_mine select 12),_rng2];};
			case (_rng > _x7 && _rng <= _x8): {_item = [(_mine select 14),_rng2];};
			case (_rng > _x8 && _rng <= _x9): {_item = [(_mine select 16),_rng2];};
			case (_rng > _x9 && _rng <= _x10): {_item = [(_mine select 18),_rng2];};
			case (_rng > _x10 && _rng <= _x10): {_item = [(_mine select 20),_rng2];};
			case (_rng > _x11 && _rng <= _x12): {_item = [(_mine select 22),_rng2];};
			case (_rng > _x12 && _rng <= _x13): {_item = [(_mine select 24),_rng2];};
			};
		};
};	



_diff = [(_item select 0),(_item select 1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};

life_action_inUse = true;
player say3D "pickaxe";
for "_i" from 0 to 2 do {

	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,(_item select 0),_diff] call life_fnc_handleInv)) then {
	_itemName = [((_item select 0),0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_ISTR_Pick_Success",(localize _itemName),_diff],"PLAIN"];
};

life_action_inUse = false;

life_thirst = life_thirst - 3;
[] call life_fnc_hudUpdate;

[] spawn life_fnc_pickAxeUse;