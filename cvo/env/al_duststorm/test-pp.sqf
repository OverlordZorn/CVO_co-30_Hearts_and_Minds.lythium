
// this is a test yay

// creates a ppEffect and stores the handle

ppParams_cc_default = [
	1,							// brightness
	1,							// image contrast
	0,							// image contrast offset

	[							// RGB for blending
		0,						// R
	 	0,						// G
	  	0,						// B
	   	0						// a = Blend Factor, 0 Original - 1 Blend
	],				 
	[							// RGB for Colorisation
		1,						// R
		1, 						// G
		1, 						// B
		1						// 0 = Saturation, 0 = original color, 1 = B&W * colorize color 
	],				
	[							// RGB Weight for desaturation
		0.299, 					// R
		0.587, 					// G
		0.114, 					// B
		0						// 0 ? not in use i assume?
	],	
	[							// radial color, optional
		-1, 					// major axis radious of ellipse
		-1, 					// minor axis radius of ellipse
		0, 						// rotation of ellipse axis (in degrees)
		0, 						// centerX of ellipse on the screen ( relative coord from center)
		0, 						// centerY of ellipse on the screen ( relative coord from center)
		0, 						// coeff for inner radious ( where effect is not applied)
		0						// coeff for color interpolation between inner and outer radius	
	]		
];

ppParams_al_01 = [ 
	0.86,
	1,
	0.01,
   [
	-0.14, 
   	0.17, 
   	0.33, 
   	-0.14
   ],
   [
	0.86, 
   	-0.4, 
   	0.86, 
   	0.86
   ],
   [
	-0.57, 
	0.86, 
   	-1.2, 
   	0.86
   ]
];

ppParams_cc_test = [
	1,							// brightness
	1,							// image contrast
	0,							// image contrast offset

	[							// RGB for blending
		0.5,						// R
	 	0,						// G
	  	0,						// B
	   	1						// a = Blend Factor, 0 Original - 1 Blend
	],				 
	[							// RGB for Colorisation
		1,						// R
		1, 						// G
		1, 						// B
		1						// 0 = Saturation, 0 = original color, 1 = B&W * colorize color 
	],				
	[							// RGB Weight for desaturation
		0.299, 					// R
		0.587, 					// G
		0.114, 					// B
		0						// 0 ? not in use i assume?
	],	
	[							// radial color, optional
		-1, 					// major axis radious of ellipse
		-1, 					// minor axis radius of ellipse
		0, 						// rotation of ellipse axis (in degrees)
		0, 						// centerX of ellipse on the screen ( relative coord from center)
		0, 						// centerY of ellipse on the screen ( relative coord from center)
		0, 						// coeff for inner radious ( where effect is not applied)
		0						// coeff for color interpolation between inner and outer radius	
	]		
];

ppParams_cc_test2 = [
	1,							// brightness
	1,							// image contrast
	0,							// image contrast offset

	[							// RGB for blending
		1,						// R
	 	0.4,						// G
	  	0,						// B
	   	0.25						// a = Blend Factor, 0 Original - 1 Blend
	],				 
	[							// RGB for Colorisation
		1,						// R
		1, 						// G
		1, 						// B
		1						// 0 = Saturation, 0 = original color, 1 = B&W * colorize color 
	],				
	[							// RGB Weight for desaturation
		0.299, 					// R
		0.587, 					// G
		0.114, 					// B
		0						// 0 ? not in use i assume?
	],	
	[							// radial color, optional
		-1, 					// major axis radious of ellipse
		-1, 					// minor axis radius of ellipse
		0, 						// rotation of ellipse axis (in degrees)
		0, 						// centerX of ellipse on the screen ( relative coord from center)
		0, 						// centerY of ellipse on the screen ( relative coord from center)
		0, 						// coeff for inner radious ( where effect is not applied)
		0						// coeff for color interpolation between inner and outer radius	
	]		
];



testing = true;
while {testing} do {
test = ppEffectCreate ["ColorCorrections", 1500];
test ppEffectEnable true;

/*
test ppEffectAdjust ppParams_cc_test;
test ppEffectCommit 1;
systemChat "Test1";
sleep 5;
*/

test ppEffectAdjust ppParams_cc_test2;
test ppEffectCommit 1;
systemChat "Test2";
sleep 5;

test ppEffectAdjust ppParams_cc_default;
test ppEffectCommit 1;
systemChat "Default";
sleep 1;
ppEffectDestroy test;
systemChat "Destroyed";
};
testing = false;
/*

sleep 3;

test ppEffectAdjust ppParams_al_01;
test ppEffectCommit 1;

*/