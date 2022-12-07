# PD AHK-Duty-Menu

## How to use:

> If you are having issues with it not working in game, you may have to run the script as administrator, as RAGE may be preventing AutoHotKey from capturing your keyboard input.

1. Download and install [AutoHotKey](https://www.autohotkey.com/download/)
2. Download the `PD Duty Menu.ahk` file (`Green` Button -> `Download Zip`)
3. Place the `PD Duty Menu.ahk` file in a folder
4. Run the `PD Duty Menu.ahk`

- If you have any issues with this menu or any bugs that you find, feel free to reach out to me.  Additionally, if you want new features added or want to add a feature yourself, feel free to reach out or do a push/pull request.
- Additionally, I have ran this by admins and they have all said that this does not break any rules, as it is all stuff that we do all the time.

### Buttons:
- `F3` Opens the menu
- `F9` Resets your in-game VOIP
- `F10` Clears your GPS of calls, backups, and emergencies (`/setcall -1`)
- `F12` Kill switch to exit the application in the event of a misclick
- `Numpad Add` Opens the mini MDC (**Remove this part if you have issues with emergencies dropping when you press `E`**)
- `Mouse 5` Rebinds your mouse button 5 (browser forward button) to `P` so it shows up as you using your phone in-game when you speak in TAC over TeamSpeak
### Global Variables:
> **YOU MUST CHANGE THESE** | The global variables are located near the top of the file starting at `line 9`.

| Variable | Description |
| ----------- | ----------- |
| `LincolnCallsign` | Used as your default LINCLON unit when starting watch |
| `AdamCallsign` | Used as your default ADAM unit when starting watch |
| `SpecialCallsign` | Used for individuals that are members of units that have special callsigns, such as `RED`, `FLD`, et cetera |
| `BadgeNumber` | Used as your badge number when making radio calls with `/r` |

### Menu Overview:
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
- `Police Vehicles`: Self explanatory.  Does the `/fspawn` for the types of vehicles available to a POI
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

# How to Add Vehicles:

1. First, you will need to copy one of the lines in the vehicles section of the menu.
![`Menu, SubMenu20, Add, Stanier, SpawnCrownVic`](https://i.imgur.com/OuGPOCI.png)
2. In the example above, you would copy `line 84` and paste it where in the list you want it to show up in the menu.
   1. For example, if you want your new vehicle to show up below the Scout, you would copy and paste `line 84` and paste it below `line 87`.
3. Leave the portion underlined in `red` alone.
4. Change the portion underlined in `green` to the in-game name of the vehicle you are adding.  E.g., `Unmarked Scout`.
5. The portion underlined in `purple` is the name of the `go to` portion (kind of like a `variable`) of AHK script that sends the macro keystrokes.
   1. You can set this to anything you want, but best practice is to name it something that relates to the task it is accomplishing.  That is, if you are adding a `TARV` to your vehicle menu, I would recommend naming it something like `SpawnTARV`.  Please bear in mind that it **MUST** be one word.
6. Copy or create your own spawn handler from the section of spawn handlers in the AHK script (beginning on line `1145`). <br />
![Photo of spawn handler](https://i.imgur.com/vqCU4ns.png)
7. As in the previous example, you will leave the portion in `red` alone.
8. Change the portion underlined in `green` to the `/fspawn` name of the vehicle you are adding.
9. Change the portion underlined in `purple` to the name of the `go to` that you set in `Step 5`.
10. Reload the script, if it is running, or run the script.
    1. To reload the script, `bottom right > show hidden icons > right click AHK icon > reload`
11. Press `F3` to open the menu and verify that you did not get any errors.

# Troubleshooting Common Issues:

| **Problem** | **Solution** |
|:-----------------------------------------------------------------:|:-----------------------------------------------------------------:|
| The menu is not showing up in game | Ensure that you are running the AHK script as administrator. |
| The menu minimizes my game every time I open it | Ensure that you are running your game in `Windowed Borderless` mode. |
| The Windows taskbar stays visible after I run `Issue Citation`  | I am not sure why this happens, as I can never get it to consistently replicate.  Try selecting `Issue Citation` again and selecting the game |
| I drop panics when I turn on my sirens | Remove the portion that turns on the MDC from the script (`lines 14-28`). |

[![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg
