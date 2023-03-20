
# PD AHK-Duty-Menu

This is a menu I made to spawn vehicles and do frequent RP that is done quite often, such as cuffing, frisking, uncuffing, et cetera.


## Installation

This is a standalone program that does not require the user to install any additional programs.  See below for steps to run:

* Download the project. (Code > Download Zip)
* Extract the contents into a folder of your choosing.
* Open and modify the `hotkeys.ini` and `variables.ini` in your text editor of choice.
* Run the `PD Duty Menu.exe`.
    
## Features

> All new features and changes are tracked in CHANGLOG.md

- `Start/End Watch`:
  - `Start Watch`: Does the RP of changing into your duty uniform, putting on a body cam, and starting your body cam, then creates your `LincolnCallsign` unit and does a radio call (`/r`) with your badge number and unit under which you are starting watch.
  - `Start Adam Watch`: Does the RP of changing into your duty uniform, putting on a body cam, and starting your body cam, then creates your `AdamCallsign` unit and does a radio call (`/r`) with your badge number and unit under which you are starting watch.
  - `End Watch`: Disbands and/or leaves the unit you are currently in and does a radio call (`/r`) to reflect that you are ending watch.
- `Change Unit`:
  - `Rename to Lincoln Callsign`: Changes your unit to your LINCOLN unit `/renameunit` and does a radio call (`/r`) to reflect your change.
  - `Rename to Adam Callsign`: Changes your unit to your ADAM unit `/renameunit` and does a radio call (`/r`) to reflect your change.
  - `Rename to Special Callsign`: Changes your unit to your Special Callsign unit `/renameunit` and does a radio call (`/r`) to reflect your change.
  - `Join Special Callsign`: Joins your Special Callsign unit `/renameunit` and does a radio call (`/r`) to reflect your change.
  - `Resume Lincoln Callsign`: Leaves the unit your are currently in (`/leaveunit`), creates your LINCOLN unit (`/createunit`), and does a radio call (`/r`) to reflect your change.
  - `Custom`: Disbands and/or leaves the unit you are currently in (`/disbandunit` or `/leaveunit`) and does a radio call (`/r`) to reflect your change.
- `Duty Clothing`: Self explanatory.
  - This is the only one that I could not have near-universal for everyone, as I do not have access to DB, SWAT, Command, and STAFF faction loadouts.  You will need to change the number of times that the arrow keys are pressed for each of these if you are not a POI.
- `Police Vehicles`: Self explanatory.  Does the `/fspawn` for the types of vehicles
- `Traffic Stop/Arrest Procedure`:
  - `Traffic Stop`:
    - `View License`: Does the RP for viewing the license of an individual and handing it back to them
    - `Issue Citation`: Does the RP for printing out citations, issuing demerits, and suspending licenses.  It will also scriptly issue a demerit and suspend a license if you select those options.
      - Prompts the user for the `Player ID` of the person receiving the citation
      - Dropdown menu for the type of vehicular citation
      - Dropdown menu for the type of general citation
      - Dropdown menu for issuing a demerit and/or license suspension
      - Dropdown menu for the type of license(s) to suspend
        - **Please note that you only need to input the required information.**  For example, if you are issuing a parking citation, you do not need to input the `Player ID`, `Demerit Info`, or `License Type`.  You only need to select the type of citation if you are only issuing a citation.
    - `Hand Citation`: Does the RP of handing the citation to the driver
  - `Felony Stop`: Step 1-5 of the demands to be given over the megaphone to the driver and passengers during a felony stop.
  - `Arrest`:
    - `Cuff`: Does the RP for attempting to cuff an arrestee
    - `Uncuff`: Does the RP for attempting to uncuff an arrestee
    - `Frisk`: Does the RP for attempting to frisk someone
    - `Frisk for License`: Does the RP of attempting to locate an ID on someone
    - `Frisk for Keys`: Does the RP of attempting to locate a set of keys
    - `Unlock Cuffed Person's Car`: Does the RP of taking the keys out, unlocking the car, and putting them back
    - `View Cuffed License`: Does the RP of viewing a cuffed person's license after they `/license [ID]` you
  - `Scene Management`:
    - `Grab Barriers`: Does the RP of grabbing barriers from the trunk of a cruiser
    - `Gather All Barriers`: Does the RP of gathering all of the barriers and placing them under your arms, then does `/RemoveAllBlockades`
    - `Store Barriers`: Does the RP of storing the barriers in the trunk of a cruiser
    - `Grab BLS Kit`: Does the RP of grabbing a BLS kit from the trunk of a cruiser
    - `Initial BLS`: Does the RP of setting down the BLS kit, then looking over a player's injuries
    - `Grab Body Bag`: Does the RP of grabbing a body bag from the trunk of a cruiser
    - `Load Into Body Bag`: Does the RP of loading a body into a body bag and zipping it up
  - `Inmate Processing`:
    - `Uncuff`: Does the RP for attempting to uncuff an arrestee
    - `Release Form`: Does the RP of signing the release form at DOC
    - `Mugshot`: (**Use in first person**) Toggles the UI with `F7`, then takes a screenshot with `F8`, then does the RP of taking a mugshot with your phone and uploading it to the PD database (`/record`)
    - `Fingerprints`: Does `/collectprints`, then waits for the user to press `enter`, then does the RP of collecting the prints of an individual while the `/collectprints` script runs
  - `Tow Vehicle`: Does the RP for loading a vehicle onto a flatbed
