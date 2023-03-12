#NoEnv
SetKeyDelay, 1
SetWorkingDir %A_ScriptDir% 
#SingleInstance Force

variablesFromIni(A_ScriptDir . "\Config\variables.ini")
hotkeysFromIni(A_ScriptDir . "\Config\hotkeys.ini")

if (Debugging_Value = "True") {
	Application = notepad.exe
} else {
	Application = GTA5.exe
}

if (Callsign_AdamChange = "False" and Callsign_DavidChange = "True") {
	MsgBox, , ERROR, You have AdamChange set to False and DavidChange set to True.  This is simply not possible!  Have you read the handbook?
	ExitApp
}

global LincolnCallsign := Callsign_Division "-" Callsign_Letter "-" Callsign_Number

if (Callsign_AdamChange = "True" and Callsign_DavidChange = "True") {
	global AdamCallsign := Callsign_Division "-A-" Callsign_Number
	global DavidCallsign := Callsign_Division "-D-" Callsign_Number
} else if (Callsign_AdamChange = "True") {
	global AdamCallsign := Callsign_Division "-A-" Callsign_Number
} else if (Callsign_DavidChange = "True") {
	global AdamCallsign := Callsign_Division "-D-" Callsign_Number
} else {
	global AdamCallsign := Callsign_Division "-" Callsign_Letter "-" Callsign_Number
}

global SpecialCallsignTOM := "TOM-" SpecialCallsigns_TOMNumber
global SpecialCallsignDAVID := SpecialCallsigns_DAVIDNumber "-DAVID"

global BadgeNumber := Badge_Number

Hotkey, %Hotkeys_OpenMenu%, PDMenu, On
Hotkey, %Hotkeys_VOIPReset%, VOIPReset, On
Hotkey, %Hotkeys_ClearGPS%, ClearGPS, On
Hotkey, %Hotkeys_MiniMDC%, MiniMDC, On
Hotkey, %Hotkeys_KillSwitch%, KillSwitch, On

MiniMDC:
	sleep, 150
	send, {LCtrl down}
	send, {M down}
	sleep, 50
	send, {LCtrl Up}{RCtrl Up}{LAlt up}{RAlt up}{LShift up}{RShift up}{M up}
	sleep 150
	send, {F7}
	sleep 50
	send, {F7}
return

VOIPReset:
	send, t/vr 1{enter}
	send, {LCtrl Up}{RCtrl Up}{LAlt up}{RAlt up}{LShift up}{RShift up}
return

ClearGPS:
	send, t/setcall -1{enter}
	send, {LCtrl Up}{RCtrl Up}{LAlt up}{RAlt up}{LShift up}{RShift up}
return

KillSwitch:
	ExitApp
return


