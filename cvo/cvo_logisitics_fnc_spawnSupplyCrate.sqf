// Defines the Params
_parameter = _this select 2;
_parameter params["_BoxType", "_spawnloc", "_name", "_array", "_backpacks"];

systemChat "Code Start.";
//	_BoxType = "Land_WoodenBox_F";
//	_spawnPos = [12231.1,17316.6,1];
//	_array = [["Ace_banana", 100],["ace_maptools",100]];

systemChat ("code _BoxType: " + str _BoxType);
systemChat ("code _spawnloc: " + str _spawnloc);
systemChat ("code _array: " + str _array);
systemChat ("code _backpacks: " + str _backpacks);

_spawnPos = getPosATL _spawnloc;
_spawnPos set [2, ((_spawnPos select 2) + 1)];

// spawn the desired box at the desired location.

_box = createVehicle [_BoxType, _spawnPos,[],2,"CAN_COLLIDE"]; 		
//_box = _BoxType createVehicle _spawnPos;

// set the custom name for Ace Cargo
_box setVariable ["ace_cargo_customname", _name];

systemChat ("code _box: "+ str _box);

// Empties the inventory of the Box
clearItemCargoGlobal _box;

// Fills the Box with anything in the array that isnt a backpack
if (count _array > 0) then {
	{_box addItemCargoGlobal [_x select 0, _x select 1];} forEach _array;
};

// Fills the Box with with backpacks
if (count _backpacks > 0) then {
	{_box addBackpackCargo [_x select 0, _x select 1];} forEach _backpacks;
};