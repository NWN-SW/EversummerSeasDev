void main()
{

    // ai: essm_set_pcship contains all the relative base stats available for player ship objects
    string sShipType = "";


    //team:
    if (sShipType == "ShipType_Sloop") {
        int nHullArmorLarboard;
        int nHullArmorStarboard;
        int nHullArmorBow;
        int nHullArmorAft;

        int nHullHealthLarboard;
        int nHullHealthStarboard;
        int nHullHealthBow;
        int nHullHealthAft;

        int nSailHealth_01; // team: main sail, square rigged, midship.
        int nSailHealth_02; // team: main top sail, square rigged, midship.
        int nSailHealth_03; // team: fore sail, lanteen rigged, bow-wards.
        int nSailHealth_04; // team: aft sail, gaff rigged, aft-wards.

        int nGunsLarboard;
        int nGunsStarboard;
        int nGunsBow;
        int nGunsAft;

        int nIdealAngle;
        int nPoorAngle;
        int nDeadAngle;

        float nBaseSpeed;
        int nTurnSpeed;

        //return function result
        return;
    }


    else if (sShipType == "ShipType_Brigantine") {
        return;
    }


    else if (sShipType == "ShipType_Galleon") {
        return;
    }


    else {
        //DebugMessage oPC: "Error Code: Rusty Barnacle 1403";
        //DebugMessage Dev: "Error Code: Rusty Barnacle 1403, ShipType not found, essm_set_pcship).
        return;
    }
}