PDMenu:
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	Menu, WatchMenu, Add, Start Watch, StartWatch
	Menu, WatchMenu, Add, Start Adam Watch, StartWatchAdam
	Menu, WatchMenu, Add, End Watch, EndWatch
	Menu, FullMenu, Add, Start/End Watch, :WatchMenu

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	Menu, UnitMenu, Add, Rename to %LincolnCallsign%, RenameToLincolnUnit
	if (Callsign_AdamChange = "True" and Callsign_DavidChange = "True") {
		Menu, UnitMenu, Add, Rename to %AdamCallsign%, RenameToAdamUnit
		Menu, UnitMenu, Add, Rename to %DavidCallsign%, RenameToDavidUnit
	} else if (Callsign_AdamChange = "True") {
		Menu, UnitMenu, Add, Rename to %AdamCallsign%, RenameToAdamUnit
	}
	Menu, UnitMenu, Add, Resume Lincoln, ResumeLincolnUnit
	Menu, UnitMenu, Add, Custom, CustomUnit
	if (SpecialCallsigns_AIR = "True") {
		Menu, SpecialUnitMenu, Add, Rename to AIR-1, RenameToAIR
	}
	if (SpecialCallsigns_TOM = "True") {
		Menu, SpecialUnitMenu, Add, Rename to %SpecialCallsignTOM%, RenameToTOM
	}
	if (SpecialCallsigns_DAVID = "True") {
		Menu, SpecialUnitMenu, Add, Rename to %SpecialCallsignDAVID%, RenameToDAVID
	}
	if (SpecialCallsigns_FLD = "True") {
		Menu, SpecialUnitMenu, Add, FLD, RenameToFLD
		Menu, SpecialUnitMenu, Add, Join FLD, JoinFLD
	}
	if (SpecialCallsigns_RED = "True") {
		Menu, SpecialUnitMenu, Add, RED, RenameToRED
		Menu, SpecialUnitMenu, Add, Join RED, JoinRED
	}

	if (SpecialCallsigns_FLD = "True" or SpecialCallsigns_RED = "True" or SpecialCallsigns_TOM = "True" or SpecialCallsigns_DAVID = "True" or SpecialCallsigns_AIR = "True") {
		Menu, UnitMenu, Add, Special, :SpecialUnitMenu
	}

	Menu, FullMenu, Add, Change Unit, :UnitMenu

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	Menu, ClothingMenu, Add, Default Clothing, DutyClothes
	Menu, ClothingMenu, Add, Copilot Clothing, DutyCopilotClothes
	Menu, ClothingMenu, Add, Rain Clothing, DutyRainClothes
	Menu, ClothingMenu, Add, Winter Clothing, DutyWinterClothes

	Menu, EquipmentMenu, Add, Fire Extinguisher, DutyFireExtinguisher
	Menu, EquipmentMenu, Add, Default Weapons, DutyWeapons
	Menu, ClothingMenu, Add, Weapons, :EquipmentMenu

	Menu, FullMenu, Add, Duty Clothing, :ClothingMenu

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	if (VehicleAccess_CrownVic = "True") {
		Menu, VehicleMenu, Add, Crown Vic, SpawnCrownVic
	}
	if (VehicleAccess_Buffalo = "True") {
		Menu, VehicleMenu, Add, Buffalo, SpawnBuffalo
	}
	if (VehicleAccess_Interceptor = "True") {
		Menu, VehicleMenu, Add, Interceptor, SpawnInterceptor
	}
	if (VehicleAccess_Scout = "True") {
		Menu, VehicleMenu, Add, Scout, SpawnScout
	}
	if (VehicleAccess_Alamo = "True") {
		Menu, VehicleMenu, Add, Alamo, SpawnAlamo
	}
	if (VehicleAccess_Caracara = "True") {
		Menu, VehicleMenu, Add, Caracara, SpawnCaracara
	}
	if (VehicleAccess_PoliceBike = "True") {
		Menu, SpecialVehicleMenu, Add, Police Bike, SpawnPoliceBike
	}
	if (VehicleAccess_Kamacho = "True") {
		Menu, SpecialVehicleMenu, Add, Kamacho, SpawnKamacho
	}
	if (VehicleAccess_Drafter = "True") {
		Menu, SpecialVehicleMenu, Add, Drafter, SpawnDrafter
	}
	if (VehicleAccess_Highspeed = "True") {
		Menu, SpecialVehicleMenu, Add, Highspeed, SpawnHighspeed
	}
	if (VehicleAccess_Riot = "True") {
		Menu, SpecialVehicleMenu, Add, Riot, SpawnRiot
	}
	if (VehicleAccess_Tarv = "True") {
		Menu, SpecialVehicleMenu, Add, TARV, SpawnTarv
	}
	if (VehicleAccess_Brickade = "True") {
		Menu, SpecialVehicleMenu, Add, Brickade, SpawnBrickade
	}
	if (VehicleAccess_BF400 = "True") {
		Menu, SpecialVehicleMenu, Add, BF400, SpawnBF400
	}
	if (VehicleAccess_Shinobi = "True") {
		Menu, SpecialVehicleMenu, Add, Shinobi, SpawnShinobi
	}
	if (VehicleAccess_RCV = "True") {
		Menu, SpecialVehicleMenu, Add, RCV, SpawnRCV
	}
	if (VehicleAccess_Insurgent = "True") {
		Menu, SpecialVehicleMenu, Add, Insurgent, SpawnInsurgent
	}
	if (VehicleAccess_Scorcher = "True") {
		Menu, SpecialVehicleMenu, Add, Scorcher, SpawnScorcher
	}
	Menu, SpecialVehicleMenu, Add, Transport Van, SpawnVan
	Menu, SpecialVehicleMenu, Add, Flatbed, SpawnFlatbed
	if (VehicleAccess_UnmarkedCrownVic = "True") {
		Menu, UnmarkedVehicleMenu, Add, Unmarked Crown Vic, SpawnUnmarkedCrownVic
	}
	if (VehicleAccess_UnmarkedBuffalo = "True") {
		Menu, UnmarkedVehicleMenu, Add, Unmarked Buffalo, SpawnUnmarkedBuffalo
	}
	if (VehicleAccess_UnmarkedScout = "True") {
		Menu, UnmarkedVehicleMenu, Add, Unmarked Scout, SpawnUnmarkedScout
	}
	if (VehicleAccess_UnmarkedGranger = "True") {
		Menu, UnmarkedVehicleMenu, Add, Unmarked Granger, SpawnUnmarkedGranger
	}
	if (VehicleAccess_UnmarkedAlamo = "True") {
		Menu, UnmarkedVehicleMenu, Add, Unmarked Alamo, SpawnUnmarkedAlamo
	}
	if (VehicleAccess_UnmarkedCaracara = "True") {
		Menu, UnmarkedVehicleMenu, Add, Unmarked Caracara, SpawnUnmarkedCaracara
	}
	if (VehicleAccess_UnmarkedKamacho = "True") {
		Menu, UnmarkedVehicleMenu, Add, Unmarked Kamacho, SpawnUnmarkedKamacho
	}
	Menu, SeaVehicleMenu, Add, Predator, SpawnPredator
	if (VehicleAccess_Dinghy = "True") {
		Menu, SeaVehicleMenu, Add, Dinghy, SpawnDinghy
	}
	if (VehicleAccess_Maverick = "True") {
		Menu, AirVehicleMenu, Add, Maverick, SpawnMaverick
	}
	if (VehicleAccess_Buzzard = "True") {
		Menu, AirVehicleMenu, Add, Buzzard, SpawnBuzzard
	}

	Menu, VehicleMenu, Add, Park Cruiser, ParkSpawn

	if (VehicleAccess_UnmarkedCrownVic = "True" or VehicleAccess_UnmarkedBuffalo = "True" or VehicleAccess_UnmarkedGranger = "True" or VehicleAccess_UnmarkedScout = "True" or VehicleAccess_UnmarkedAlamo = "True" or VehicleAccess_UnmarkedCaracara = "True" or VehicleAccess_UnmarkedKamacho = "True") {
		Menu, VehicleMenu, Add, Unmarked Vehicles, :UnmarkedVehicleMenu
	}
	Menu, VehicleMenu, Add, Special Vehicles, :SpecialVehicleMenu
	Menu, VehicleMenu, Add, Sea, :SeaVehicleMenu
	if (VehicleAccess_Maverick = "True" or VehicleAccess_Buzzard = "True") {
		Menu, VehicleMenu, Add, Air, :AirVehicleMenu
	}

	Menu, FullMenu, Add, Police Vehicles, :VehicleMenu

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	Menu, TrafficStopMenu, Add, View License, PDLicense
	Menu, TrafficStopMenu, Add, Issue Citation, PDIssueCitationHandler
	Menu, TrafficStopMenu, Add, Hand Citation, PDHandCitation
	Menu, RPMenu, Add, Traffic Stop, :TrafficStopMenu

	Menu, FelonyStopMenu, Add, Step 1: Toss keys from ignition, FelonyStop1
	Menu, FelonyStopMenu, Add, Step 2: Open vehicle door slowly, FelonyStop2
	Menu, FelonyStopMenu, Add, Step 3: Step out, FelonyStop3
	Menu, FelonyStopMenu, Add, Step 4: Full 360, FelonyStop4
	Menu, FelonyStopMenu, Add, Step 5: Walk backwards, FelonyStop5
	Menu, RPMenu, Add, Felony Stop, :FelonyStopMenu

	Menu, ArrestMenu, Add, Cuff, PDCuff
	Menu, ArrestMenu, Add, Uncuff, PDUncuff
	Menu, ArrestMenu, Add, Frisk, PDFrisk
	Menu, ArrestMenu, Add, Frisk for License, PDLicenseFrisk
	Menu, ArrestMenu, Add, Frisk for Keys, PDKeyFrisk
	Menu, ArrestMenu, Add, Unlock Cuffed Person's Car, PDUnlockCuffedCar
	Menu, ArrestMenu, Add, View Cuffed License, PDLicenseCuff
	Menu, RPMenu, Add, Arrest, :ArrestMenu

	Menu, SceneMenu, Add, Grab Barriers, PDGrabBarriers
	Menu, SceneMenu, Add, Gather All Barriers, PDGatherBarriers
	Menu, SceneMenu, Add, Store Barriers, PDStoreBarriers
	Menu, SceneMenu, Add, Grab BLS Kit, PDGrabBLS
	Menu, SceneMenu, Add, Initial BLS, PDInitialBLS
	Menu, SceneMenu, Add, Grab Body Bag, PDGrabBodyBag
	Menu, SceneMenu, Add, Load Into Body Bag, PDLoadIntoBodyBag
	Menu, RPMenu, Add, Scene Management, :SceneMenu

	Menu, InmateProcessingMenu, Add, Uncuff, PDUncuff
	Menu, InmateProcessingMenu, Add, Release form, PDReleaseForm
	Menu, InmateProcessingMenu, Add, Mugshot, PDMugshot
	Menu, InmateProcessingMenu, Add, Fingerprints, PDFingerprints
	Menu, RPMenu, Add, Inmate Processing, :InmateProcessingMenu

	Menu, RPMenu, Add, Tow Vehicle, TowVehicle

	Menu, FullMenu, Add, Traffic Stop/Arrest Procedure, :RPMenu

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	Menu, DRadioMenu, Add, PD to DOC, DRadioPDtoDOC
	Menu, DRadioMenu, Add, PD to MD, DRadioPDtoMD
	Menu, DRadioMenu, Add, 10-15 to DOC, DRadio
	Menu, DRadioMenu, Add, 10-15 to DOC HVT, DRadioHVT
	Menu, DRadioMenu, Add, Injured 10-15, DRadioMDPris
	Menu, FullMenu, Add, Departmental Radio, :DRadioMenu

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	Menu, FullMenu, Add, Pursuit Force, LethalPursuit

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	Menu, SubMenu0, Add, spiderman, MenuHandler
	Menu, SubMenu0, Add, crawl, MenuHandler
	Menu, SubMenu0, Add, airplane, MenuHandler
	Menu, SubMenu0, Add, finger, MenuHandler
	Menu, SubMenu0, Add, celebrate, MenuHandler
	Menu, SubMenu0, Add, shakeoff, MenuHandler
	Menu, SubMenu0, Add, prone, MenuHandler
	Menu, SubMenu0, Add, wave, MenuHandler
	Menu, SubMenu0, Add, sitchair4, MenuHandler

	Menu, FullMenuAnim, Add, Favorites, :SubMenu0
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	Menu, SubMenu1.1, Add, DJ, MenuHandler
	Menu, SubMenu1.1, Add, Airsynth, MenuHandler
	Menu, SubMenu1.1, Add, Airguitar, MenuHandler
	Menu, SubMenu1.1, Add, Guitar, MenuHandler
	Menu, SubMenu1.1, Add, Guitar2, MenuHandler
	Menu, SubMenu1.1, Add, PlayPiano, MenuHandler
	Menu, SubMenu1.1, Add, PlayBass, MenuHandler
	Menu, SubMenu1, Add, Instruments, :SubMenu1.1

	Menu, SubMenu1.2, Add, Bobbing, MenuHandler
	Menu, SubMenu1.2, Add, Bobbing2, MenuHandler
	Menu, SubMenu1, Add, Bobbing, :SubMenu1.2

	Menu, SubMenu1.3, Add, Clown, MenuHandler
	Menu, SubMenu1.3, Add, Clown2, MenuHandler
	Menu, SubMenu1.3, Add, Clown3, MenuHandler
	Menu, SubMenu1.3, Add, Clown4, MenuHandler
	Menu, SubMenu1.3, Add, Clown5, MenuHandler
	Menu, SubMenu1, Add, Clown, :SubMenu1.3

	Menu, SubMenu1.4, Add, Dance, MenuHandler
	Menu, SubMenu1.4, Add, Dance2, MenuHandler
	Menu, SubMenu1.4, Add, Dance3, MenuHandler
	Menu, SubMenu1.4, Add, Dance4, MenuHandler
	Menu, SubMenu1.4, Add, Dance5, MenuHandler
	Menu, SubMenu1.4, Add, Dance6, MenuHandler
	Menu, SubMenu1.4, Add, Dance7, MenuHandler
	Menu, SubMenu1.4, Add, Dance8, MenuHandler
	Menu, SubMenu1.4, Add, Dance9, MenuHandler
	Menu, SubMenu1.4, Add, Dance10, MenuHandler
	Menu, SubMenu1.4, Add, Dance11, MenuHandler
	Menu, SubMenu1.4, Add, Dance12, MenuHandler
	Menu, SubMenu1.4, Add, Dance13, MenuHandler
	Menu, SubMenu1.4, Add, Dance14, MenuHandler
	Menu, SubMenu1, Add, Dances, :SubMenu1.4

	Menu, SubMenu1.5, Add, DanceCheer, MenuHandler
	Menu, SubMenu1.5, Add, DanceCheer2, MenuHandler
	Menu, SubMenu1.5, Add, DanceCheer3, MenuHandler
	Menu, SubMenu1, Add, Dance Cheer, :SubMenu1.5

	Menu, SubMenu1.6, Add, DanceF, MenuHandler
	Menu, SubMenu1.6, Add, DanceF2, MenuHandler
	Menu, SubMenu1.6, Add, DanceF3, MenuHandler
	Menu, SubMenu1.6, Add, DanceF4, MenuHandler
	Menu, SubMenu1.6, Add, DanceF5, MenuHandler
	Menu, SubMenu1.6, Add, DanceF6, MenuHandler
	Menu, SubMenu1.6, Add, DanceF7, MenuHandler
	Menu, SubMenu1.6, Add, DanceF8, MenuHandler
	Menu, SubMenu1.6, Add, DanceF9, MenuHandler
	Menu, SubMenu1.6, Add, DanceF10, MenuHandler
	Menu, SubMenu1.6, Add, DanceF11, MenuHandler
	Menu, SubMenu1.6, Add, DanceF12, MenuHandler
	Menu, SubMenu1.6, Add, DanceF13, MenuHandler
	Menu, SubMenu1.6, Add, DanceF14, MenuHandler
	Menu, SubMenu1.6, Add, DanceF15, MenuHandler
	Menu, SubMenu1.6, Add, DanceF16, MenuHandler
	Menu, SubMenu1.6, Add, DanceF17, MenuHandler
	Menu, SubMenu1.6, Add, DanceF18, MenuHandler
	Menu, SubMenu1, Add, Dance Female, :SubMenu1.6

	Menu, SubMenu1.7, Add, DanceM, MenuHandler
	Menu, SubMenu1.7, Add, DanceM2, MenuHandler
	Menu, SubMenu1.7, Add, DanceM3, MenuHandler
	Menu, SubMenu1.7, Add, DanceM4, MenuHandler
	Menu, SubMenu1.7, Add, DanceM5, MenuHandler
	Menu, SubMenu1.7, Add, DanceM6, MenuHandler
	Menu, SubMenu1.7, Add, DanceM7, MenuHandler
	Menu, SubMenu1.7, Add, DanceM8, MenuHandler
	Menu, SubMenu1.7, Add, DanceM9, MenuHandler
	Menu, SubMenu1.7, Add, DanceM10, MenuHandler
	Menu, SubMenu1.7, Add, DanceM11, MenuHandler
	Menu, SubMenu1.7, Add, DanceM12, MenuHandler
	Menu, SubMenu1, Add, Dance Male, :SubMenu1.7

	Menu, SubMenu1.8, Add, DanceShy, MenuHandler
	Menu, SubMenu1.8, Add, DanceShy2, MenuHandler
	Menu, SubMenu1, Add, Dance Shy, :SubMenu1.8

	Menu, SubMenu1.9, Add, DanceSide, MenuHandler
	Menu, SubMenu1.9, Add, DanceSide2, MenuHandler
	Menu, SubMenu1.9, Add, DanceSide3, MenuHandler
	Menu, SubMenu1, Add, Dance Side, :SubMenu1.9

	Menu, SubMenu1.10, Add, DanceSilly, MenuHandler
	Menu, SubMenu1.10, Add, DanceSilly2, MenuHandler
	Menu, SubMenu1.10, Add, DanceSilly3, MenuHandler
	Menu, SubMenu1.10, Add, DanceSilly4, MenuHandler
	Menu, SubMenu1.10, Add, DanceSilly5, MenuHandler
	Menu, SubMenu1.10, Add, DanceSilly6, MenuHandler
	Menu, SubMenu1.10, Add, DanceSilly7, MenuHandler
	Menu, SubMenu1.10, Add, DanceSilly8, MenuHandler
	Menu, SubMenu1.10, Add, DanceSilly9, MenuHandler
	Menu, SubMenu1, Add, Dance Silly, :SubMenu1.10

	Menu, SubMenu1.11, Add, DanceSlow, MenuHandler
	Menu, SubMenu1.11, Add, DanceSlow2, MenuHandler
	Menu, SubMenu1.11, Add, DanceSlow3, MenuHandler
	Menu, SubMenu1.11, Add, DanceSlow4, MenuHandler
	Menu, SubMenu1, Add, Dance Slow, :SubMenu1.11

	Menu, SubMenu1.12, Add, DanceUpper, MenuHandler
	Menu, SubMenu1.12, Add, DanceUpper2, MenuHandler
	Menu, SubMenu1, Add, Dance Upper, :SubMenu1.12

	Menu, SubMenu1.13, Add, FishDance, MenuHandler
	Menu, SubMenu1.13, Add, FishDance2, MenuHandler
	Menu, SubMenu1.13, Add, FishDance3, MenuHandler
	Menu, SubMenu1, Add, Dance Fish, :SubMenu1.13

	Menu, SubMenu1.14, Add, JazzHands, MenuHandler
	Menu, SubMenu1.14, Add, JazzHands2, MenuHandler
	Menu, SubMenu1, Add, Jazz Hands, :SubMenu1.14

	Menu, SubMenu1.15, Add, LapDance, MenuHandler
	Menu, SubMenu1.15, Add, LapDance2, MenuHandler
	Menu, SubMenu1.15, Add, LapDance3, MenuHandler
	Menu, SubMenu1.15, Add, LapDance4, MenuHandler
	Menu, SubMenu1, Add, Lap Dance, :SubMenu1.15

	Menu, SubMenu1.16, Add, SalsaRoll, MenuHandler
	Menu, SubMenu1.16, Add, SalsaRoll2, MenuHandler
	Menu, SubMenu1, Add, Salsa Roll, :SubMenu1.16

	Menu, SubMenu1.17, Add, Twerk, MenuHandler
	Menu, SubMenu1.17, Add, Twerk2, MenuHandler
	Menu, SubMenu1, Add, Twerk, :SubMenu1.17

	Menu, SubMenu1.18, Add, UncleDisco, MenuHandler
	Menu, SubMenu1.18, Add, UncleDisco2, MenuHandler
	Menu, SubMenu1, Add, Uncle Disco, :SubMenu1.18

	Menu, SubMenu1.19, Add, Woogie, MenuHandler
	Menu, SubMenu1.19, Add, Woogie2, MenuHandler
	Menu, SubMenu1, Add, Woogie, :SubMenu1.19

	Menu, SubMenu1.20, Add, AirHump, MenuHandler
	Menu, SubMenu1.20, Add, Curtsy, MenuHandler
	Menu, SubMenu1.20, Add, PodiumDance, MenuHandler
	Menu, SubMenu1, Add, Other, :SubMenu1.20

	Menu, FullMenuAnim, Add, Dances, :SubMenu1

	Menu, SubMenu2.1, Add, Cop, MenuHandler
	Menu, SubMenu2.1, Add, Cop2, MenuHandler
	Menu, SubMenu2.1, Add, Cop3, MenuHandler
	Menu, SubMenu2.1, Add, Cop4, MenuHandler
	Menu, SubMenu2.1, Add, Cop5, MenuHandler
	Menu, SubMenu2, Add, Cop, :SubMenu2.1

	Menu, SubMenu2.2, Add, CrossArms, MenuHandler
	Menu, SubMenu2.2, Add, CrossArms2, MenuHandler
	Menu, SubMenu2.2, Add, CrossArms3, MenuHandler
	Menu, SubMenu2.2, Add, CrossArms4, MenuHandler
	Menu, SubMenu2.2, Add, CrossArms5, MenuHandler
	Menu, SubMenu2.2, Add, CrossArms6, MenuHandler
	Menu, SubMenu2.2, Add, CrossArmsSide, MenuHandler
	Menu, SubMenu2, Add, Cross Arms, :SubMenu2.2

	Menu, SubMenu2.3, Add, Fit, MenuHandler
	Menu, SubMenu2.3, Add, Fit2, MenuHandler
	Menu, SubMenu2, Add, Fit, :SubMenu2.3

	Menu, SubMenu2.4, Add, FoldArms, MenuHandler
	Menu, SubMenu2.4, Add, FoldArms2, MenuHandler
	Menu, SubMenu2.4, Add, FoldArms3, MenuHandler
	Menu, SubMenu2.4, Add, FoldArms4, MenuHandler
	Menu, SubMenu2.4, Add, FoldArms5, MenuHandler
	Menu, SubMenu2, Add, Fold Arms, :SubMenu2.4

	Menu, SubMenu2.5, Add, Gang, MenuHandler
	Menu, SubMenu2.5, Add, Gang2, MenuHandler
	Menu, SubMenu2, Add, Gang, :SubMenu2.5

	Menu, SubMenu2.6, Add, Idle, MenuHandler
	Menu, SubMenu2.6, Add, Idle2, MenuHandler
	Menu, SubMenu2.6, Add, Idle3, MenuHandler
	Menu, SubMenu2.6, Add, Idle4, MenuHandler
	Menu, SubMenu2.6, Add, Idle5, MenuHandler
	Menu, SubMenu2.6, Add, Idle6, MenuHandler
	Menu, SubMenu2.6, Add, Idle7, MenuHandler
	Menu, SubMenu2.6, Add, Idle8, MenuHandler
	Menu, SubMenu2.6, Add, Idle9, MenuHandler
	Menu, SubMenu2.6, Add, Idle10, MenuHandler
	Menu, SubMenu2.6, Add, Idle11, MenuHandler
	Menu, SubMenu2.6, Add, Idle12, MenuHandler
	Menu, SubMenu2.6, Add, IdleDrunk, MenuHandler
	Menu, SubMenu2.6, Add, IdleDrunk2, MenuHandler
	Menu, SubMenu2.6, Add, IdleDrunk3, MenuHandler
	Menu, SubMenu2, Add, Idle, :SubMenu2.6

	Menu, SubMenu2.7, Add, Impatient, MenuHandler
	Menu, SubMenu2.7, Add, Impatient2, MenuHandler
	Menu, SubMenu2, Add, Impatient, :SubMenu2.7

	Menu, SubMenu2.8.1, Add, Lean, MenuHandler
	Menu, SubMenu2.8.1, Add, Lean2, MenuHandler
	Menu, SubMenu2.8.1, Add, Lean3, MenuHandler
	Menu, SubMenu2.8.1, Add, Lean4, MenuHandler
	Menu, SubMenu2.8.1, Add, Lean5, MenuHandler
	Menu, SubMenu2.8.1, Add, Lean6, MenuHandler
	Menu, SubMenu2.8.1, Add, Lean7, MenuHandler
	Menu, SubMenu2.8.1, Add, Lean8, MenuHandler
	Menu, SubMenu2.8.1, Add, Lean9, MenuHandler
	Menu, SubMenu2.8.1, Add, Lean10, MenuHandler
	Menu, SubMenu2.8, Add, Lean, :SubMenu2.8.1

	Menu, SubMenu2.8.2, Add, LeanBar, MenuHandler
	Menu, SubMenu2.8.2, Add, LeanBar2, MenuHandler
	Menu, SubMenu2.8.2, Add, LeanBar3, MenuHandler
	Menu, SubMenu2.8, Add, Lean Bar, :SubMenu2.8.2

	Menu, SubMenu2.8.3, Add, LeanHigh, MenuHandler
	Menu, SubMenu2.8.3, Add, LeanHigh2, MenuHandler
	Menu, SubMenu2.8, Add, Lean High, :SubMenu2.8.3

	Menu, SubMenu2.8.4, Add, LeanRail, MenuHandler
	Menu, SubMenu2.8.4, Add, LeanRail2, MenuHandler
	Menu, SubMenu2.8.4, Add, LeanRail3, MenuHandler
	Menu, SubMenu2.8, Add, Lean Rail, :SubMenu2.8.4

	Menu, SubMenu2.8.5, Add, LeanSide, MenuHandler
	Menu, SubMenu2.8.5, Add, LeanSide2, MenuHandler
	Menu, SubMenu2.8.5, Add, LeanSide3, MenuHandler
	Menu, SubMenu2.8.5, Add, LeanSide4, MenuHandler
	Menu, SubMenu2.8.5, Add, LeanSide5, MenuHandler
	Menu, SubMenu2.8.5, Add, LeanSide6, MenuHandler
	Menu, SubMenu2.8, Add, Lean Side, :SubMenu2.8.5

	Menu, SubMenu2.8.6, Add, LeanTable, MenuHandler
	Menu, SubMenu2.8.6, Add, LeanTable2, MenuHandler
	Menu, SubMenu2.8, Add, Lean table, :SubMenu2.8.6

	Menu, SubMenu2.8.7, Add, LeanFlirt, MenuHandler
	Menu, SubMenu2.8.7, Add, LeanSleepy, MenuHandler
	Menu, SubMenu2.8.7, Add, LeanStretch, MenuHandler
	Menu, SubMenu2.8, Add, Other, :SubMenu2.8.7
	Menu, SubMenu2, Add, Lean, :SubMenu2.8

	Menu, SubMenu2.9, Add, Listen, MenuHandler
	Menu, SubMenu2.9, Add, Listen2, MenuHandler
	Menu, SubMenu2.9, Add, Listen3, MenuHandler
	Menu, SubMenu2.9, Add, Listen4, MenuHandler
	Menu, SubMenu2.9, Add, Listen5, MenuHandler
	Menu, SubMenu2, Add, Listen, :SubMenu2.9

	Menu, SubMenu2.10, Add, NosePick, MenuHandler
	Menu, SubMenu2.10, Add, NosePick2, MenuHandler
	Menu, SubMenu2, Add, Nose Pick, :SubMenu2.10

	Menu, SubMenu2.11, Add, Sexy, MenuHandler
	Menu, SubMenu2.11, Add, Sexy2, MenuHandler
	Menu, SubMenu2.11, Add, Sexy3, MenuHandler
	Menu, SubMenu2, Add, Sexy, :SubMenu2.11

	Menu, SubMenu2.11.1, Add, Shy, MenuHandler
	Menu, SubMenu2.11.1, Add, Shy2, MenuHandler
	Menu, SubMenu2.11.1, Add, Shy3, MenuHandler
	Menu, SubMenu2, Add, Shy, :SubMenu2.11.1

	Menu, SubMenu2.12, Add, Smoke, MenuHandler
	Menu, SubMenu2.12, Add, SmokeFlick, MenuHandler
	Menu, SubMenu2.12, Add, SmokeFlick2, MenuHandler
	Menu, SubMenu2, Add, Smoke, :SubMenu2.12

	Menu, SubMenu2.13, Add, StandStraight, MenuHandler
	Menu, SubMenu2.13, Add, StandStraight2, MenuHandler
	Menu, SubMenu2.13, Add, StandStraight3, MenuHandler
	Menu, SubMenu2.13, Add, StandStraight4, MenuHandler
	Menu, SubMenu2, Add, Stand Straight, :SubMenu2.13

	Menu, SubMenu2.14, Add, Statue2, MenuHandler
	Menu, SubMenu2.14, Add, Statue3, MenuHandler
	Menu, SubMenu2, Add, Statue, :SubMenu2.14

	Menu, SubMenu2.15, Add, Superhero, MenuHandler
	Menu, SubMenu2.15, Add, Superhero2, MenuHandler
	Menu, SubMenu2.15, Add, Spiderman, MenuHandler
	Menu, SubMenu2, Add, Superhero, :SubMenu2.15

	Menu, SubMenu2.16, Add, T, MenuHandler
	Menu, SubMenu2.16, Add, T2, MenuHandler
	Menu, SubMenu2, Add, T-Poses, :SubMenu2.16

	Menu, SubMenu2.17, Add, Think, MenuHandler
	Menu, SubMenu2.17, Add, Think2, MenuHandler
	Menu, SubMenu2.17, Add, Think3, MenuHandler
	Menu, SubMenu2.17, Add, Think4, MenuHandler
	Menu, SubMenu2.17, Add, Think5, MenuHandler
	Menu, SubMenu2, Add, Think, :SubMenu2.17

	Menu, SubMenu2.18, Add, Twitchy, MenuHandler
	Menu, SubMenu2.18, Add, Twitchy2, MenuHandler
	Menu, SubMenu2.18, Add, Twitchy3, MenuHandler
	Menu, SubMenu2.18, Add, Twitchy4, MenuHandler
	Menu, SubMenu2, Add, Twitchy, :SubMenu2.18

	Menu, SubMenu2.19, Add, Wait, MenuHandler
	Menu, SubMenu2.19, Add, Wait2, MenuHandler
	Menu, SubMenu2.19, Add, Wait3, MenuHandler
	Menu, SubMenu2.19, Add, Wait4, MenuHandler
	Menu, SubMenu2.19, Add, Wait5, MenuHandler
	Menu, SubMenu2.19, Add, Wait6, MenuHandler
	Menu, SubMenu2.19, Add, Wait7, MenuHandler
	Menu, SubMenu2.19, Add, Wait8, MenuHandler
	Menu, SubMenu2.19, Add, Wait9, MenuHandler
	Menu, SubMenu2.19, Add, Wait10, MenuHandler
	Menu, SubMenu2.19, Add, Wait11, MenuHandler
	Menu, SubMenu2.19, Add, Wait12, MenuHandler
	Menu, SubMenu2.19, Add, Wait13, MenuHandler
	Menu, SubMenu2.19, Add, Wait14, MenuHandler
	Menu, SubMenu2.19, Add, Wait15, MenuHandler
	Menu, SubMenu2.19, Add, Wait16, MenuHandler
	Menu, SubMenu2, Add, Wait, :SubMenu2.19

	Menu, SubMenu2.20, Add, Watch, MenuHandler
	Menu, SubMenu2.20, Add, Watch2, MenuHandler
	Menu, SubMenu2.20, Add, WatchStrip, MenuHandler
	Menu, SubMenu2, Add, Watch, :SubMenu2.20

	Menu, SubMenu2.21, Add, AirPlane, MenuHandler
	Menu, SubMenu2.21, Add, Bark, MenuHandler
	Menu, SubMenu2.21, Add, BarTender, MenuHandler
	Menu, SubMenu2.21, Add, CheckOut, MenuHandler
	Menu, SubMenu2.21, Add, FallAsleep, MenuHandler
	Menu, SubMenu2.21, Add, Fidget, MenuHandler
	Menu, SubMenu2.21, Add, Hooker, MenuHandler
	Menu, SubMenu2.21, Add, Ledge, MenuHandler
	Menu, SubMenu2.21, Add, LookAround, MenuHandler
	Menu, SubMenu2.21, Add, Metal, MenuHandler
	Menu, SubMenu2.21, Add, Namaste, MenuHandler
	Menu, SubMenu2.21, Add, Pee, MenuHandler
	Menu, SubMenu2.21, Add, Peek, MenuHandler
	Menu, SubMenu2.21, Add, Reaching, MenuHandler
	Menu, SubMenu2.21, Add, StickUp, MenuHandler
	Menu, SubMenu2.21, Add, Stumble, MenuHandler
	Menu, SubMenu2.21, Add, Stunned, MenuHandler
	Menu, SubMenu2.21, Add, Threaten, MenuHandler
	Menu, SubMenu2.21, Add, Warming, MenuHandler
	Menu, SubMenu2.21, Add, WashFace, MenuHandler
	Menu, SubMenu2.21, Add, Wasted, MenuHandler
	Menu, SubMenu2, Add, Other, :SubMenu2.21
	Menu, FullMenuAnim, Add, Stances, :SubMenu2

	Menu, SubMenu3.1.1, Add, Sit, MenuHandler
	Menu, SubMenu3.1.1, Add, Sit2, MenuHandler
	Menu, SubMenu3.1.1, Add, Sit3, MenuHandler
	Menu, SubMenu3.1.1, Add, Sit4, MenuHandler
	Menu, SubMenu3.1.1, Add, Sit5, MenuHandler
	Menu, SubMenu3.1.1, Add, Sit6, MenuHandler
	Menu, SubMenu3.1.1, Add, Sit7, MenuHandler
	Menu, SubMenu3.1.1, Add, Sit8, MenuHandler
	Menu, SubMenu3.1.1, Add, Sit9, MenuHandler
	Menu, SubMenu3.1.1, Add, Sit10, MenuHandler
	Menu, SubMenu3.1.1, Add, Sit11, MenuHandler
	Menu, SubMenu3.1.1, Add, Sit12, MenuHandler
	Menu, SubMenu3.1.1, Add, SitDrunk, MenuHandler
	Menu, SubMenu3.1.1, Add, SitFloor, MenuHandler
	Menu, SubMenu3.1.1, Add, SitFloor2, MenuHandler
	Menu, SubMenu3.1.1, Add, SitGround, MenuHandler
	Menu, SubMenu3.1.1, Add, SitSad, MenuHandler
	Menu, SubMenu3.1.1, Add, SitScared, MenuHandler
	Menu, SubMenu3.1.1, Add, SitScared2, MenuHandler
	Menu, SubMenu3.1.1, Add, SitScared3, MenuHandler
	Menu, SubMenu3.1, Add, Sit, :SubMenu3.1.1
	Menu, SubMenu3.1, Add, Meditate, MenuHandler
	Menu, SubMenu3.1, Add, Meditate2, MenuHandler
	Menu, SubMenu3.1, Add, Meditate3, MenuHandler
	Menu, SubMenu3.1, Add, Praise, MenuHandler
	Menu, SubMenu3.1, Add, Praise2, MenuHandler
	Menu, SubMenu3, Add, Sit on ground, :SubMenu3.1

	Menu, SubMenu3.2.1, Add, Bench, MenuHandler
	Menu, SubMenu3.2.1, Add, Bench2, MenuHandler
	Menu, SubMenu3.2.1, Add, Bench3, MenuHandler
	Menu, SubMenu3.2.1, Add, BenchSmoke, MenuHandler
	Menu, SubMenu3.2.1, Add, TalkOnBench, MenuHandler
	Menu, SubMenu3.2, Add, Bench, :SubMenu3.2.1
	Menu, SubMenu3.2, Add, Praise2, MenuHandler
	Menu, SubMenu3.2, Add, PimpSit, MenuHandler
	Menu, SubMenu3.2, Add, SitBonnet, MenuHandler

	Menu, SubMenu3.2.2, Add, SitChair, MenuHandler
	Menu, SubMenu3.2.2, Add, SitChair2, MenuHandler
	Menu, SubMenu3.2.2, Add, SitChair3, MenuHandler
	Menu, SubMenu3.2.2, Add, SitChair4, MenuHandler
	Menu, SubMenu3.2.2, Add, SitChair5, MenuHandler
	Menu, SubMenu3.2.2, Add, SitChair6, MenuHandler
	Menu, SubMenu3.2.2, Add, SitChairSide, MenuHandler
	Menu, SubMenu3.2, Add, Chair, :SubMenu3.2.2

	Menu, SubMenu3.2, Add, SitLean, MenuHandler
	Menu, SubMenu3.2, Add, SitStairs, MenuHandler
	Menu, SubMenu3.2, Add, SitWorried, MenuHandler
	Menu, SubMenu3, Add, Sit on object, :SubMenu3.2

	Menu, SubMenu3.3, Add, Crouch, MenuHandler
	Menu, SubMenu3.3, Add, Crouch2, MenuHandler
	Menu, SubMenu3, Add, Crouch, :SubMenu3.3

	Menu, SubMenu3.4, Add, Kneel, MenuHandler
	Menu, SubMenu3.4, Add, Kneel2, MenuHandler
	Menu, SubMenu3.4, Add, Kneel3, MenuHandler
	Menu, SubMenu3.4, Add, Medic, MenuHandler
	Menu, SubMenu3, Add, Kneel, :SubMenu3.4

	Menu, FullMenuAnim, Add, Sit/Crouch/Kneel, :SubMenu3

	Menu, SubMenu4.1, Add, CloudGaze, MenuHandler
	Menu, SubMenu4.1, Add, CloudGaze2, MenuHandler
	Menu, SubMenu4, Add, Cloud Gaze, :SubMenu4.1

	Menu, SubMenu4.2, Add, Down, MenuHandler
	Menu, SubMenu4.2, Add, Down2, MenuHandler
	Menu, SubMenu4.2, Add, Down3, MenuHandler
	Menu, SubMenu4.2, Add, Down4, MenuHandler
	Menu, SubMenu4.2, Add, Down5, MenuHandler
	Menu, SubMenu4, Add, Down, :SubMenu4.2

	Menu, SubMenu4.3, Add, PassOut, MenuHandler
	Menu, SubMenu4.3, Add, PassOut2, MenuHandler
	Menu, SubMenu4.3, Add, PassOut3, MenuHandler
	Menu, SubMenu4.3, Add, PassOut4, MenuHandler
	Menu, SubMenu4.3, Add, PassOut5, MenuHandler
	Menu, SubMenu4, Add, Pass out, :SubMenu4.3

	Menu, SubMenu4.4, Add, Slumped, MenuHandler
	Menu, SubMenu4.4, Add, Slumped2, MenuHandler
	Menu, SubMenu4, Add, Slumped, :SubMenu4.4

	Menu, SubMenu4.5, Add, SunBathe, MenuHandler
	Menu, SubMenu4.5, Add, SunBathe2, MenuHandler
	Menu, SubMenu4.5, Add, SunBathe3, MenuHandler
	Menu, SubMenu4, Add, Sun bathing, :SubMenu4.5

	Menu, SubMenu4.6, Add, Chill, MenuHandler
	Menu, SubMenu4.6, Add, LayDown, MenuHandler
	Menu, SubMenu4.6, Add, LayingInPain, MenuHandler
	Menu, SubMenu4.6, Add, Prone, MenuHandler
	Menu, SubMenu4.6, Add, Sleep, MenuHandler
	Menu, SubMenu4, Add, Other, :SubMenu4.6
	Menu, FullMenuAnim, Add, Laydown, :SubMenu4

	Menu, SubMenu5.1.1, Add, Arrest, MenuHandler
	Menu, SubMenu5.1.1, Add, HandsUp, MenuHandler
	Menu, SubMenu5.1, Add, Standing, :SubMenu5.1.1

	Menu, SubMenu5.1.2, Add, Down2, MenuHandler
	Menu, SubMenu5.1.2, Add, Down3, MenuHandler
	Menu, SubMenu5.1.2, Add, Down5, MenuHandler
	Menu, SubMenu5.1, Add, On knees, :SubMenu5.1.2
	Menu, SubMenu5, Add, Allow detain/arrest, :SubMenu5.1

	Menu, SubMenu5.2, Add, Surrender, MenuHandler
	Menu, SubMenu5.2, Add, HandsUp2, MenuHandler
	Menu, SubMenu5, Add, Surrender, :SubMenu5.2

	Menu, SubMenu5.3, Add, Cower, MenuHandler
	Menu, SubMenu5.3, Add, Down4, MenuHandler
	Menu, SubMenu5.3, Add, Hostage, MenuHandler

	Menu, SubMenu5.3.1, Add, Frightened, MenuHandler
	Menu, SubMenu5.3.1, Add, Frightened2, MenuHandler
	Menu, SubMenu5.3.1, Add, Frightened3, MenuHandler
	Menu, SubMenu5.3.1, Add, Frightened4, MenuHandler
	Menu, SubMenu5.3, Add, Frightened, :SubMenu5.3.1
	Menu, SubMenu5, Add, Scared, :SubMenu5.3
	Menu, SubMenu5, Add, UnCuff, MenuHandler
	Menu, FullMenuAnim, Add, Hostage/Detaining, :SubMenu5

	Menu, SubMenu6, Add, Adjust, MenuHandler
	Menu, SubMenu6, Add, AdjustTie, MenuHandler
	Menu, SubMenu6, Add, DustOff, MenuHandler
	Menu, SubMenu6, Add, ShakeOff, MenuHandler

	Menu, SubMenu6.1, Add, TryClothes, MenuHandler
	Menu, SubMenu6.1, Add, TryClothes2, MenuHandler
	Menu, SubMenu6.1, Add, TryClothes3, MenuHandler
	Menu, SubMenu6, Add, Try Clothes, :SubMenu6.1
	Menu, FullMenuAnim, Add, Clothing, :SubMenu6

	Menu, SubMenu7, Add, Angry, MenuHandler

	Menu, SubMenu7.1, Add, Argue, MenuHandler
	Menu, SubMenu7.1, Add, Argue2, MenuHandler
	Menu, SubMenu7, Add, Argue, :SubMenu7.1

	Menu, SubMenu7.2, Add, Depressed, MenuHandler
	Menu, SubMenu7.2, Add, Depressed2, MenuHandler
	Menu, SubMenu7, Add, Depressed, :SubMenu7.2

	Menu, SubMenu7, Add, Distressed, MenuHandler

	Menu, SubMenu7.3, Add, FacePalm, MenuHandler
	Menu, SubMenu7.3, Add, FacePalm2, MenuHandler
	Menu, SubMenu7.3, Add, FacePalm3, MenuHandler
	Menu, SubMenu7.3, Add, FacePalm4, MenuHandler
	Menu, SubMenu7.3, Add, Palm, MenuHandler
	Menu, SubMenu7, Add, Face palming, :SubMenu7.3

	Menu, SubMenu7.4, Add, Frightened, MenuHandler
	Menu, SubMenu7.4, Add, Frightened2, MenuHandler
	Menu, SubMenu7.4, Add, Frightened3, MenuHandler
	Menu, SubMenu7.4, Add, Frightened4, MenuHandler
	Menu, SubMenu7, Add, Frightened, :SubMenu7.4

	Menu, SubMenu7.5, Add, Nervous, MenuHandler
	Menu, SubMenu7.5, Add, Nervous2, MenuHandler
	Menu, SubMenu7.5, Add, Nervous3, MenuHandler
	Menu, SubMenu7, Add, Nervous, :SubMenu7.5

	Menu, SubMenu7.6, Add, Scared, MenuHandler
	Menu, SubMenu7.6, Add, Scared2, MenuHandler
	Menu, SubMenu7.6, Add, Scared3, MenuHandler
	Menu, SubMenu7.6, Add, SitScared, MenuHandler
	Menu, SubMenu7.6, Add, SitScared2, MenuHandler
	Menu, SubMenu7.6, Add, SitScared3, MenuHandler
	Menu, SubMenu7, Add, Scared, :SubMenu7.6

	Menu, SubMenu7.7, Add, Shy, MenuHandler
	Menu, SubMenu7.7, Add, Shy2, MenuHandler
	Menu, SubMenu7.7, Add, Shy3, MenuHandler
	Menu, SubMenu7, Add, Shy, :SubMenu7.7

	Menu, SubMenu7.8, Add, Worried, MenuHandler
	Menu, SubMenu7.8, Add, SitWorried, MenuHandler
	Menu, SubMenu7, Add, Worried, :SubMenu7.8
	Menu, FullMenuAnim, Add, Emotions, :SubMenu7

	Menu, SubMenu8, Add, Beast, MenuHandler

	Menu, SubMenu8.1, Add, Boxing, MenuHandler
	Menu, SubMenu8.1, Add, Boxing2, MenuHandler
	Menu, SubMenu8, Add, Boxing, :SubMenu8.1

	Menu, SubMenu8.2, Add, BringItOn, MenuHandler
	Menu, SubMenu8.2, Add, FightMe, MenuHandler
	Menu, SubMenu8.2, Add, FightMe2, MenuHandler
	Menu, SubMenu8.2, Add, KnuckleCrunch, MenuHandler
	Menu, SubMenu8.2, Add, KnuckleCrunch2, MenuHandler
	Menu, SubMenu8, Add, Challenge someone, :SubMenu8.2

	Menu, SubMenu8.3, Add, Headbutt, MenuHandler
	Menu, SubMenu8.3, Add, Punching, MenuHandler
	Menu, SubMenu8.3, Add, Slap, MenuHandler
	Menu, SubMenu8, Add, Attacks, :SubMenu8.3

	Menu, FullMenuAnim, Add, Fight, :SubMenu8

	Menu, SubMenu9.1, Add, Bark, MenuHandler
	Menu, SubMenu9.1, Add, Bird, MenuHandler
	Menu, SubMenu9.1, Add, Rabbit, MenuHandler
	Menu, SubMenu9, Add, Animals, :SubMenu9.1

	Menu, SubMenu9.2, Add, Freakout, MenuHandler
	Menu, SubMenu9.2, Add, Freakout2, MenuHandler
	Menu, SubMenu9, Add, Freakout, :SubMenu9.2

	Menu, SubMenu9, Add, GrabCrotch, MenuHandler

	Menu, SubMenu9.3, Add, Loco, MenuHandler
	Menu, SubMenu9.3, Add, Loco2, MenuHandler
	Menu, SubMenu9, Add, Loco, :SubMenu9.3

	Menu, SubMenu9.4, Add, LOL, MenuHandler
	Menu, SubMenu9.4, Add, LOL2, MenuHandler
	Menu, SubMenu9, Add, LOL, :SubMenu9.4

	Menu, SubMenu9.5, Add, MindControl, MenuHandler
	Menu, SubMenu9.5, Add, MindControl2, MenuHandler
	Menu, SubMenu9, Add, Mind control, :SubMenu9.5

	Menu, SubMenu9, Add, PickButt, MenuHandler
	Menu, SubMenu9, Add, Wank, MenuHandler

	Menu, FullMenuAnim, Add, Goofy, :SubMenu9

	Menu, SubMenu10.1, Add, Bow, MenuHandler
	Menu, SubMenu10.1, Add, Bow2, MenuHandler
	Menu, SubMenu10, Add, Bow, :SubMenu10.1

	Menu, SubMenu10.2, Add, BroLove, MenuHandler
	Menu, SubMenu10.2, Add, BroLove2, MenuHandler
	Menu, SubMenu10, Add, Bro love, :SubMenu10.2

	Menu, SubMenu10.3, Add, Damn, MenuHandler
	Menu, SubMenu10.3, Add, Damn2, MenuHandler
	Menu, SubMenu10.3, Add, Damn3, MenuHandler
	Menu, SubMenu10, Add, Damn, :SubMenu10.3

	Menu, SubMenu10.4, Add, Handshake, MenuHandler
	Menu, SubMenu10.4, Add, Handshake2, MenuHandler
	Menu, SubMenu10, Add, Handshakes, :SubMenu10.4

	Menu, SubMenu10.5, Add, Hug, MenuHandler
	Menu, SubMenu10.5, Add, Hug2, MenuHandler
	Menu, SubMenu10.5, Add, Hug3, MenuHandler
	Menu, SubMenu10, Add, Hugs, :SubMenu10.5

	Menu, SubMenu10.6, Add, Knock, MenuHandler
	Menu, SubMenu10.6, Add, Knock2, MenuHandler
	Menu, SubMenu10, Add, Knocking, :SubMenu10.6

	Menu, SubMenu10.7, Add, MindBlown, MenuHandler
	Menu, SubMenu10.7, Add, MindBlown2, MenuHandler
	Menu, SubMenu10, Add, Mind blown, :SubMenu10.7

	Menu, SubMenu10.8, Add, No, MenuHandler
	Menu, SubMenu10.8, Add, No2, MenuHandler
	Menu, SubMenu10.8, Add, NoWay, MenuHandler
	Menu, SubMenu10.8, Add, NoWay2, MenuHandler
	Menu, SubMenu10.8, Add, NoWay3, MenuHandler
	Menu, SubMenu10, Add, No, :SubMenu10.8

	Menu, SubMenu10.9, Add, Ok, MenuHandler
	Menu, SubMenu10.9, Add, Ok2, MenuHandler
	Menu, SubMenu10.9, Add, Yeah, MenuHandler
	Menu, SubMenu10, Add, Ok, :SubMenu10.9

	Menu, SubMenu10.10, Add, Photo, MenuHandler
	Menu, SubMenu10.10, Add, Photo2, MenuHandler
	Menu, SubMenu10, Add, Photo, :SubMenu10.10

	Menu, SubMenu10.11, Add, Point, MenuHandler
	Menu, SubMenu10.11, Add, PointDown, MenuHandler
	Menu, SubMenu10.11, Add, PointRight, MenuHandler
	Menu, SubMenu10, Add, Pointing, :SubMenu10.11

	Menu, SubMenu10.12, Add, Salute, MenuHandler
	Menu, SubMenu10.12, Add, Salute2, MenuHandler
	Menu, SubMenu10.12, Add, Salute3, MenuHandler
	Menu, SubMenu10.12, Add, Salute4, MenuHandler
	Menu, SubMenu10, Add, Salute, :SubMenu10.12

	Menu, SubMenu10.13, Add, Shrug, MenuHandler
	Menu, SubMenu10.13, Add, Shrug2, MenuHandler
	Menu, SubMenu10, Add, Shrug, :SubMenu10.13

	Menu, SubMenu10.14, Add, Smell, MenuHandler
	Menu, SubMenu10.14, Add, Stink, MenuHandler
	Menu, SubMenu10.14, Add, Stink2, MenuHandler
	Menu, SubMenu10, Add, Smell/Stink, :SubMenu10.14

	Menu, SubMenu10.15, Add, ThumbsDown, MenuHandler
	Menu, SubMenu10.15, Add, ThumbsDown2, MenuHandler
	Menu, SubMenu10, Add, Thumbs down, :SubMenu10.15

	Menu, SubMenu10.16, Add, ThumbsUp, MenuHandler
	Menu, SubMenu10.16, Add, ThumbsUp2, MenuHandler
	Menu, SubMenu10.16, Add, ThumbsUp3, MenuHandler
	Menu, SubMenu10.16, Add, ThumbsUp4, MenuHandler
	Menu, SubMenu10.16, Add, ThumbsUp5, MenuHandler
	Menu, SubMenu10.16, Add, ThumbsUp6, MenuHandler
	Menu, SubMenu10, Add, Thumbs up, :SubMenu10.16

	Menu, SubMenu10.17, Add, Wave, MenuHandler
	Menu, SubMenu10.17, Add, Wave2, MenuHandler
	Menu, SubMenu10.17, Add, Wave3, MenuHandler
	Menu, SubMenu10.17, Add, Wave4, MenuHandler
	Menu, SubMenu10.17, Add, Wave5, MenuHandler
	Menu, SubMenu10.17, Add, Wave6, MenuHandler
	Menu, SubMenu10.17, Add, Wave7, MenuHandler
	Menu, SubMenu10.17, Add, Wave8, MenuHandler
	Menu, SubMenu10.17, Add, Wave9, MenuHandler
	Menu, SubMenu10.17, Add, Wave10, MenuHandler
	Menu, SubMenu10.17, Add, Wave11, MenuHandler
	Menu, SubMenu10.17, Add, Wave12, MenuHandler
	Menu, SubMenu10.17, Add, Wave13, MenuHandler
	Menu, SubMenu10.17, Add, Wave14, MenuHandler
	Menu, SubMenu10, Add, Wave, :SubMenu10.17

	Menu, SubMenu10.18, Add, What, MenuHandler
	Menu, SubMenu10.18, Add, What2, MenuHandler
	Menu, SubMenu10, Add, What, :SubMenu10.18

	Menu, SubMenu10.19, Add, Whistle, MenuHandler
	Menu, SubMenu10.19, Add, Whistle2, MenuHandler
	Menu, SubMenu10.19, Add, Taxi, MenuHandler
	Menu, SubMenu10, Add, Whistles, :SubMenu10.19

	Menu, SubMenu10.20, Add, BlowKiss, MenuHandler
	Menu, SubMenu10.20, Add, Boi, MenuHandler
	Menu, SubMenu10.20, Add, ComeHere, MenuHandler
	Menu, SubMenu10.20, Add, Greeting, MenuHandler
	Menu, SubMenu10.20, Add, Inspect, MenuHandler
	Menu, SubMenu10.20, Add, KeyFob, MenuHandler
	Menu, SubMenu10.20, Add, Lift, MenuHandler
	Menu, SubMenu10.20, Add, Me, MenuHandler
	Menu, SubMenu10.20, Add, Petting, MenuHandler
	Menu, SubMenu10.20, Add, PickUp, MenuHandler
	Menu, SubMenu10.20, Add, PullOver, MenuHandler
	Menu, SubMenu10.20, Add, ThankYou, MenuHandler
	Menu, SubMenu10.20, Add, WashFace, MenuHandler
	Menu, SubMenu10, Add, Other, :SubMenu10.20

	Menu, FullMenuAnim, Add, Interaction, :SubMenu10

	Menu, SubMenu11.1, Add, CashRain, MenuHandler
	Menu, SubMenu11.1, Add, CashRain2, MenuHandler
	Menu, SubMenu11, Add, Cash rain, :SubMenu11.1

	Menu, SubMenu11.2, Add, FingerKiss, MenuHandler
	Menu, SubMenu11.2, Add, FingerKiss2, MenuHandler
	Menu, SubMenu11, Add, Finger kiss, :SubMenu11.2

	Menu, SubMenu11.3, Add, Lapdance, MenuHandler
	Menu, SubMenu11.3, Add, Lapdance2, MenuHandler
	Menu, SubMenu11.3, Add, Lapdance3, MenuHandler
	Menu, SubMenu11.3, Add, Lapdance4, MenuHandler
	Menu, SubMenu11, Add, Lapdance, :SubMenu11.3

	Menu, SubMenu11.4, Add, Twerk, MenuHandler
	Menu, SubMenu11.4, Add, Twerk2, MenuHandler
	Menu, SubMenu11, Add, Twerk, :SubMenu11.4

	Menu, SubMenu11, Add, Hooker, MenuHandler
	Menu, SubMenu11, Add, WatchStrip, MenuHandler

	Menu, FullMenuAnim, Add, Stripclub, :SubMenu11

	Menu, SubMenu12.1, Add, Cheer, MenuHandler
	Menu, SubMenu12.1, Add, Cheer2, MenuHandler
	Menu, SubMenu12.1, Add, Cheer3, MenuHandler
	Menu, SubMenu12.1, Add, DanceCheer, MenuHandler
	Menu, SubMenu12.1, Add, DanceCheer2, MenuHandler
	Menu, SubMenu12.1, Add, DanceCheer3, MenuHandler
	Menu, SubMenu12.1, Add, RallyCheer, MenuHandler
	Menu, SubMenu12, Add, (Dance) Cheer, :SubMenu12.1

	Menu, SubMenu12.2, Add, Slide, MenuHandler
	Menu, SubMenu12.2, Add, Slide2, MenuHandler
	Menu, SubMenu12.2, Add, Slide3, MenuHandler
	Menu, SubMenu12, Add, Slide, :SubMenu12.2

	Menu, SubMenu12.3, Add, SlowClap, MenuHandler
	Menu, SubMenu12.3, Add, ClapAngry, MenuHandler
	Menu, SubMenu12, Add, Clapping, :SubMenu12.3

	Menu, SubMenu12, Add, Celebrate, MenuHandler
	Menu, SubMenu12, Add, Countdown, MenuHandler

	Menu, FullMenuAnim, Add, Cheer/Celebrate, :SubMenu12

	Menu, SubMenu13.1, Add, Chicken, MenuHandler
	Menu, SubMenu13.1, Add, Chicken2, MenuHandler
	Menu, SubMenu13, Add, Chicken, :SubMenu13.1


	Menu, SubMenu13.2, Add, ChinBrush, MenuHandler
	Menu, SubMenu13.2, Add, ChinBrush2, MenuHandler
	Menu, SubMenu13, Add, Chin brush, :SubMenu13.2

	Menu, SubMenu13, Add, ComeAtMeBro, MenuHandler

	Menu, SubMenu13.3, Add, CryBaby, MenuHandler
	Menu, SubMenu13.3, Add, CryBaby2, MenuHandler
	Menu, SubMenu13, Add, Cry baby, :SubMenu13.3

	Menu, SubMenu13.4, Add, CutThroat, MenuHandler
	Menu, SubMenu13.4, Add, CutThroat2, MenuHandler
	Menu, SubMenu13, Add, Cut Throat, :SubMenu13.4

	Menu, SubMenu13.5, Add, Dock, MenuHandler
	Menu, SubMenu13.5, Add, Dock2, MenuHandler
	Menu, SubMenu13, Add, Dock, :SubMenu13.5

	Menu, SubMenu13.6, Add, Finger, MenuHandler
	Menu, SubMenu13.6, Add, Finger2, MenuHandler
	Menu, SubMenu13, Add, Finger, :SubMenu13.6

	Menu, SubMenu13.7, Add, FlipOff, MenuHandler
	Menu, SubMenu13.7, Add, FlipOff2, MenuHandler
	Menu, SubMenu13.7, Add, FlipOff3, MenuHandler
	Menu, SubMenu13.7, Add, FlipOff4, MenuHandler
	Menu, SubMenu13, Add, Flip off, :SubMenu13.7

	Menu, SubMenu13, Add, ScrewYou, MenuHandler

	Menu, SubMenu13.8, Add, Shush, MenuHandler
	Menu, SubMenu13.8, Add, Shush2, MenuHandler
	Menu, SubMenu13, Add, Shush, :SubMenu13.8

	Menu, SubMenu13.9, Add, SlowClap2, MenuHandler
	Menu, SubMenu13.9, Add, SlowClap3, MenuHandler
	Menu, SubMenu13, Add, Slow clap, :SubMenu13.9

	Menu, SubMenu13.10, Add, ThumbOnEars, MenuHandler
	Menu, SubMenu13.10, Add, ThumbOnEars2, MenuHandler
	Menu, SubMenu13, Add, Thumbs on ears, :SubMenu13.10

	Menu, SubMenu13.11, Add, ThumbsDown, MenuHandler
	Menu, SubMenu13.11, Add, ThumbsDown2, MenuHandler
	Menu, SubMenu13, Add, Thumbs down, :SubMenu13.11

	Menu, SubMenu13, Add, Wank, MenuHandler

	Menu, FullMenuAnim, Add, Mocking, :SubMenu13

	Menu, SubMenu14.1, Add, Photo, MenuHandler
	Menu, SubMenu14.1, Add, Photo2, MenuHandler
	Menu, SubMenu14, Add, Make photo's, :SubMenu14.1

	Menu, SubMenu14, Add, Radio, MenuHandler

	Menu, SubMenu14.2, Add, Computer, MenuHandler
	Menu, SubMenu14.2, Add, Type, MenuHandler
	Menu, SubMenu14.2, Add, Type2, MenuHandler
	Menu, SubMenu14.2, Add, Type3, MenuHandler
	Menu, SubMenu14.2, Add, Type4, MenuHandler
	Menu, SubMenu14, Add, Type, :SubMenu14.2

	Menu, FullMenuAnim, Add, Work, :SubMenu14

	Menu, SubMenu15.1, Add, CPR, MenuHandler
	Menu, SubMenu15.1, Add, CPR2, MenuHandler
	Menu, SubMenu15, Add, CPR, :SubMenu15.1

	Menu, SubMenu15.2, Add, FallOver, MenuHandler
	Menu, SubMenu15.2, Add, FallOver2, MenuHandler
	Menu, SubMenu15.2, Add, FallOver3, MenuHandler
	Menu, SubMenu15.2, Add, FallOver4, MenuHandler
	Menu, SubMenu15.2, Add, FallOver5, MenuHandler
	Menu, SubMenu15, Add, Falling over, :SubMenu15.2

	Menu, SubMenu15, Add, Inspect, MenuHandler
	Menu, SubMenu15, Add, Medic, MenuHandler

	Menu, SubMenu15.3, Add, PassOut, MenuHandler
	Menu, SubMenu15.3, Add, PassOut2, MenuHandler
	Menu, SubMenu15.3, Add, PassOut3, MenuHandler
	Menu, SubMenu15.3, Add, PassOut4, MenuHandler
	Menu, SubMenu15.3, Add, PassOut5, MenuHandler
	Menu, SubMenu15, Add, Passing out, :SubMenu15.3

	Menu, SubMenu15.4, Add, Crawl, MenuHandler
	Menu, SubMenu15.4, Add, LayingPain, MenuHandler
	Menu, SubMenu15.4, Add, Shot, MenuHandler
	Menu, SubMenu15, Add, Pain on ground, :SubMenu15.4

	Menu, SubMenu15.5, Add, Slumped, MenuHandler
	Menu, SubMenu15.5, Add, Slumped2, MenuHandler
	Menu, SubMenu15, Add, Slumped, :SubMenu15.5

	Menu, FullMenuAnim, Add, Medical/Injuries, :SubMenu15

	Menu, SubMenu16, Add, Drink, MenuHandler
	Menu, SubMenu16, Add, Eat, MenuHandler

	Menu, FullMenuAnim, Add, Food/Drink, :SubMenu16

	Menu, SubMenu17.1, Add, Flip, MenuHandler
	Menu, SubMenu17.1, Add, Flip2, MenuHandler
	Menu, SubMenu15, Add, Flip, :SubMenu17.1

	Menu, SubMenu17.2, Add, Jog, MenuHandler
	Menu, SubMenu17.2, Add, Jog2, MenuHandler
	Menu, SubMenu17.2, Add, Jog3, MenuHandler
	Menu, SubMenu17.2, Add, Jog4, MenuHandler
	Menu, SubMenu17, Add, Jogging, :SubMenu17.2

	Menu, SubMenu17.3, Add, Karate, MenuHandler
	Menu, SubMenu17.3, Add, Karate2, MenuHandler
	Menu, SubMenu17, Add, Karate, :SubMenu17.3

	Menu, SubMenu17.4, Add, Push, MenuHandler
	Menu, SubMenu17.4, Add, Push2, MenuHandler
	Menu, SubMenu17, Add, Push, :SubMenu17.4

	Menu, SubMenu17.5, Add, SitUp, MenuHandler
	Menu, SubMenu17.5, Add, SitUps, MenuHandler
	Menu, SubMenu17.5, Add, SitUps2, MenuHandler
	Menu, SubMenu17, Add, Sit ups, :SubMenu17.5

	Menu, SubMenu17.6, Add, Stretch, MenuHandler
	Menu, SubMenu17.6, Add, Stretch2, MenuHandler
	Menu, SubMenu17.6, Add, Stretch3, MenuHandler
	Menu, SubMenu17.6, Add, Stretch4, MenuHandler
	Menu, SubMenu17.6, Add, Stretch5, MenuHandler
	Menu, SubMenu17, Add, Stretching, :SubMenu17.6

	Menu, SubMenu17.7, Add, Yoga, MenuHandler
	Menu, SubMenu17.7, Add, Yoga2, MenuHandler
	Menu, SubMenu17.7, Add, Yoga3, MenuHandler
	Menu, SubMenu17.7, Add, Yoga4, MenuHandler
	Menu, SubMenu17.7, Add, Yoga5, MenuHandler
	Menu, SubMenu17, Add, Yoga, :SubMenu17.7

	Menu, SubMenu17.8, Add, GolfSwing, MenuHandler
	Menu, SubMenu17.8, Add, Hiking, MenuHandler
	Menu, SubMenu17.8, Add, JumpingJacks, MenuHandler
	Menu, SubMenu17.8, Add, OutOfBreath, MenuHandler
	Menu, SubMenu17.8, Add, PressUps, MenuHandler
	Menu, SubMenu17.8, Add, PushUp, MenuHandler
	Menu, SubMenu17.8, Add, Pull, MenuHandler
	Menu, SubMenu17.8, Add, PullUp, MenuHandler
	Menu, SubMenu17.8, Add, Punching, MenuHandler
	Menu, SubMenu17.8, Add, Slugger, MenuHandler
	Menu, SubMenu17, Add, Other, :SubMenu17.8

	Menu, FullMenuAnim, Add, Sports/Tricks, :SubMenu17

	Menu, SubMenu18, Add, Inspect, MenuHandler
	Menu, SubMenu18, Add, KeyFob, MenuHandler

	Menu, SubMenu18.1, Add, Mechanic, MenuHandler
	Menu, SubMenu18.1, Add, Mechanic2, MenuHandler
	Menu, SubMenu18.1, Add, Mechanic3, MenuHandler
	Menu, SubMenu18.1, Add, Mechanic4, MenuHandler
	Menu, SubMenu18.1, Add, Mechanic5, MenuHandler
	Menu, SubMenu18, Add, Mechanic, :SubMenu18.1

	Menu, FullMenuAnim, Add, Mechanic, :SubMenu18

	Menu, SubMenu19, Add, BlowKiss, MenuHandler

	Menu, SubMenu19.1, Add, Dock, MenuHandler
	Menu, SubMenu19.1, Add, Dock2, MenuHandler
	Menu, SubMenu19, Add, Dock, :SubMenu19.1

	Menu, SubMenu19.2, Add, Finger, MenuHandler
	Menu, SubMenu19.2, Add, Finger2, MenuHandler
	Menu, SubMenu19, Add, Finger, :SubMenu19.2

	Menu, SubMenu19.3, Add, FingerKiss, MenuHandler
	Menu, SubMenu19.3, Add, FingerKiss2, MenuHandler
	Menu, SubMenu19, Add, Finger kiss, :SubMenu19.3


	Menu, SubMenu19.4, Add, FlipOff, MenuHandler
	Menu, SubMenu19.4, Add, FlipOff2, MenuHandler
	Menu, SubMenu19.4, Add, FlipOff3, MenuHandler
	Menu, SubMenu19.4, Add, FlipOff4, MenuHandler
	Menu, SubMenu19, Add, Flipping off, :SubMenu19.4

	Menu, SubMenu19.5, Add, Gang, MenuHandler
	Menu, SubMenu19.5, Add, Gang2, MenuHandler
	Menu, SubMenu19, Add, Gang, :SubMenu19.5

	Menu, SubMenu19.6, Add, Loco, MenuHandler
	Menu, SubMenu19.6, Add, Loco2, MenuHandler
	Menu, SubMenu19, Add, Loco, :SubMenu19.6

	Menu, SubMenu19, Add, Me, MenuHandler
	Menu, SubMenu19, Add, Metal, MenuHandler
	Menu, SubMenu19, Add, Rock, MenuHandler

	Menu, SubMenu19.7, Add, MindBlown, MenuHandler
	Menu, SubMenu19.7, Add, MindBlown2, MenuHandler
	Menu, SubMenu19, Add, Mind Blown, :SubMenu19.7

	Menu, SubMenu19.8, Add, Peace, MenuHandler
	Menu, SubMenu19.8, Add, Peace2, MenuHandler
	Menu, SubMenu19.8, Add, Peace3, MenuHandler
	Menu, SubMenu19.8, Add, Peace4, MenuHandler
	Menu, SubMenu19, Add, Peace, :SubMenu19.8

	Menu, SubMenu19.9, Add, Shush, MenuHandler
	Menu, SubMenu19.9, Add, Shush2, MenuHandler
	Menu, SubMenu19, Add, Shush, :SubMenu19.9

	Menu, SubMenu19.10, Add, V, MenuHandler
	Menu, SubMenu19.10, Add, V2, MenuHandler
	Menu, SubMenu19, Add, V, :SubMenu19.10

	Menu, FullMenuAnim, Add, Gestures/signs, :SubMenu19

	Menu, FullMenu, Add, Animations, :FullMenuAnim

	Menu, FullMenu, Add, Exit application, ExitApplication

	CoordMode, Menu, Screen
	Menu, FullMenu, Show, % A_ScreenWidth/2, % A_ScreenHeight/2
return


;Handler for animations
MenuHandler:
	WinActivate, ahk_exe %Application%
	send, t/anim %A_ThisMenuItem% {enter}
return

;Vehicle spawn handlers
SpawnCrownVic:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn " Vehicle_CrownVic, True)
return

SpawnBuffalo:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn " Vehicle_Buffalo, True)
return

SpawnInterceptor:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn " Vehicle_Interceptor, True)
return

SpawnScout:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn " Vehicle_Scout, True)
return

SpawnAlamo:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn " Vehicle_Alamo, True)
return

SpawnCaracara:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn " Vehicle_Caracara, True)
return

SpawnPoliceBike:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn policeb", True)
return

SpawnKamacho:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn " Vehicle_Kamacho, True)
return

SpawnDrafter:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn " Vehicle_Drafter, True)
return

SpawnHighspeed:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn " Vehicle_Highspeed, True)
return

SpawnUnmarkedCrownVic:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn police4", True)
return

SpawnUnmarkedBuffalo:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn fbi", True)
return

SpawnUnmarkedGranger:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn fbi2", True)
return

SpawnUnmarkedScout:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn policescout2", True)
return

SpawnUnmarkedAlamo:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn policealamo2", True)
return

SpawnUnmarkedCaracara:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn policecaracara2", True)
return

