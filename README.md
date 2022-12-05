# PD/SD AHK-Duty-Menu

## How to use:

- If you have any issues with this menu or any bugs that you find, feel free to reach out to me.  Additionally, if you want new features added or want to add a feature yourself, feel free to reach out or do a pull request.

### Buttons:
- `F3` Opens the menu
- `F9` Resets your in-game VOIP
- `F10` Clears your GPS of calls, backups, and emergencies (`/setcall -1`)
- `Numpad Add` Opens the mini MDC (**Remove this part if you have issues with emergencies dropping when you press `E`**)
- `Mouse 5` Rebinds your mouse button 5 (browser forward button) to `P` so it shows up as you using your phone in-game when you speak in TAC over TeamSpeak
### Global Variables:
- **YOU MUST CHANGE THESE** | The global variables are located near the top of the file starting at `line 9`.

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
- `Departmental Radio`:
  - `PD to DOC`: Does a radio call over the departmental radio to DOC
  - `PD to MD`: Does a radio call over the departmental radio to MD
  - `10-15 to DOC`: Asks the user for input on the number of 10-15s and the ETA, then does a radio call to DOC with the user's input
  - `10-15 to DOC HTV`: Same as `10-15 to DOC`, with the exception of informing DOC that you have an HVT that will be going through the gates
  - `Injured 10-15`: Drops a backup request (`/backup`) for MD, then prompts the user for the backup number, number of 10-15s, then does a radio call to MD requesting assistance
- `Pursuit Force`: Uses the megaphone (`/m`) to issue demands during a pursuit.
  - `/m LSPD, STOP THE VEHICLE NOW OR FORCE MAY BE USED`
- `Animations`: All of the animations that you can do in game with your character split into categories.
  - Credit to [Yputi](https://forum.eclipse-rp.net/topic/74673-animation-selection-tool-how-to-get-your-own-ui-for-the-new-animations/), the original creator of this modified menu
