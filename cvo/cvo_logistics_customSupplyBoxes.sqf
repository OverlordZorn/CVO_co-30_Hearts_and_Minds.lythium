cvo_logistics_fnc_addSupplybox = compileScript ["cvo\cvo_logistics_fnc_addSupplyBox.sqf"];


[
	btc_create_object, 
	"Monkey Care Package",
	[
		["Ace_banana", 100]
	]
] call cvo_logistics_fnc_addSupplybox;