SpawnUnmarkedKamacho:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn policekamacho2", True)
return

SpawnRiot:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn riot", True)
return

SpawnTarv:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn policetarv", True)
return

SpawnBrickade:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn brickade", True)
return

SpawnBF400:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn BF400", True)
return

SpawnShinobi:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn shinobi", True)
return

SpawnRCV:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn riot2", True)
return

SpawnInsurgent:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn insurgent2", True)
return

SpawnMaverick:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn polmav", True)
return

SpawnBuzzard:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn buzzard2", True)
return

SpawnPredator:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn predator", True)
return

SpawnDinghy:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn dinghy", True)
return

SpawnVan:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn policet", True)
return

SpawnFlatbed:
	WinActivate, ahk_exe %Application%
	Paste("/fspawn flatbed", True)
return

ParkSpawn:
	WinActivate, ahk_exe %Application%
	Paste("/delcruiser", True)
	sleep 550
	send, t {up} {enter}
return

;Unit name handlers
RenameToLincolnUnit:
	WinActivate, ahk_exe %Application%
	Paste("/renameunit " LincolnCallsign, True)
	Sleep 550
	Paste("/rlow " BadgeNumber " renaming unit to " LincolnCallsign ".", True)
return

RenameToAdamUnit:
	WinActivate, ahk_exe %Application%
	Paste("/renameunit " AdamCallsign, True)
	Sleep 550
	Paste("/rlow " BadgeNumber " show me renaming unit to " AdamCallsign ".", True)
