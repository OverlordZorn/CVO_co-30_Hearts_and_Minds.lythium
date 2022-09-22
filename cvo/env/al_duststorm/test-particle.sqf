al_duststorm_on = true;
systemChat "start";
cvo_dustParticleHigh = [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 12, [0, 0, 0], [-1, -1, 0], 3, 10.15, 7.9, 0.01, [10, 10, 20], [[0.65, 0.5, 0.5, 0], [0.65, 0.6, 0.5, 0.3], [1, 0.95, 0.8, 0]], [0.08], 1, 0, "", "", vehicle player,0,true];
cvo_dustParticleLow  = [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 12, [0, 0, 0], [-1, -1, 0], 3, 10.15, 7.9, 0.01, [2, 2, 5], [[0.65, 0.5, 0.5, 0], [0.65, 0.6, 0.5, 0.1], [1, 0.95, 0.8, 0]], [0.08], 1, 0, "", "", vehicle player,0,true];

cvo_dustParticle = cvo_dustParticleLow;
systemChat "low";

[] spawn {
	while {al_duststorm_on} do {

		_leaves_p  = "#particlesource" createVehicleLocal (getpos player);
		if (vehicle player != player) then {_leaves_p attachto [vehicle player];} else {_leaves_p attachto [player];};
		_leaves_p setParticleCircle [100, [0, 0, 0]]; 
		_leaves_p setParticleRandom [0, [10, 10, 7], [4, 4, 5], 2, 0.1, [0, 0, 0, 0.5], 1, 1];
		_leaves_p setParticleParams [["\A3\data_f\ParticleEffects\Hit_Leaves\Sticks_Green", 1, 1, 1], "", "SpaceObject", 1,27,[0,0,0],[50,50,10],2,0.000001,0.0,0.1,[0.1+random 5],[[0.68,0.68,0.68,1]],[1.5,1],13,13,"","",vehicle player,0,true,1,[[0,0,0,0]]];


		_alias_local_fog_1 = "#particlesource" createVehicleLocal (getpos player); 
		if (vehicle player != player) then {_alias_local_fog_1 attachto [vehicle player];} else {_alias_local_fog_1 attachto [player];};
		_alias_local_fog_1 setParticleCircle [10, [3, 3, 0]];
		_alias_local_fog_1 setParticleRandom [10, [0.25, 0.25, 0], [1, 1, 0], 1, 1, [0, 0, 0, 0.1], 0, 0];
		_alias_local_fog_1 setParticleParams cvo_dustParticle;
		
		_alias_local_fog_2 = "#particlesource" createVehicleLocal (getpos player); 
		if (vehicle player != player) then {_alias_local_fog_2 attachto [vehicle player];} else {_alias_local_fog_2 attachto [player];};
		_alias_local_fog_2 setParticleCircle [50, [3, 3, 0]];
		_alias_local_fog_2 setParticleRandom [10, [0.25, 0.25, 0], [1, 1, 0], 1, 1, [0, 0, 0, 0.1], 0, 0];
		_alias_local_fog_2 setParticleParams cvo_dustParticle;
		
		_alias_local_fog_3 = "#particlesource" createVehicleLocal (getpos player); 
		if (vehicle player != player) then {_alias_local_fog_3 attachto [vehicle player];} else {_alias_local_fog_3 attachto [player];};
		_alias_local_fog_3 setParticleCircle [90, [3, 3, 0]];
		_alias_local_fog_3 setParticleRandom [10, [0.25, 0.25, 0], [1, 1, 0], 1, 1, [0, 0, 0, 0.1], 0, 0];
		_alias_local_fog_3 setParticleParams cvo_dustParticle;
		
		_alias_local_fog_4 = "#particlesource" createVehicleLocal (getpos player); 
		if (vehicle player != player) then {_alias_local_fog_4 attachto [vehicle player];} else {_alias_local_fog_4 attachto [player];};
		_alias_local_fog_4 setParticleCircle [130, [3, 3, 0]];
		_alias_local_fog_4 setParticleRandom [10, [0.25, 0.25, 0], [1, 1, 0], 1, 1, [0, 0, 0, 0.1], 0, 0];
		_alias_local_fog_4 setParticleParams cvo_dustParticle;
		
		_alias_local_fog_5 = "#particlesource" createVehicleLocal (getpos player); 
		if (vehicle player != player) then {_alias_local_fog_5 attachto [vehicle player];} else {_alias_local_fog_5 attachto [player];};
		_alias_local_fog_5 setParticleCircle [170, [3, 3, 0]];
		_alias_local_fog_5 setParticleRandom [10, [0.25, 0.25, 0], [1, 1, 0], 1, 1, [0, 0, 0, 0.1], 0, 0];
		_alias_local_fog_5 setParticleParams cvo_dustParticle;
		

		_leaves_p_drop			= 0.2+random 0.5;
		_leaves_p setDropInterval _leaves_p_drop;

		{	_alias_drop_fog_factor	= 0.01+random 0.1; _x setDropInterval _alias_drop_fog_factor;	} forEach [ _alias_local_fog_1, _alias_local_fog_3,_alias_local_fog_4, _alias_local_fog_2, _alias_local_fog_5 ];

		sleep 1 + random 6;

		deletevehicle _leaves_p;

		{	deleteVehicle _x;	} forEach [ _alias_local_fog_1, _alias_local_fog_3,_alias_local_fog_4, _alias_local_fog_2, _alias_local_fog_5];

	};
};

sleep 60;
systemChat "strong";
cvo_dustParticle = cvo_dustParticleHigh;
publicVariable "cvo_dustParticle";

sleep 60;
systemChat "soft";
cvo_dustParticle = cvo_dustParticleLow;
publicVariable "cvo_dustParticle";

sleep 60;
systemChat "off";

al_duststorm_on = false;
publicVariable "al_duststorm_on";

cvo_dustParticleHigh = nil;
cvo_dustParticleLow = nil;
cvo_dustParticle = nil;