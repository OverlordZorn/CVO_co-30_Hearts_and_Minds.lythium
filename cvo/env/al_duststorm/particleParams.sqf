[
	[
		"\A3\data_f\cl_basic", 			// particlesShape
		1, 								// particleFSNtieth
		0, 								// particleFSIndex
		1 								// FSFrameCount 
	],
	"", 								// animationName
	"Billboard", 						// particleType, /*String - Enum: Billboard, SpaceObject*/
	1, 									// timerPeriod, /*Number*/
	12, 								// lifeTime, /*Number*/
	[0, 0, 0], 							// position, /*3D Array of numbers as relative position to particleSource or ... (see biki)
 	[-1, -1, 0], 						// moveVelocity, /*3D Array of numbers.*/
 	3, 									// rotationVelocity, /*Number*/
	10.15, 								// weight, /*Number*/
	7.9, 								// volume, /*Number*/
	0.01,								// rubbing, /*Number*/
	[10, 10, 20],						// size, /*Array of Number*/
	[									// color, /*Array of Array of RGBA Numbers*/
		[0.65, 0.5, 0.5, 0], 
		[0.65, 0.6, 0.5, 0.3], 
		[1, 0.95, 0.8, 0]
	],
	[0.08], 							// animationSpeed, /*Array of Number*/
	1, 									// randomDirectionPeriod, /*Number*/
	0, 									// randomDirectionIntensity, /*Number*/
	"", 								// onTimerScript, /*String*/
	"", 								// beforeDestroyScript, /*String*/
	vehicle player,						// this, /*Object*/
	0,									// angle, /*Optional Number - Default: 0*/
	true								// onSurface, /*Optional Boolean*/
];