return

RenameToDavidUnit:
	WinActivate, ahk_exe %Application%
	Paste("/renameunit " DavidCallsign, True)
	Sleep 550
	Paste("/rlow " BadgeNumber " show me renaming unit to " DavidCallsign ".", True)
return

ResumeLincolnUnit:
	WinActivate, ahk_exe %Application%
	Paste("/leaveunit", True)
	Sleep 550
	Paste("/createunit " LincolnCallsign "", True)
	Sleep 550
	Paste("/rlow " BadgeNumber " show me continuing under " LincolnCallsign ".", True)
return

CustomUnit:
	InputBox, CallSign, Unit, Enter Callsign, , 250, 125
	if ErrorLevel {
		MsgBox, Cancel was pressed.
	} else if (CallSign="") {
		MsgBox, Input is empty.
	} else {
		if WinExist("ahk_exe GTA5.exe") {
			WinActivate
			sleep 450
			Paste("/disbandunit", True)
			Sleep 450
			Paste("/leaveunit", True)
			Sleep 450
			Paste("/joinunit " CallSign, True)
			Sleep 450
			Paste("/rlow " BadgeNumber " show me joining " CallSign, True)
		} else {
			MsgBox, , ERROR, Rage is not open!
		}
	}
return

RenameToAIR:
	WinActivate, ahk_exe %Application%
	Paste("/renameunit AIR-1", True)
	Sleep 550
	Paste("/rlow " BadgeNumber " show me continuing under AIR-1.", True)
