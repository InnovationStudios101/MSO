if(mps_ace_enabled) then {	_w = _w +  [		"NVGoggles","ItemCompass","Laserdesignator","ACE_SOFLAMTripod","ACE_SpottingScope","ACE_Rangefinder_OD","ACE_SpottingScope","ACE_Kestrel4500","ACE_HuntIR_monitor",		"ACE_Broken_GPS","ACE_BrokenWatch","ACE_Earplugs","ACE_Map","ACE_ParachutePack","ACE_GlassesBalaklava","ACE_GlassesLHD_glasses","ACE_GlassesSunglasses",		"ACE_GlassesTactical","ACE_GlassesGasMask_US","ACE_Backpack_US","ACE_Rucksack_MOLLE_ACU","ACE_Rucksack_MOLLE_ACU_Medic","ACE_CharliePack","ACE_ANPRC77","ACE_KeyCuffs",		"ACE_M252Proxy","ACE_M252TripodProxy",		"ACE_Glock18","ACE_P226","ACE_P8","ACE_USP","ACE_USPSD","M9","M9SD","aaw_9mmslp"	];	_list = _list + [		["PRIVATE", "ALL",	["AAW_f88_AIM","AAW_f88_A1","MP5A5","AAW_f88_A1_carbine","ACE_HK416_D14","ACE_M1014_Eotech","M4A1_Aim","ACE_MP5A5"] ],		["PRIVATE", "SOLDIER",	["AAW_f88SA2_AIM","AAW_f88SA2_AIM_carbine","ACE_SPAS12","M4A1_Aim_camo","ACE_M4A1_C","ACE_M4A1_GL"] ],		["PRIVATE", "AT",	["Stinger","AAW_M72a6"] ],		["PRIVATE", "SNIPER",	["M24","ACE_HK417_Shortdot","ACE_SOC_M4A1_SHORTDOT","ACE_M14_ACOG"] ],		["PRIVATE", "MG",	["AAW_f89_AIM","AAW_mag58"] ],		["CORPORAL", "ALL",	["AAW_f88_AIM_gla","AAW_f88_A1_gla","AAW_f88_AIM_carbine","AAW_f88_ACOG","AAW_M72a6","ACE_HK416_D10_M320","ACE_HK416_D10_AIM","ACE_HK416_D14_SD"] ],		["CORPORAL", "SOLDIER",	["ACE_SOC_M4A1","AAW_f88SA2_elcan"] ],		["CORPORAL", "AT",	["AAW_M2_carlG"] ],		["CORPORAL", "SNIPER",	["M40A3","ACE_SOC_M4A1_SHORTDOT_SD","BAF_LRR_scoped_W"] ],		["CORPORAL", "MG",	["AAW_mag58_AIM"] ],		["SERGEANT", "ALL",	["AAW_f88_elcan","AAW_f88SA2_elcan_carbine","AAW_f88_S_carbine","AAW_f88_ACOG_gla","AAW_f88_S","ACE_HK416_D10_Holo","ACE_M4_Eotech","ACE_M4_AIM_GL"] ],		["SERGEANT", "SOLDIER",	["AAW_f88SA2_elcan_gla","AAW_f88SA2_ACOG","ACE_SOC_M4A1_Eotech"] ],		["SERGEANT", "AT",	["AAW_M2_carlG_optic"] ],		["SERGEANT", "SNIPER",	["M4SPR","ACE_M4SPR_SD"] ],		["SERGEANT", "MG",	["AAW_f89_ELCAN"] ],		["LIEUTENANT", "ALL",	["AAW_f88_elcan_gla","AAW_f88_S_gla","ACE_M4_Eotech_GL"] ],		["LIEUTENANT", "SOLDIER",["AAW_f88SA2_ACOG_gla","ACE_SOC_M4A1_EOT_SD","ACE_SOC_M4A1_GL_AIMPOINT","ACE_SOC_M4A1_AIM_SD"] ],		["LIEUTENANT", "AT",	[] ],		["LIEUTENANT", "SNIPER",["ACE_Mk12mod1","ACE_Mk12mod1_SD"] ],		["LIEUTENANT", "MG",	["AAW_mag58_ELCAN","Mk_48","AAW_f89_15"] ],		["CAPTAIN", "ALL",	["AAW_f88SA2_ACOG","AAW_f88SA2_AIM_carbine","ACE_M4_ACOG","AAW_f88SA2_15","AAW_f88SA2_15_carbine"] ],		["CAPTAIN", "SOLDIER",	["ACE_M4A1_ACOG","ACE_M4A1_ACOG_PVS14","ACE_M4A1_ACOG_SD","ACE_SOC_M4A1_RCO_GL","M4A1_RCO_GL"] ],		["CAPTAIN", "AT",	["ACE_Javelin_CLU","ACE_Javelin_Direct"] ],		["CAPTAIN", "SNIPER",	[] ],		["CAPTAIN", "MG",	["AAW_f89_ACOG"] ],		["MAJOR",   "ALL",	["AAW_f88SA2_ACOG_gla","ACE_M4_RCO_GL","AAW_f88SA2_15_gla"] ],		["MAJOR",   "SOLDIER",	[] ],		["MAJOR",   "AT",	[] ],		["MAJOR",   "SNIPER",	["ACE_TAC50","ACE_TAC50_SD"] ],		["MAJOR",   "MG",	["AAW_mag58_ACOG"] ],		["COLONEL", "ALL",	[/*"ACE_Javelin_CLU","ACE_Javelin_Direct"*/] ],		["COLONEL", "SOLDIER",	["ACE_TAC50","ACE_TAC50_SD"] ],		["COLONEL", "AT",	[] ],		["COLONEL", "SNIPER",	[] ],		["COLONEL", "MG",	[] ]	];	_m = _m + [		"SmokeShell","SmokeShellYellow","SmokeShellRed","SmokeShellGreen","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","PipeBomb","HandGrenade_West","aaw_f1_grenade",		"Mine","ACE_Claymore_M","ACE_BBetty_M","ACE_M4SLAM_M","ACE_TripFlare_M","ACE_Rope_M_50","ACE_Rope_M_90","ACE_Rope_M_120","ACE_Rope_TOW_M_5","ACE_Rope_M5","Laserbatteries",		"ACE_BATTERY_RANGEFINDER","ACE_IRSTROBE","ACE_KNICKLICHT_W","ACE_KNICKLICHT_R","ACE_KNICKLICHT_Y","ACE_KNICKLICHT_G","ACE_KNICKLICHT_B","ACE_KNICKLICHT_IR",		"10Rnd_127x99_m107","15Rnd_9x19_M9","30Rnd_556x45_Stanag","5Rnd_762x51_M24","7Rnd_45ACP_1911","ACE_1Rnd_CS_M203","ACE_1Rnd_HE_M203","ACE_SSGreen_M203",		"ACE_SSRed_M203","ACE_SSRed_M203","ACE_SSWhite_M203","ACE_SSWhite_M203","ACE_SSYellow_M203","FlareRed_M203","FlareWhite_M203", "100Rnd_762x51_M240","5Rnd_86x70_L115A1",		"ACE_100Rnd_556x45_T_M249","ACE_200Rnd_556x45_T_M249","ACE_20Rnd_762x51_S_SCAR","ACE_20Rnd_762x51_T_DMR","ACE_20Rnd_762x51_T_HK417","ACE_20Rnd_762x51_T_SCAR",		"ACE_30Rnd_556x45_S_Stanag","ACE_30Rnd_556x45_T_Stanag","ACE_30Rnd_9x19_S_MP5", "ACE_5Rnd_127x99_B_TAC50","ACE_5Rnd_127x99_S_TAC50","ACE_5Rnd_127x99_T_TAC50",		"ACE_8Rnd_12Ga_Buck00","ACE_8Rnd_12Ga_Slug","ACE_30Rnd_6x35_B_PDW","ACE_25Rnd_1143x23_B_UMP45","ACE_25Rnd_1143x23_S_UMP45","ACE_FlareIR_M203","ACE_HuntIR_M203",		"ACE_Javelin_Direct","ACE_M576","Stinger","ACE_M252HE_CSWDM",		"aaw_f88_mag","aaw_f88_mag_allTracers","AAW_M72a6","aaw_HEDP","aaw_HEAT","aaw_HEAT_RAP","aaw_HEDP_FFV","aaw_HEAT_FFV","aaw_HEAT_RAP_FFV",		"aaw_f89_mag","aaw_f89_mag_allTracers","aaw_f89_100_mag","aaw_f89_100_mag_allTracers","aaw_mag58_mag","aaw_mag58_mag_allTracers","13Rnd_9mm_SLP"	];}else{	_w = _w +  ["Binocular","NVGoggles","ItemCompass","ItemGPS","ItemMap","ItemRadio","ItemWatch","Laserdesignator","M9","M9SD","aaw_9mmslp"];	_list = _list + [		["PRIVATE", "ALL",	["AAW_f88_AIM","MP5A5","M4A1_Aim","M1014"] ],		["PRIVATE", "SOLDIER",	["AAW_f88SA2_AIM","AAW_f88SA2_AIM_carbine"] ],		["PRIVATE", "AT",	["Stinger","AAW_M72a6"] ],		["PRIVATE", "SNIPER",	["M24"] ],		["PRIVATE", "MG",	["AAW_f89_AIM"] ],		["CORPORAL", "ALL",	["AAW_f88_AIM_gla","AAW_M72a6"] ],		["CORPORAL", "SOLDIER",	["AAW_f88SA2_elcan"] ],		["CORPORAL", "AT",	["AAW_M2_carlG"] ],		["CORPORAL", "SNIPER",	["BAF_LRR_scoped_W"] ],		["CORPORAL", "MG",	["AAW_mag58_AIM"] ],		["SERGEANT", "ALL",	["AAW_f88_elcan"] ],		["SERGEANT", "SOLDIER",	["AAW_f88SA2_elcan_gla","AAW_f88SA2_ACOG"] ],		["SERGEANT", "AT",	["AAW_M2_carlG_optic"] ],		["SERGEANT", "SNIPER",	[] ],		["SERGEANT", "MG",	["AAW_f89_ELCAN"] ],		["LIEUTENANT", "ALL",	["AAW_f88_elcan_gla"] ],		["LIEUTENANT", "SOLDIER",["AAW_f88SA2_ACOG_gla"] ],		["LIEUTENANT", "AT",	["Javelin"] ],		["LIEUTENANT", "SNIPER",["BAF_AS50_scoped"] ],		["LIEUTENANT", "MG",	["AAW_mag58_ELCAN"] ],		["CAPTAIN", "ALL",	["AAW_f88SA2_ACOG","AAW_f88SA2_AIM_carbine"] ],		["CAPTAIN", "SOLDIER",	[] ],		["CAPTAIN", "AT",	[] ],		["CAPTAIN", "SNIPER",	[] ],		["CAPTAIN", "MG",	["AAW_f89_ELCAN"] ],		["MAJOR",   "ALL",	["AAW_f88SA2_ACOG_gla","AAW_M2_carlG"] ],		["MAJOR",   "SOLDIER",	[] ],		["MAJOR",   "AT",	[] ],		["MAJOR",   "SNIPER",	[] ],		["MAJOR",   "MG",	["AAW_mag58_ACOG"] ],		["COLONEL", "ALL",	["Javelin"] ],		["COLONEL", "SOLDIER",	["BAF_AS50_scoped"] ],		["COLONEL", "AT",	[] ],		["COLONEL", "SNIPER",	[] ],		["COLONEL", "MG",	[] ]	];	_m = _m + [		"SmokeShell","SmokeShellYellow","SmokeShellRed","SmokeShellGreen","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","PipeBomb","HandGrenade_West","Mine",		"15Rnd_9x19_M9","1Rnd_HE_M203","1Rnd_Smoke_M203","1Rnd_SmokeGreen_M203","1Rnd_SmokeRed_M203","1Rnd_SmokeYellow_M203",		"20Rnd_762x51_DMR","30Rnd_556x45_Stanag","30Rnd_9x19_MP5","5Rnd_762x51_M24","8Rnd_B_Beneli_74Slug",		"FlareGreen_M203","FlareRed_M203","FlareWhite_M203","FlareYellow_M203","Javelin","Laserbatteries","Stinger","5Rnd_127x99_as50","5Rnd_86x70_L115A1",		"aaw_f88_mag","aaw_f88_mag_allTracers","AAW_M72a6","aaw_HEDP","aaw_HEAT","aaw_HEAT_RAP","aaw_HEDP_FFV","aaw_HEAT_FFV","aaw_HEAT_RAP_FFV",		"aaw_f89_mag","aaw_f89_mag_allTracers","aaw_f89_100_mag","aaw_f89_100_mag_allTracers","aaw_mag58_mag","aaw_mag58_mag_allTracers","13Rnd_9mm_SLP"	];};