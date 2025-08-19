//Ensure the LEVER you are applying this to is tagged as "LEVER_1" AND is set to deactivated.
//Ensure the OBJECT you wish to animate is tagged as "TEST" AND is set to deactivated.

void main()
{
    int nDebugMode = 2; // 0 == No Debug Messages, 1 == Basic Debug Messages, 2 == Detailed Debug Messages

    //object oHelmsman = GetClickingObject();
    object oHelmsman = GetFirstPC();
    object oShipWheel = GetObjectByTag("TESTWHEEL");
    string sWheelButton = GetTag(OBJECT_SELF);
    string sCurrentAnimation = GetLocalString(oShipWheel, "currentanimation");   //valid animations: default, on, off
    string sCurrentPosition = GetLocalString(oShipWheel, "currentposition");     //valid positions: hardleft, left, middle, right, hardright

    float fTargetTransitionAnimationLength;
    string sTargetTransitionAnimation;
    string sTargetAnimation;


    //Basic lever function. REMOVE WHEN THIS IS TRANSITIONED TO AN NUI INTERFACE!
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


    //Debug Messages if sCurrentPosition and sCurrentAnimation are correct.
    if (nDebugMode != 0)
         SendMessageToPC(oHelmsman,"sCurrentAnimation = " + sCurrentAnimation);
         SendMessageToPC(oHelmsman,"sCurrentPosition = " + sCurrentPosition);


    //Handling the case if the shipwheel is still set to default, aka has not yet been interacted with this session.
    if (sCurrentAnimation == "default")
        sCurrentAnimation = "off";

    if (sCurrentPosition == "default")
        sCurrentPosition = "middle";

    if (nDebugMode != 0)
         SendMessageToPC(oHelmsman,"sCurrentAnimation assigned = " + sCurrentAnimation);
         SendMessageToPC(oHelmsman,"sCurrentPosition assigned = " + sCurrentPosition);


    //Preparing Target Animation & Target Transition Animation Slots
    if (sCurrentAnimation == "on") {
        sTargetTransitionAnimation = "on2off";
        sTargetAnimation = "off";
    }

    else if (sCurrentAnimation == "off") {
        sTargetTransitionAnimation = "off2on";
        sTargetAnimation = "on";
    }

    else if (sCurrentAnimation != "on" && sCurrentAnimation != "off") {
        SendMessageToPC(oHelmsman,"Debug: sCurrentAnimation has invalid value assigned.");
    }


    //Forking based on which button is pressed

    //HARD TO LARBOARD!
    if (sWheelButton == "LEVERWHEEL_HL") {

        if (nDebugMode != 0)
            SendMessageToPC(oHelmsman,"Ship Wheel: Turning to hard to larboard.");

        //Assigning correct transition animations based on current wheel position.
        if (sCurrentPosition == "hardleft") {
            SendMessageToPC(oHelmsman,"Ship Wheel: Already spun to hard to larboard.");
            return;
        }

        else if (sCurrentPosition == "left") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"lhrd");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "left2lhrd");
            fTargetTransitionAnimationLength = 8.0;
        }

        else if (sCurrentPosition == "middle") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"lhrd");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "middle2lhrd");
            fTargetTransitionAnimationLength = 16.0;

            //REMOVE
            if (nDebugMode == 2)
                SendMessageToPC(oHelmsman,"Ship Wheel: Entering IF middle.");
        }

        else if (sCurrentPosition == "right") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"lhrd");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "right2lhrd");
            fTargetTransitionAnimationLength = 24.0;
        }

        else if (sCurrentPosition == "hardright") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"lhrd");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "rhrd2lhrd");
            fTargetTransitionAnimationLength = 32.0;
        }

        //update shipwheel object variables to be stored for next use
        SetLocalString(oShipWheel, "currentanimation", sTargetAnimation);
        SetLocalString(oShipWheel, "currentposition", "hardleft");

        //executing animation
        if (sCurrentAnimation == "on") {
            AssignCommand(oShipWheel, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE, 1.0, fTargetTransitionAnimationLength));

            //REMOVE
            if (nDebugMode == 2)
                SendMessageToPC(oHelmsman,"Ship Wheel: Entering PLAY ANIMATION ACTIVATE.");
        }

        else {
            AssignCommand(oShipWheel, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE, 1.0, fTargetTransitionAnimationLength));

            //REMOVE
            if (nDebugMode == 2)
                SendMessageToPC(oHelmsman,"Ship Wheel: Entering PLAY ANIMATION ACTIVATE.");
        }

        return;

    }


    //TO LARBOARD!
    else if (sWheelButton == "LEVERWHEEL_SL") {

        if (nDebugMode != 0)
            SendMessageToPC(oHelmsman,"Ship Wheel: Turning to larboard.");

        //Assigning correct transition animations based on current wheel position.
        if (sCurrentPosition == "left") {
            SendMessageToPC(oHelmsman,"Ship Wheel: Already spun to larboard.");
            return;
        }

        else if (sCurrentPosition == "hardleft") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"left");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "lhrd2left");
            fTargetTransitionAnimationLength = 8.0;
        }

        else if (sCurrentPosition == "middle") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"left");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "middle2left");
            fTargetTransitionAnimationLength = 8.0;
        }

        else if (sCurrentPosition == "right") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"left");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "right2left");
            fTargetTransitionAnimationLength = 16.0;
        }

        else if (sCurrentPosition == "hardright") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"left");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "rhrd2left");
            fTargetTransitionAnimationLength = 24.0;
        }

        //update shipwheel object variables to be stored for next use
        SetLocalString(oShipWheel, "currentanimation", sTargetAnimation);
        SetLocalString(oShipWheel, "currentposition", "left");

        //executing animation
        if (sCurrentAnimation == "on") {
            AssignCommand(oShipWheel, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE, 1.0, fTargetTransitionAnimationLength));
        }

        else {
            AssignCommand(oShipWheel, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE, 1.0, fTargetTransitionAnimationLength));
        }

        return;
    }

    //STEADY AS SHE GOES!
    else if (sWheelButton == "LEVERWHEEL_M") {

        if (nDebugMode != 0)
            SendMessageToPC(oHelmsman,"Ship Wheel: Steady as she goes!");

        //Assigning correct transition animations based on current wheel position.
        if (sCurrentPosition == "middle") {
            SendMessageToPC(oHelmsman,"Ship Wheel: Already centered.");
            return;
        }

        else if (sCurrentPosition == "hardleft") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"middle");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "lhrd2middle");
            fTargetTransitionAnimationLength = 16.0;
        }

        else if (sCurrentPosition == "left") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"middle");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "left2middle");
            fTargetTransitionAnimationLength = 8.0;
        }

        else if (sCurrentPosition == "right") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"middle");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "right2middle");
            fTargetTransitionAnimationLength = 8.0;
        }

        else if (sCurrentPosition == "hardright") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"middle");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "rhrd2middle");
            fTargetTransitionAnimationLength = 16.0;
        }

        //update shipwheel object variables to be stored for next use
        SetLocalString(oShipWheel, "currentanimation", sTargetAnimation);
        SetLocalString(oShipWheel, "currentposition", "middle");

        //executing animation
        if (sCurrentAnimation == "on") {
            AssignCommand(oShipWheel, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE, 1.0, fTargetTransitionAnimationLength));
        }

        else {
            AssignCommand(oShipWheel, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE, 1.0, fTargetTransitionAnimationLength));
        }

        return;
    }

    //TO STARBOARD!
    else if (sWheelButton == "LEVERWHEEL_SR") {

        if (nDebugMode != 0)
            SendMessageToPC(oHelmsman,"Ship Wheel: Turning to starboard!");

        //Assigning correct transition animations based on current wheel position.
        if (sCurrentPosition == "right") {
            SendMessageToPC(oHelmsman,"Ship Wheel: Already spun to starboard.");
            return;
        }

        else if (sCurrentPosition == "hardleft") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"right");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "lhrd2right");
            fTargetTransitionAnimationLength = 24.0;
        }

        else if (sCurrentPosition == "left") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"right");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "left2right");
            fTargetTransitionAnimationLength = 16.0;
        }

        else if (sCurrentPosition == "middle") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"right");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "middle2right");
            fTargetTransitionAnimationLength = 8.0;
        }

        else if (sCurrentPosition == "hardright") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"right");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "rhrd2right");
            fTargetTransitionAnimationLength = 8.0;
        }

        //update shipwheel object variables to be stored for next use
        SetLocalString(oShipWheel, "currentanimation", sTargetAnimation);
        SetLocalString(oShipWheel, "currentposition", "right");

        //executing animation
        if (sCurrentAnimation == "on") {
            AssignCommand(oShipWheel, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE, 1.0, fTargetTransitionAnimationLength));
        }

        else {
            AssignCommand(oShipWheel, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE, 1.0, fTargetTransitionAnimationLength));
        }

        return;
    }

    //HARD TO STARBOARD!
    else if (sWheelButton == "LEVERWHEEL_HR") {

        if (nDebugMode != 0)
            SendMessageToPC(oHelmsman,"Ship Wheel: Turning hard to starboard!");

        //Assigning correct transition animations based on current wheel position.
        if (sCurrentPosition == "hardright") {
            SendMessageToPC(oHelmsman,"Ship Wheel: Already spun hard to starboard.");
            return;
        }

        else if (sCurrentPosition == "hardleft") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"rhrd");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "lhrd2rhrd");
            fTargetTransitionAnimationLength = 32.0;
        }

        else if (sCurrentPosition == "left") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"rhrd");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "left2rhrd");
            fTargetTransitionAnimationLength = 24.0;
        }

        else if (sCurrentPosition == "middle") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"rhrd");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "middle2rhrd");
            fTargetTransitionAnimationLength = 16.0;
        }

        else if (sCurrentPosition == "right") {
            ReplaceObjectAnimation(oShipWheel,sTargetAnimation,"rhrd");
            ReplaceObjectAnimation(oShipWheel, sTargetTransitionAnimation, "right2rhrd");
            fTargetTransitionAnimationLength = 8.0;
        }

        //update shipwheel object variables to be stored for next use
        SetLocalString(oShipWheel, "currentanimation", sTargetAnimation);
        SetLocalString(oShipWheel, "currentposition", "hardright");

        //executing animation
        if (sCurrentAnimation == "on") {
            AssignCommand(oShipWheel, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE, 1.0, fTargetTransitionAnimationLength));
        }

        else {
            AssignCommand(oShipWheel, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE, 1.0, fTargetTransitionAnimationLength));
        }

        return;
    }

    //The fuck did you press, Blackbeard?!
    else if (nDebugMode != 0)
         SendMessageToPC(oHelmsman,"Debug: Button does not have the correct tag assigned.");


}