return

RenameToTOM:
	WinActivate, ahk_exe %Application%
	Paste("/renameunit " SpecialCallsignTOM, True)
	Sleep 550
	Paste("/rlow " BadgeNumber " show me continuing under " SpecialCallsignTOM ".", True)
return

RenameToDAVID:
	WinActivate, ahk_exe %Application%
	Paste("/renameunit " SpecialCallsignDAVID, True)
	Sleep 550
	Paste("/rlow " BadgeNumber " show me continuing under " SpecialCallsignDAVID ".", True)
return

RenameToFLD:
	WinActivate, ahk_exe %Application%
	Paste("/renameunit FLD", True)
	Sleep 500
	Paste("/rlow " BadgeNumber " show me renaming unit to FLD.  10-9 at MRPD for paperwork.", True)
return

JoinFLD:
	WinActivate, ahk_exe %Application%
	Paste("/disbandunit", True)
	Sleep 450
	Paste("/joinunit FLD", True)
	Sleep 450
	Paste("/rlow " BadgeNumber " show me joining FLD.  10-9 at MRPD for paperwork.", True)
return

RenameToRED:
	WinActivate, ahk_exe %Application%
	Paste("/renameunit RED", True)
	Sleep 500
	Paste("/rlow " BadgeNumber " show me renaming unit to RED.  10-9 at MRPD for paperwork.", True)
