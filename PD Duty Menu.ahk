#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetKeyDelay, 1
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

;These are the global variables that you will need to change.  All should be self explanitory.  

global LincolnCallsign := "21-L-12"
global AdamCallsign := "21-A-12"
global SpecialCallsign := "FLD"
global BadgeNumber := "12345"

;opens the mini MDC.  If your ctrl button gets stuck or you cannot press the windows key, remove this.  Causes some issues on some keyboards.  No known fix for now.

NumpadAdd::
	sleep, 150
	send, {LCtrl down}
	send, {M down}
	sleep, 50
	send, {LCtrl Up}
	send, {M up}
	sleep 150
	send, {F7}
	sleep 50
	send, {F7}
return

;self explanitory

F9::
	send, t/vr 1{enter}
return

;self explanitory

F10::
	send, t/setcall -1{enter}
return

;sets mouse button 5 to send p so you can use the phone button for TAC

XButton2::p

;change this button to whatever you want to open your menu.  I found that F3 is the best, due to its position and not being used by the game.
F3::

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Menu, SubMenu24, Add, Start Watch, StartWatch
Menu, SubMenu24, Add, Start Adam Watch, StartWatchAdam
Menu, SubMenu24, Add, End Watch, EndWatch
Menu, FullMenu, Add, Start/End Watch, :SubMenu24

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Menu, SubMenu21, Add, Rename to %LincolnCallsign%, LincolnUnit
Menu, SubMenu21, Add, Rename to %AdamCallsign%, AdamUnit
Menu, SubMenu21, Add, Rename to %SpecialCallsign%, RenameSpecialCallsign
Menu, SubMenu21, Add, Join %SpecialCallsign%, JoinSpecialCallsign
Menu, SubMenu21, Add, Resume Lincoln, ResumeLincolnUnit
Menu, SubMenu21, Add, Custom, CustomUnit

Menu, FullMenu, Add, Change Unit, :SubMenu21

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Menu, SubMenu27, Add, Default Clothing, DutyClothes
Menu, SubMenu27, Add, Copilot Clothing, DutyCopilotClothes
Menu, SubMenu27, Add, Rain Clothing, DutyRainClothes
Menu, Submenu27, Add, Winter Clothing, DutyWinterClothes

Menu, SubMenu27.1, Add, Fire Extinguisher, DutyFireExtinguisher
Menu, SubMenu27.1, Add, Default Weapons, DutyWeapons
Menu, SubMenu27, Add, Weapons, :SubMenu27.1

Menu, FullMenu, Add, Duty Clothing, :SubMenu27

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Menu, SubMenu20, Add, Stainer, SpawnCrownVic
Menu, SubMenu20, Add, Buffalo, SpawnBuffalo
Menu, SubMenu20, Add, Interceptor, SpawnInterceptor
Menu, SubMenu20, Add, Scout, SpawnScout
Menu, SubMenu20, Add, Transport Van, SpawnVan
Menu, SubMenu20, Add, Flatbed, SpawnFlatbed
Menu, SubMenu20, Add, Park Cruiser, ParkSpawn

Menu, FullMenu, Add, Police Vehicles, :SubMenu20

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Menu, TrafficStop, Add, View License, PDLicense
Menu, TrafficStop, Add, Issue Citation, PDIssueCitationHandler
Menu, TrafficStop, Add, Hand Citation, PDHandCitation
Menu, FullMenuMe, Add, Traffic Stop, :TrafficStop

Menu, FelonyStop, Add, Step 1: Toss keys from ignition, FelonyStop1
Menu, FelonyStop, Add, Step 2: Open vehicle door slowly, FelonyStop2
Menu, FelonyStop, Add, Step 3: Step out, FelonyStop3
Menu, FelonyStop, Add, Step 4: Full 360, FelonyStop4
Menu, FelonyStop, Add, Step 5: Walk backwards, FelonyStop5
Menu, FullMenuMe, Add, Felony Stop, :FelonyStop

Menu, ArrestMenu, Add, Cuff, PDCuff
Menu, ArrestMenu, Add, Uncuff, PDUncuff
Menu, ArrestMenu, Add, Frisk, PDFrisk
Menu, ArrestMenu, Add, Frisk for License, PDLicenseFrisk
Menu, ArrestMenu, Add, Frisk for Keys, PDKeyFrisk
Menu, ArrestMenu, Add, Unlock Cuffed Person's Car, PDUnlockCuffedCar
Menu, ArrestMenu, Add, View Cuffed License, PDLicenseCuff
Menu, FullMenuMe, Add, Arrest, :ArrestMenu

