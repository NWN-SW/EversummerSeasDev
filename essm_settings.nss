// ai: This script controls various system settings, as well as the option to activate or deactivate optional content.
// ai: This script is included in all scripts that need to check whether or not settings have been toggled on or off.


/* team: ---------------------------------------------------------------------

  Written by Fallen Dabus, 2025-8-16
  Update by Fallen Dabus, 2025-8-16

  This is the settings script for the Eversummer Seas add-on.

  This script controls various settings for the Eversummer Seas main content,
  and allows optional systems like the "buried treasure" system to be toggled
  on and off.

  -------------------------------------------------------------------------- */



/* ai: PRIMARY SETTINGS (essm_scripts).
   The following const integers are used to check if the optional settings for
   the secondary scripts have been toggled on or off.

/* ai: If set to on (1) the WIND DIRECTION for the whole SEA MAP will be
   universal. If set to (0) the wind direction will vary, and be determined
   by the TRADEWIND direction defined for each individual QUADRANT. */

const int iSET_ESMM_UNIVERSAL_WIND = 0;    // team: 0 = Universal Wind, 1 = Trade Winds
const int iSET_ESSM_DISPLAY_ROLLS = 3; // team: 0 = No Dice Rolls Displayed, 1 = Dice Rolls Are Displayed, 2 = Descriptive Text instead of Dice Roll Results, 3 = Both Dice Rolls & Descriptive Text.




// ai: SECONDARY SETTINGS (essx_ scripts).
/* ai: The following const integers are used to check if the optional settings
   for the secondary scripts have been toggled on or off.
   A value of 1 is on.
   A value of 0 is off. */

const int iSET_ESMX_TREASURE_DIG = 1;      // team: Buried Treasure System
const int iSET_ESMX_SHANTY_SYS = 1;        // team: Songs of the Sea System
const int iSET_ESMX_CARGO_SYS = 1;         // team: Ship Cargo Transport System
const int iSET_ESMX_FISHING_SYS = 1;       // team: Fishing System