- `Departmental Radio`:
  - `PD to DOC`: Does a radio call over the departmental radio to DOC
  - `PD to MD`: Does a radio call over the departmental radio to MD
  - `10-15 to DOC`: Asks the user for input on the number of 10-15s and the ETA, then does a radio call to DOC with the user's input
  - `10-15 to DOC HTV`: Same as `10-15 to DOC`, with the exception of informing DOC that you have an HVT that will be going through the gates
  - `Injured 10-15`: Drops a backup request (`/backup`) for MD, then prompts the user for the backup number, number of 10-15s, then does a radio call to MD requesting assistance
- `Pursuit Force`: Uses the megaphone (`/m`) to issue demands during a pursuit.
  - `/m LSPD, STOP THE VEHICLE NOW OR FORCE MAY BE USED`
- `Animations`: All of the animations that you can do in game with your character split into categories.
- Credit to [Yputi](https://forum.eclipse-rp.net/topic/74673-animation-selection-tool-how-to-get-your-own-ui-for-the-new-animations/) and [Gaz](https://gov.eclipse-rp.net/viewtopic.php?t=85313), the original creators of this modified menu


## Configuration Files & Options

>Please note that the hotkeys are set using AutoHotkey's hotkey prefixes.  See their [Documentation](https://www.autohotkey.com/docs/v1/KeyList.htm) for info.

**File**|**Section**|**Variable**|**Options**|**Description**
-----|-----|-----|-----|-----
variables.ini|Callsign|Division|Number|The number of the division of your unit.  E.g. 21, 22, 23
variables.ini|Callsign|Letter|Text|The letter of your unit.  E.g. L, V, H, S
variables.ini|Callsign|Number|Number|The number of your unit.
variables.ini|Callsign|AdamChange|Boolean|Set if the letter of your unit changes to ADAM when you have a partner.
variables.ini|Callsign|DavidChange|Boolean|Set if the letter of your unit changes to DAVID when you have a partner.
variables.ini|Badge|Number|Number|Your badge number.
variables.ini|SpecialCallsigns|FLD|Boolean|Set if you are a member of FLD.
variables.ini|SpecialCallsigns|RED|Boolean|Set if you are a member of RED.
variables.ini|SpecialCallsigns|TOM|Boolean|Set if you are a member of TED.
variables.ini|SpecialCallsigns|DAVID|Boolean|Set if you are a member of SWAT.
variables.ini|SpecialCallsigns|AIR|Boolean|Set if you are a member of ASD.
variables.ini|SpecialCallsigns|TOMNumber|Number|The number of your unit to be used under your TOM callsign.
variables.ini|SpecialCallsigns|DAVIDNumber|Number|The number of your unit to be used under your DAVID callsign.
variables.ini|Vehicle|CrownVic|Text|The vehicle and livery to spawn when selecting the vehicle from the menu.
variables.ini|Vehicle|Buffalo|Text|The vehicle and livery to spawn when selecting the vehicle from the menu.
variables.ini|Vehicle|Interceptor|Text|The vehicle and livery to spawn when selecting the vehicle from the menu.
variables.ini|Vehicle|Scout|Text|The vehicle and livery to spawn when selecting the vehicle from the menu.
variables.ini|Vehicle|Alamo|Text|The vehicle and livery to spawn when selecting the vehicle from the menu.
variables.ini|Vehicle|Caracara|Text|The vehicle and livery to spawn when selecting the vehicle from the menu.
variables.ini|Vehicle|Kamacho|Text|The vehicle and livery to spawn when selecting the vehicle from the menu.
variables.ini|Vehicle|Drafter|Text|The vehicle and livery to spawn when selecting the vehicle from the menu.
variables.ini|Vehicle|Highspeed|Text|The vehicle and livery to spawn when selecting the vehicle from the menu.
variables.ini|VehicleAccess|CrownVic|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Buffalo|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Interceptor|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Scout|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Alamo|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Caracara|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|PoliceBike|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Kamacho|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Drafter|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Highspeed|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|UnmarkedCrownVic|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|UnmarkedBuffalo|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|UnmarkedGranger|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|UnmarkedScout|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|UnmarkedAlamo|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|UnmarkedCaracara|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|UnmarkedKamacho|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Riot|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Tarv|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Brickade|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|BF400|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Shinobi|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|RCV|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Insurgent|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Maverick|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Buzzard|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|VehicleAccess|Dinghy|Boolean|Whether or not you have access to the vehicle or want it in the spawn menu.
variables.ini|Sex|1|Text|The third person gender to use in RP /me's and /do's.
variables.ini|Sex|2|Text|The third person possessive gender to use in RP /me's and /do's.
variables.ini|Debugging|Value|Boolean|Enable this to run the program inputting text into notepad to verify everything is working correctly.
hotkeys.ini|Hotkeys|OpenMenu|Hotkey|The key to open the menu.  Default is `F3`.
hotkeys.ini|Hotkeys|VOIPReset|Hotkey|The key to reset VOIP.  Default is `F9`.
hotkeys.ini|Hotkeys|ClearGPS|Hotkey|The key to clear the GPS.  Default is `F10`.
hotkeys.ini|Hotkeys|MiniMDC|Hotkey|The key to open the mini MDC.  Default is `NumpadAdd`.
hotkeys.ini|Hotkeys|KillSwitch|Hotkey|The key to exit the application.  Default is `F12`.

## Acknowledgements
 - [Yputi](https://forum.eclipse-rp.net/topic/74673-animation-selection-tool-how-to-get-your-own-ui-for-the-new-animations/) for creating the original anim menu
 - [Gaz](https://gov.eclipse-rp.net/viewtopic.php?t=85313) for creating the original PD menu

## License

[AGPL 3.0](https://choosealicense.com/licenses/agpl-3.0/)