Menu, SceneMenu, Add, Grab Barriers, PDGrabBarriers
Menu, SceneMenu, Add, Gather All Barriers, PDGatherBarriers
Menu, SceneMenu, Add, Store Barriers, PDStoreBarriers
Menu, SceneMenu, Add, Grab BLS Kit, PDGrabBLS
Menu, SceneMenu, Add, Initial BLS, PDInitialBLS
Menu, SceneMenu, Add, Grab Body Bag, PDGrabBodyBag
Menu, SceneMenu, Add, Load Into Body Bag, PDLoadIntoBodyBag
Menu, FullMenuMe, Add, Scene Management, :SceneMenu

Menu, InmatePro, Add, Uncuff, PDUncuff
Menu, InmatePro, Add, Release form, PDReleaseForm
Menu, InmatePro, Add, Mugshot, PDMugshot
Menu, InmatePro, Add, Fingerprints, PDFingerprints
Menu, FullMenuMe, Add, Inmate Processing, :InmatePro

Menu, FullMenuMe, Add, Tow Vehicle, TowVehicle

Menu, FullMenu, Add, Traffic Stop/Arrest Procedure, :FullMenuMe

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
	send, t/anim %A_ThisMenuItem% {enter}
return

;Vehicle spawn handlers
SpawnCrownVic:
	send, t/fspawn police 5 {enter}
return

SpawnBuffalo:
	send, t/fspawn police2 5 {enter}
return

SpawnInterceptor:
	send, t/fspawn police3 5 {enter}
return

SpawnScout:
	send, t/fspawn policescout {enter}
return

SpawnVan:
	send, t/fspawn policet {enter}
return

SpawnFlatbed:
	send, t/fspawn flatbed {enter}
return

ParkSpawn:
	send, t/delcruiser {enter}
	sleep 450
	send, t {up} {enter}
return

;Unit name handlers
LincolnUnit:
	send, t/renameunit %LincolnCallsign% {enter}
	Sleep 500
	send, t/r %BadgeNumber% show me renaming unit to %LincolnCallsign% {enter}
return

AdamUnit:
	send, t/renameunit %AdamCallsign% {enter}
	Sleep 500
	send, t/r %BadgeNumber% show me renaming unit to %AdamCallsign% {enter}
return

ResumeLincolnUnit:
	send, t/leaveunit {enter}
	Sleep 500
	send, t/createunit %LincolnCallsign% {enter}
	Sleep 500
	send, t/r %BadgeNumber% show me leaving unit and continuing under %LincolnCallsign% {enter}
return

CustomUnit:
	InputBox, CallSign, Unit, Enter Callsign, , 250, 125
	if ErrorLevel{
		MsgBox, Cancel was pressed.
	}
	else if (CallSign=""){
		MsgBox, Input is empty.
	}
	else{
		send, t/disbandunit {enter}
		Sleep 350
		send, t/leaveunit {enter}
		Sleep 350
		send, t/joinunit %CallSign% {enter}
		Sleep 350
		send, t/r %BadgeNumber% show me joining %CallSign% {enter}
	}
return

RenameSpecialCallsign:
	send, t/renameunit %SpecialCallsign% {enter}
	Sleep 500
	send, t/r %BadgeNumber% show me renaming unit to %SpecialCallsign% {enter}
return

JoinSpecialCallsign:
	send, t/disbandunit {enter}
	Sleep 250
	send, t/joinunit %SpecialCallsign% {enter}
	Sleep 250
	send, t/r %BadgeNumber% show me disbanding and joining %SpecialCallsign% {enter}
return

;Traffic stop handlers
PDHandCitation:
	send, t/me Hands the citation to the driver{enter}
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
	Gui, Add, Button, Default x+0 gCancel w80, Cancel
	Gui, Show,, Issue Citation TOM RPly
	return

	Ok:
		Gui,Submit
		if ((DemeritSuspend="No" or DemeritSuspend="Select...") and CitationType!="Select...") {
			sleep 150
			send, t/me Logs into the MDC and adds a "%CitationType%" to the individual's record{enter}
			sleep 350
			send, t/me Prints out the citation and grabs it from the printer{enter}
		} else if (DemeritSuspend="Yes" and CitationType!="Select...") {
			if (PlayerID!=""){
				sleep 150
				send, t/me Logs into the MDC and adds a "%CitationType%" to the individual's record{enter}
				sleep 350
				send, t/warndriver %PlayerID%{enter}
				sleep 450
				send, t/me Adds a demerit to the individual's driver's license{enter}
				sleep 350
				send, t/me Prints out the citation and grabs it from the printer{enter}
			} else {
				MsgBox,, ERROR, You must enter a player ID in order to issue a demerit!
			}
		} else if (DemeritSuspend="Demerit and Suspension" and CitationType!="Select...") {
			if (LicenseType="Driver" or LicenseType="Driver and Trucker") and (PlayerID!=""){
				sleep 150
				send, t/me Logs into the MDC and adds a "%CitationType%" to the individual's record{enter}
				sleep 350
				send, t/warndriver %PlayerID%{enter}
				sleep 450
				send, t/me Adds a demerit to the individual's driver's license{enter}
				sleep 450
				if (LicenseType="Driver"){
					send, t/suspend %PlayerID% driver 1{enter}
					sleep 450
					send, t/me Issues a 24 hour suspension on the individual's driver's license{enter}
					sleep 350
					send, t/me Prints out the citation and grabs it from the printer{enter}
				} else if (LicenseType="Driver and Trucker"){
					send, t/suspend %PlayerID% driver 1{enter}
					sleep 550
					send, t/suspend %PlayerID% trucker 1{enter}
					sleep 550
					send, t/me Issues a 24 hour suspension on both the individual's driver's and trucker's license{enter}
					sleep 350
					send, t/me Prints out the citation and grabs it from the printer{enter}
				}
			} else if (PlayerID="") {
				MsgBox,, ERROR, You must enter a player ID in order to issue a suspension!
			} else {
				MsgBox,, ERROR, You must select a license type in order to issue a suspension!
			}
		} else if (GeneralCitationType!="Select...") {
		    sleep 150
		    send, t/me Logs into the MDC and adds a "%GeneralCitationType%" citation to the individual's record{enter}
		    sleep 850
		    send, t/me Prints out the citation and grabs it from the printer{enter}
		} else {
			MsgBox,, ERROR, You must select a citation type!
		}
	return
return

PDLicense:
	send, t/me Looks at the license and hands it back to you{enter}
return

TowVehicle:
	Send, t/me Opens the control panel, pulls down a lever, and lowers the ramp{enter}
	Sleep, 3000
	Send, t/me Deploys the winch cables and securely attaches the cables to the front of the vehicle{enter}
	Sleep, 3000
	Send, t/me Pulls another lever on the control panel and starts the winch{enter}
	Sleep, 3000
	Send, t/me Secures the vehicle by its tires to the flatbed and lifts the ramp{enter}
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
			Send, t/dep PD to DOC, en route with %NumberInput% x 10-15. ETA %MinInput% minutes. Are you able to receive?{enter}
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
			Send, t/dep PD to DOC, en route with %NumberInput% x 10-15 HVT through the gates. ETA %MinInput% minutes. Are you able to receive?{enter}
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
			Send, t/dep PD to DOC, en route with %NumberInput% x 10-15 HVT through the gates. ETA %BackupNumber% minutes. Are you able to receive?{enter}
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
	send, t/dep PD to DOC, how copy?{enter}
return

DRadioPDtoMD:
	send, t/dep PD to MD, how copy?{enter}
return

;Scene management handlers
PDGrabBarriers:
	send, t/me Grabs the necessary barriers from the trunk of the cruiser, placing them under my arms {enter}
return

PDGatherBarriers:
	send, t/me Gathers all the blockades one by one and places them under my arms{enter}
	Sleep 250
	send, t/RemoveAllBlockades{enter}
return

PDStoreBarriers:
	send, t/me Places the barriers in the trunk of the cruiser{enter}
return

PDGrabBLS:
	send, t/me Grabs a BLS kit from the trunk of the cruiser {enter}
return

PDInitialBLS:
	send, t/anim medic{enter}
	Sleep 250
	send, t/me Sets the BLS kit on the groud and begins looking over your injuries{enter}
	Sleep 450
	send, t/do What would I see?{enter}
return

PDGrabBodyBag:
	send, t/me Grabs a body bag from the trunk of the cruiser{enter}
return

PDLoadIntoBodyBag:
	send, t/me Sets the body bag next to the body and unzips it{enter}
	Sleep 650
	send, t/me Rolls the body over into the body bag, ensuring the head, arms, and feet are all clear of the zipper.{enter}
	Sleep 950
	send, t/me Zips up the body bag{enter}
return

;Prisoner processing and arrest handlers

PDCuff:
	send, t/me Grabs a pair of cuffs from my duty belt and attempts to put them around your wrists {enter}
return

PDUncuff:
	send, t/me Takes the handcuff key from my duty belt and attempts to uncuff you{enter}
return

PDFrisk:
	send, t/me Puts on a pair of non-latex gloves and attempts to frisk you{enter}
return

PDLicenseFrisk:
	send, t/me Attempts to locate an ID{enter}
	Sleep 500
	send, t/do Would I find one?{enter}
return

PDKeyFrisk:
	send, t/me Attempts to locate a set of keys{enter}
	Sleep 500
	send, t/do Would I find any?{enter}