return

JoinRED:
	WinActivate, ahk_exe %Application%
	Paste("/disbandunit", True)
	Sleep 450
	Paste("/joinunit RED", True)
	Sleep 450
	Paste("/rlow " BadgeNumber " show me joining RED.  10-9 at MRPD for paperwork.", True)
return

;Traffic stop handlers
PDHandCitation:
	WinActivate, ahk_exe %Application%
	Paste("/melow offers the citation to the driver", True)
return

PDIssueCitationHandler:
	Gui, Destroy
	Gui, Add, Text,, Enter Player ID:
	Gui, Add, Edit, w300 vPlayerID,
	Gui, Add, Text,, Citation Type:
	Gui, Add, DropdownList, w300 vCitationType, Select...||VC01 - Speeding 1st Degree|VC02 - Speeding 2nd Degree|VC03 - Speeding 3rd Degree|VC04 - Illegal Parking|VC05 - Improper Traffic Maneuvers|VC06 - Following or Impeding Emergency Response|VC07 - Operating a Vehicle Without a License on Your Person|VC08 - Negligent Operation of a Road or Marine Vehicle|VC09 - Blocking Intersection|VC10 - Unroadworthy Vehicle|VC11 - Failure to Pay a Toll|VC12 - Operating an Unregistered Vehicle|VC13 - Disruptive Impeding or Blocking Travel
	Gui, Add, Text,, General Citations:
	Gui, Add, DropdownList, w300 vGeneralCitationType, Select...||GC01 - Loitering|GC02 - Traffic Endangerment|GC03 - Disorderly Conduct|GC04 - Face Concealment|GC05 - Misuse of Government Public Safety Radio Frequencies or Hotlines|GC06 - Possession of Cannabis
	Gui, Add, Text,, Demerit?
	Gui, Add, DropdownList, w300 vDemeritSuspend, Select...||No|Yes|Demerit and Suspension
	Gui, Add, Text,, Type of License:
	Gui, Add, DropdownList, w300 vLicenseType, Select...||Driver|Driver and Trucker
	Gui, Add, Button, Default x80 gOk w80, Ok
	Gui, Add, Button, x+0 gCancel w80, Cancel
	Gui, Show,, Issue Citation RPly
	return

	Ok:
		Gui,Submit
		if WinExist("ahk_exe GTA5.exe"){
			WinActivate
			if ((DemeritSuspend="No" or DemeritSuspend="Select...") and CitationType!="Select...") {
				sleep 150
				Paste("/melow logs into the MDC and adds a """ CitationType """ to the individual's record", "True")
				sleep 1350
				Paste("/melow prints out the citation and grabs it from the printer", "True")
			} else if (DemeritSuspend="Yes" and CitationType!="Select...") {
				if (PlayerID!=""){
					sleep 150
					Paste("/melow logs into the MDC and adds a """ CitationType """ to the individual's record", "True")
					sleep 650
					Paste("/warndriver " PlayerID, "True")
					sleep 1100
					Paste("/melow adds a demerit to the driver's record", "True")
					sleep 1450
					Paste("/melow prints out the citation and grabs it from the printer", "True")
				} else {
					MsgBox,, ERROR, You must enter a player ID in order to issue a demerit!
				}
			} else if (DemeritSuspend="Demerit and Suspension" and CitationType!="Select...") {
				if (LicenseType="Driver" or LicenseType="Driver and Trucker") and (PlayerID!=""){
					sleep 150
					Paste("/melow logs into the MDC and adds a """ CitationType """ to the individual's record", "True")
					sleep 650
					Paste("/warndriver "PlayerID, "True")
					sleep 1100
					Paste("/melow adds a demerit to the driver's record", "True")
					sleep 750
					if (LicenseType="Driver"){
						Paste("/suspend " PlayerID " driver 1", "True")
						sleep 650
						Paste("/melow logs into the DMV database and issues a 24 hour suspension on the individual's driver's license", "True")
						sleep 1350
						Paste("/melow prints out the citation and grabs it from the printer", "True")
					} else if (LicenseType="Driver and Trucker"){
						Paste("/suspend " PlayerID " driver 1", "True")
						sleep 650
						Paste("/suspend " PlayerID " trucker 1", "True")
						sleep 650
						Paste("/melow logs into the DMV database and issues a 24 hour suspension on both the individual's driver's and trucker's license", "True")
						sleep 1350
						Paste("/melow prints out a citation and grabs it from the printer", "True")
					}
				} else if (PlayerID="") {
					MsgBox,, ERROR, You must enter a player ID in order to issue a suspension!
				} else {
					MsgBox,, ERROR, You must select a license type in order to issue a suspension!
				}
			} else if (GeneralCitationType!="Select...") {
				sleep 150
				Paste("/melow logs into the MDC and adds a """ GeneralCitationType """ citation to the individual's record", "True")
				sleep 1350
				Paste("/melow prints out a citation and grabs it from the printer", "True")
			} else {
				MsgBox,, ERROR, You must select a citation type!
			}
		} else {
		MsgBox, , ERROR, Rage is not open!
	}
	return
return

PDLicense:
	WinActivate, ahk_exe %Application%
	Paste("/melow looks at the ID without taking it", True)
return

TowVehicle:
	WinActivate, ahk_exe %Application%
	Paste("/melow opens the control panel, pulls down a lever, and lowers the ramp", True)
	Sleep, 3000
	Paste("/melow deploys the winch cables and securely attaches the cables to the front of the vehicle", True)
	Sleep, 3000
	Paste("/melow pulls another lever on the control panel and starts the winch", True)
	Sleep, 3000
	Paste("t/melow secures the vehicle by its tires to the flatbed and lifts the ramp", True)
Return

;Interdepartmental radio handlers
DRadio:
	InputBox, NumberInput, Unit, How many 10-15s?, , 250, 125
	if ErrorLevel{
		MsgBox,, ERROR, Cancel was pressed!
	}
	else if (NumberInput!=""){
		InputBox, MinInput, Unit, Estimated Time of Arrival, , 250, 125
		if ErrorLevel{
			MsgBox,, ERROR, Cancel was pressed!
		}
		else if (MinInput!="") {
			if WinExist("ahk_exe GTA5.exe"){
				WinActivate
				sleep 350
				if (MinInput > 1) {
					Paste("/deplow PD to DOC, en route with " NumberInput "x 10-15. ETA of " MinInput " minutes.  Are you able to receive?", True)
				} else {
					Paste("/deplow PD to DOC, en route with " NumberInput "x 10-15. ETA of " MinInput " minute.  Are you able to receive?", True)
				}
			} else {
				MsgBox, , ERROR, Rage is not open!
			}
		}
		else {
			MsgBox,, ERROR, You must input the ETA!
		}
	}
	else {
		MsgBox,, ERROR, You must input the number of 10-15s!
	}
Return

DRadioHVT:
	InputBox, NumberInput, Unit, How many 10-15s?, , 250, 125
	if ErrorLevel{
		MsgBox,, ERROR, Cancel was pressed!
	}
	else if (NumberInput!=""){
		InputBox, MinInput, Unit, Estimated Time of Arrival, , 250, 125
		if ErrorLevel{
			MsgBox,, ERROR, Cancel was pressed!
		}
		else if (MinInput!=""){
			if WinExist("ahk_exe GTA5.exe"){
				WinActivate
				sleep 350
				if (MinInput > 1) {
					Paste("/deplow PD to DOC, en route with " NumberInput "x 10-15 HVT through the gates. ETA of " MinInput " minutes.  Are you able to receive?", True)
				} else {
					Paste("/deplow PD to DOC, en route with " NumberInput "x 10-15 HVT through the gates. ETA of " MinInput " minute.  Are you able to receive?", True)
				}
			} else {
				MsgBox, , ERROR, Rage is not open!
			}
		}
		else {
			MsgBox,, ERROR, You must input the ETA!
		}
	}
	else {
		MsgBox,, ERROR, You must input the number of 10-15s!
	}
Return

DRadioMDPris:
	send, t/backup FOR MD{enter}
	Sleep 2000
	InputBox, NumberInput, Unit, How many injured 10-15s?, , 250, 125
	if ErrorLevel{
		MsgBox,, ERROR, Cancel was pressed!
	}
	else if (NumberInput!=""){
		InputBox, BackupNumber, Unit, Backup number?, , 250, 125
		if ErrorLevel{
			MsgBox,, ERROR, Cancel was pressed!
		}
		else if (BackupNumber!=""){
			if WinExist("ahk_exe GTA5.exe"){
				WinActivate
				sleep 350
				Paste("deplow PD to MD, " NumberInput "x injured 10-15 at " BackupNumber ". Are you able to assist?", True)
			} else {
				MsgBox, , ERROR, Rage is not open!
			}
		}
		else {
			MsgBox,, ERROR, You must input the backup number!
		}
	}
	else {
		MsgBox,, ERROR, You must input the number of injured 10-15s!
	}
return

DRadioPDtoDOC:
	WinActivate, ahk_exe %Application%
	Paste("/deplow PD to DOC, how copy?", True)
return

DRadioPDtoMD:
	WinActivate, ahk_exe %Application%
	Paste("/deplow PD to MD, how copy?", True)
return

;Scene management handlers
PDGrabBarriers:
	WinActivate, ahk_exe %Application%
	Paste("/melow grabs some barriers from the trunk of the cruiser, placing them under " sex_2 " arms", True)
return

PDGatherBarriers:
	WinActivate, ahk_exe %Application%
	Paste("/melow gathers all the blockades one by one and places them under " sex_2 " arms", True)
	Sleep 250
	Paste("/RemoveAllBlockades", True)
return

PDStoreBarriers:
	WinActivate, ahk_exe %Application%
	Paste("/melow places the barriers in the trunk of the cruiser", True)
return

PDGrabBLS:
	WinActivate, ahk_exe %Application%
	Paste("/melow grabs a BLS kit from the trunk of the cruiser", True)
return

PDInitialBLS:
	WinActivate, ahk_exe %Application%
	Paste("/anim medic", True)
	Sleep 250
	Paste("/melow sets the BLS kit on the groud and begins looking over the individual's injuries", True)
	Sleep 450
	Paste("/dolow What would " sex_1 " see?", True)
return

PDGrabBodyBag:
	WinActivate, ahk_exe %Application%
	Paste("/melow grabs a body bag from the trunk of the cruiser", True)
return

PDLoadIntoBodyBag:
	WinActivate, ahk_exe %Application%
	Paste("/melow sets the body bag next to the body and unzips it", True)
	Sleep 650
	Paste("/melow rolls the body over into the body bag, ensuring the head, arms, and feet are all clear of the zipper", True)
	Sleep 950
	Paste("/melow zips up the body bag", True)
return

;Prisoner processing and arrest handlers

PDCuff:
	WinActivate, ahk_exe %Application%
	Paste("/melow grabs a pair of cuffs from " sex_2 " duty belt and attempts to put them around the individual's wrists", True)
return

PDUncuff:
	WinActivate, ahk_exe %Application%
	Paste("/melow takes the handcuff key from my duty belt and attempts to uncuff the individual", True)
return

PDFrisk:
	WinActivate, ahk_exe %Application%
	Paste("/melow puts on a pair of non-latex gloves and attempts to frisk the individual", True)
return

PDLicenseFrisk:
	WinActivate, ahk_exe %Application%
	Paste("/melow attempts to locate an ID", True)
	Sleep 500
	Paste("/dolow Would " sex_1 " find one?", True)
return

PDKeyFrisk:
	WinActivate, ahk_exe %Application%
	Paste("/melow attempts to locate a set of keys", True)
	Sleep 500
	Paste("/dolow would " sex_1 " find any?", True)
return

PDUnlockCuffedCar:
	WinActivate, ahk_exe %Application%
	Paste("/melow takes the keys out, clicks the unlock button and puts them back where they were", True)
return

PDLicenseCuff:
	WinActivate, ahk_exe %Application%
	Paste("/melow takes out the license, carefully reading it over and puts it back where it was", True)
return

PDReleaseForm:
	WinActivate, ahk_exe %Application%
	Paste("/melow takes a pen out from " sex_2 " breast pocket and flips through the prisoner transfer forms", True)
	Sleep 650
	Paste("/melow finds a blank prisoner transfer form and signs it", True)
return

PDMugshot:
	WinActivate, ahk_exe %Application%
	send, {F7}
	Sleep 450
	send, {F8}
	Sleep 350
	send, {F7}
	Sleep 450
	Paste("/record", True)
	Sleep 450
	Paste("/melow takes a mugshot of the individual and uploads it to the PD database", True)
	Sleep 1200
	Paste("/dolow The upload would be successful", True)
	Sleep 450
	Paste("/record", True)
return

PDFingerprints:
	WinActivate, ahk_exe %Application%
	send, t/collectprints 
	KeyWait, Enter, d
	{
		Sleep 450
		send, t/melow takes each of the fingers from their left hand and slowly rolls them over the scanner{enter}
		Sleep 2250
		send, t/melow checks the clarity of the fingerprints on the MDC before submitting{enter}
		Sleep 2150
		send, t/melow submits the left hand fingerprints in the MDC{enter}
		Sleep 1750
		send, t/dolow the prints would be clear enough to be accepted by the database{enter}
		Sleep 1750
		send, t/dolow the MDC would prompt to scan the right hand fingerprints{enter}
		Sleep 1550
		send, t/melow takes each of the fingers from their right hand and slowly rolls them over the scanner{enter}
		Sleep 1755
		send, t/melow checks the clarity of the fingerprints on the MDC before submitting{enter}
		Sleep 2550
		send, t/melow submits the right hand fingerprints in the MDC{enter}
		Sleep 1650
		send, t/dolow the prints would be clear enough to be accepted by the database{enter}
		Sleep 1150 
		send, t/melow uploads the prints to the database{enter}
		Sleep 750
		send, t/dolow the upload would be successful{enter}
	}
return

;Start and end watch handlers
StartWatch:
	WinActivate, ahk_exe %Application%
	Paste("/melow takes off " sex_2 " civilian clothes and puts them in their locker", True)
	Sleep 850
	Paste("/melow puts on " sex_2 " duty uniform", True)
	Sleep 850
	Paste("/melow grabs a body cam from the locker, afixes it to " sex_2 " chest and turns it on", True)
	Sleep 850
	Paste("/dolow the light would start blinking green", True)
	Sleep 850
	Paste("/time", True)
	Sleep 850
	Paste("/rlow " BadgeNumber " show me start of watch under " LincolnCallsign, True)
	Sleep 850
	Paste("/createunit " LincolnCallsign, True)
return

StartWatchAdam:
	WinActivate, ahk_exe %Application%
	Paste("/melow takes off " sex_2 " civilian clothes and puts them in their locker", True)
	Sleep 850
	Paste("/melow puts on " sex_2 " duty uniform", True)
	Sleep 850
	Paste("/melow grabs a body cam from the locker, afixes it to " sex_2 " chest and turns it on", True)
	Sleep 850
	Paste("/dolow the light would start blinking green", True)
	Sleep 850
	Paste("/time", True)
	Sleep 850
	Paste("/rlow " BadgeNumber " show me start of watch under " AdamCallsign, True)
	Sleep 850
	Paste("/createunit " AdamCallsign, True)
return

EndWatch:
	WinActivate, ahk_exe %Application%
	Paste("/rlow " BadgeNumber " is ending watch", True)
	Sleep 650
	Paste("/disbandunit", True)
	Sleep 550
	Paste("/leaveunit", True)
return

;Duty clothing handlers
DutyClothes:
	WinActivate, ahk_exe %Application%
	send, t/fl {enter}
	Sleep 350
	send, {enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 350
	send, {down}{enter}
	Sleep 350
	send, {up}{enter}
	Sleep 350
	send, {down 3}{enter}
	Sleep 350
	send, {down 4}{enter}
	Sleep 350
	send, {up 4}{enter}
	Sleep 350
	send, {down 4}{enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 350
	send, {up 2}{enter}
	Sleep 350
	send, {enter}
	Sleep 350
	send, {down}{enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 350
	send, {up 2}{enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 350
	send, {down}{enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 350
	send, {down 3}{enter}
	Sleep 350
	send, {down 4}{enter}
	Sleep 350 
	send, {Esc}
return

DutyRainClothes:
	WinActivate, ahk_exe %Application%
	send, t/fl{enter}
	Sleep 350
	send, {enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 350
	send, {down 8}{enter}
	Sleep 350
	send, {up 8}{enter}
	Sleep 350
	send, {down 3}{enter}
	Sleep 350
	send, {down 4}{enter}
	Sleep 350
	send, {up 4}{enter}
	Sleep 350
	send, {down 4}{enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 350
	send, {up 2}{enter}
	Sleep 350
	send, {enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 350
	send, {down}{enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 350
	send, {down 3}{enter}
	Sleep 350
	send, {down 4}{enter}
	Sleep 350
	send, {Esc}
return

DutyWinterClothes:
	WinActivate, ahk_exe %Application%
	send, t/fl{enter}
	Sleep 350
	send, {enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 250
	send, {down 7}{enter}
	Sleep 250
	send, {up 7}{enter}
	Sleep 250
	send, {down 3}{enter}
	Sleep 250
	send, {down 4}{enter}
	Sleep 250
	send, {up 4}{enter}
	Sleep 250
	send, {down 4}{enter}
	Sleep 250
	send, {down 2}{enter}
	Sleep 250
	send, {up 2}{enter}
	Sleep 350
	send, {enter}
	Sleep 250
	send, {down 2}{enter}
	Sleep 250
	send, {down}{enter}
	Sleep 250
	send, {down 2}{enter}
	Sleep 250
	send, {down 2}{enter}
	Sleep 250
	send, {down 3}{enter}
	Sleep 250
	send, {down 4}{enter}
	Sleep 350
	send, {Esc}
return

DutyCopilotClothes:
	WinActivate, ahk_exe %Application%
	send, t/fl{enter}
	Sleep 350
	send, {enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 250
	send, {down 7}{enter}
	Sleep 250
	send, {up 7}{enter}
	Sleep 250
	send, {down 3}{enter}
	Sleep 250
	send, {down 8}{enter}
	Sleep 250
	send, {down 4}{enter}
	Sleep 250
	send, {down 4}{enter}
	Sleep 250
	send, {down 2}{enter}
	Sleep 250
	send, {up 2}{enter}
	Sleep 250
	send, {enter}
	Sleep 250
	send, {down 2}{enter}
	Sleep 250
	send, {down}{enter}
	Sleep 250
	send, {down 2}{enter}
	Sleep 250
	send, {down 2}{enter}
	Sleep 250
	send, {down 5}{enter}
	Sleep 250
	send, {down 2}{enter}
	Sleep 350
	send, {Esc}
return

DutyFireExtinguisher:
	WinActivate, ahk_exe %Application%
	send, t/fl{enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 250
	send, {down 6}{enter}
	Sleep 250
	send, {up 6}{enter}
	Sleep 350
	send, {Esc}
return

DutyWeapons:
	WinActivate, ahk_exe %Application%
	send, t/fl{enter}
	Sleep 350
	send, {down 2}{enter}
	Sleep 250
	send, {down}{enter}
	Sleep 250
	send, {down 2}{enter}
	Sleep 250
	send, {down 2}{enter}
	Sleep 250
	send, {down 5}{enter}
	Sleep 250
	send, {down 2}{enter}
	Sleep 350
	send, {esc}
return

; Felony stop megaphone steps
FelonyStop1:
	WinActivate, ahk_exe %Application%
	Paste("/m Driver, take your keys out of the ignition and toss them out of the window.", True)
Return

FelonyStop2:
	WinActivate, ahk_exe %Application%
	Paste("/m Driver, place both hands outside of the window. Reach down and open the door with your right hand.", True)
Return

FelonyStop3:
	WinActivate, ahk_exe %Application%
	Paste("/m Driver, exit the vehicle slowly. No sudden movements and keep your hands in the air. Face away from us at all times.", True)
Return

FelonyStop4:
	WinActivate, ahk_exe %Application%
	Paste("/m Grab your shirt by the neck, lift it high, and turn around a full 360 so we can see your waistline.", True)
Return

FelonyStop5:
	WinActivate, ahk_exe %Application%
	Paste("/m Walk backwards towards my voice until you are told to stop.", True)
Return

;Pursuit megaphone
LethalPursuit:
	WinActivate, ahk_exe %Application%
	Paste("/m LSPD, STOP THE VEHICLE NOW OR FORCE MAY BE USED", True)
Return

ExitApplication:
	WinActivate, ahk_exe %Application%
	ExitApp
return

return

; ======================================================================================
; Function:       variablesFromIni
; Description     read all variables in an ini and store in variables
; Usage:          variablesFromIni(_SourcePath [, _ValueDelim = "=", _VarPrefixDelim = "_"])
; Parameters:
;  _SourcePath    	-  path to the ini file ["path\file.ini"]
;  _ValueDelim      -  This is the delimitator used for key 'delim' value function
;  _VarPrefixDelim 	-  This specifies the separator between section name and key name.
; 						All section names and key names are merged into single name.
; Return values:  
;     Variables from the ini, named after SECTION Delimiter KEY

variablesFromIni(_SourcePath, _ValueDelim = "=", _VarPrefixDelim = "_")
{
    Global
    if !FileExist(_SourcePath){
        MsgBox, 16, % "Error", % "The file " . _SourcePath . " does not esxist"
    } else {        
        Local FileContent, CurrentPrefix, CurrentVarName, CurrentVarContent, DelimPos
        FileRead, FileContent, %_SourcePath%
        If ErrorLevel = 0
        {
            Loop, Parse, FileContent, `n, `r%A_Tab%%A_Space%
            {
                If A_LoopField Is Not Space
                {
                    If (SubStr(A_LoopField, 1, 1) = "[")
                    {
                        RegExMatch(A_LoopField, "\[(.*)\]", ini_Section)
                        CurrentPrefix := ini_Section1
                    }
                    Else
                    {
                        DelimPos := InStr(A_LoopField, _ValueDelim)
                        CurrentVarName := SubStr(A_LoopField, 1, DelimPos - 1)
                        CurrentVarContent := SubStr(A_LoopField, DelimPos + 1)
                        %CurrentPrefix%%_VarPrefixDelim%%CurrentVarName% := "" CurrentVarContent ""
                        ;---- [Uncomment for variable name and value display]
                        ;MsgBox, , Title, %CurrentPrefix%%_VarPrefixDelim%%CurrentVarName% = %CurrentVarContent%
                    }
                    
                }
            }
        }
    }
}

hotkeysFromIni(_SourcePath, _ValueDelim = "=", _VarPrefixDelim = "_")
{
    Global
    if !FileExist(_SourcePath){
        MsgBox, 16, % "Error", % "The file " . _SourcePath . " does not esxist"
    } else {        
        Local FileContent, CurrentPrefix, CurrentVarName, CurrentVarContent, DelimPos
        FileRead, FileContent, %_SourcePath%
        If ErrorLevel = 0
        {
            Loop, Parse, FileContent, `n, `r%A_Tab%%A_Space%
            {
                If A_LoopField Is Not Space
                {
                    If (SubStr(A_LoopField, 1, 1) = "[")
                    {
                        RegExMatch(A_LoopField, "\[(.*)\]", ini_Section)
                        CurrentPrefix := ini_Section1
                    }
                    Else
                    {
                        DelimPos := InStr(A_LoopField, _ValueDelim)
                        CurrentVarName := SubStr(A_LoopField, 1, DelimPos - 1)
                        CurrentVarContent := SubStr(A_LoopField, DelimPos + 1)
                        %CurrentPrefix%%_VarPrefixDelim%%CurrentVarName%=%CurrentVarContent%
                        ;---- [Uncomment for variable name and value display]
                        ;MsgBox, , Title, %CurrentPrefix%%_VarPrefixDelim%%CurrentVarName% = %CurrentVarContent%
                    }
                    
                }
            }
        }
    }
}

; ==================================================================
; Function: 			Paste
; Description			Pastes text into the chatbox, rather than typing each individual letter
; Usage:				Paste("ClipIt", Ent)
; Parameters:
;  ClipIt			-	Text to paste into the chatbox
;  sEnter			-	Boolean; whether or not to press enter after text is pasted
;
; Return values:
; 	Null

Paste(ClipIt, Ent)
{
	ClipBoard := ClipIt
	send, t
	sleep, 15
	send, ^v
	if ( Ent )
	{
		sleep, 15
		send, {enter}
	}
	sleep, 5
	send, {rctrl up}
	sleep, 5
	send, {lctrl up}
	return
}
