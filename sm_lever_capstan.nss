//Ensure the LEVER you are applying this to is tagged as "LEVER_1" AND is set to deactivated.
//Ensure the OBJECT you wish to animate is tagged as "TEST" AND is set to deactivated.

void main()
{
    //Basic lever function, don't change.
    int nThisLever = GetLocalInt(OBJECT_SELF, "LEVER_STATE");
    if(nThisLever == 1)
    {
        // Lever is ON and we need to turn it OFF
        SetLocalInt(OBJECT_SELF, "LEVER_STATE", 0);
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    }
    else
    {
        //Lever is OFF and we need to turn it ON
        SetLocalInt(OBJECT_SELF, "LEVER_STATE", 1);
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    }

    //Replace "TESTSAIL" with the tag of the object you wish to influence.
    object oTest = GetObjectByTag("TESTCAPSTAN");
    int nLever1 = GetLocalInt(GetObjectByTag("LEVERCAPSTAN"), "LEVER_STATE");


    //Again:
    //Ensure the LEVER you are applying this to is tagged as "LEVER_1" AND is set to deactivated.
    //Ensure the OBJECT you wish to animate is tagged as "TEST" AND is set to deactivated.

    //What happens when it is activated
    if(nLever1 == 1)
    {
        SendMessageToPC(GetFirstPC(),"Activating");
        AssignCommand(oTest, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE, 1.0, 0.0));
    }

    //What happens when it is deactivated
    else
    {
        //ReplaceObjectAnimation(oTest,"on2off","c_close2open");
        //ReplaceObjectAnimation(oTest,"off","c_open");

        SendMessageToPC(GetFirstPC(),"Deactivating");
        AssignCommand(oTest, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE, 1.0, 0.0));
    }


}