return

PDUnlockCuffedCar:
	send, t/me Takes the keys out, clicks the unlock button and puts them back where they were{enter}
return

PDLicenseCuff:
	send, t/me Takes out the license, carefully reading it over and puts it back where it was{enter}
return

PDReleaseForm:
	send, t/me Takes a pen out from my breast pocket and flips through the prisoner transfer forms{enter}
	Sleep 650
	send, t/me Finds a blank prisoner transfer form and signs it{enter}
return

PDMugshot:
	send, {F7}
	Sleep 450
	send, {F8}
	Sleep 350
	send, {F7}
	Sleep 450
	send, t/record{enter}
	Sleep 250
	send, t/me Takes a mugshot of the individual and uploads it to the PD database{enter}
	Sleep 1200
	send, t/do The upload would be successful{enter}
	Sleep 450
	send, t/record{enter}
return

PDFingerprints:
	send, t/collectprints 
	KeyWait, Enter, d
	{
		Sleep 450
		send, t/me Takes each of the fingers from your left hand and slowly rolls them over the scanner{enter}
		Sleep 1250
		send, t/me Checks the clarity of the fingerprints on the MDC before submitting{enter}
		Sleep 1150
		send, t/me Submits the left hand fingerprints in the MDC{enter}
		Sleep 1450
		send, t/do The prints would be clear enough to be accepted by the database{enter}
		Sleep 750
		send, t/do The MDC would prompt to scan the right hand fingerprints{enter}
		Sleep 550
		send, t/me Takes each of the fingers from your right hand and slowly rolls them over the scanner{enter}
		Sleep 1255
		send, t/me Checks the clarity of the fingerprints on the MDC before submitting{enter}
		Sleep 1550
		send, t/me Submits the right hand fingerprints in the MDC{enter}
		Sleep 1650
		send, t/do The prints would be clear enough to be accepted by the database{enter}
		Sleep 550 
		send, t/me Uploads the prints to the database{enter}
		Sleep 1550
		send, t/do Uploading...37+5{enter}
		Sleep 1750
		send, t/do Uploading...59+5{enter}
		Sleep 1850
		send, t/do Uploading...78+5{enter}
		Sleep 1575
		send, t/do Verifying...{enter}
		Sleep 750
		send, t/do Upload successful{enter}
	}
return

;Start and end watch handlers
StartWatch:
	send, t/me Takes off my civilian clothes and puts them in my locker{enter}
	Sleep 750
	send, t/me Puts on my duty uniform{enter}
	Sleep 750
	send, t/me Grabs a body cam from the locker, securing it to my chest and turns it on {enter}
	Sleep 750
	send, t/do The light would start blinking green {enter}
	Sleep 750
	send, t/time {enter}
	Sleep 750
	send, t/r %BadgeNumber% show me start of watch under %LincolnCallsign% {enter}
	Sleep 750
	send, t/createunit %LincolnCallsign% {enter}
return

StartWatchAdam:
	send, t/me Takes off my civilian clothes and puts them in my locker{enter}
	Sleep 750
	send, t/me Puts on my duty uniform{enter}
	Sleep 750
	send, t/me Grabs a body cam from the locker, securing it to my chest and turns it on {enter}
	Sleep 750
	send, t/do The light would start blinking green {enter}
	Sleep 750
	send, t/time {enter}
	Sleep 750
	send, t/r %BadgeNumber% show me start of watch under %AdamCallsign% {enter}
	Sleep 750
	send, t/createunit %AdamCallsign% {enter}
return

EndWatch:
	send, t/r %BadgeNumber% disbanding unit and ending watch {enter}
	Sleep 650
	send, t/disbandunit {enter}
	Sleep 550
	send, t/leaveunit {enter}
return

;Duty clothing handlers
DutyClothes:
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
	Send, t/m Driver, take your keys out of the ignition and toss them out of the window.{enter}
Return

FelonyStop2:
	Send, t/m Driver, place both hands outside of the window. Reach down and open the door with your right hand.{enter}
Return

FelonyStop3:
	Send, t/m Driver, exit the vehicle slowly. No sudden movements and keep your hands in the air. Face away from us at all times.{enter}
Return

FelonyStop4:
	Send, t/m Grab your shirt by the neck, lift it high, and turn around a full 360 so we can see your waistline.{enter}
Return

FelonyStop5:
	Send, t/m Walk backwards towards my voice until you are told to stop.{enter}
Return

;Pursuit megaphone
LethalPursuit:
	Send, t/m LSPD, STOP THE VEHICLE NOW OR FORCE MAY BE USED{enter}
Return

ExitApplication:
ExitApp
return

return
