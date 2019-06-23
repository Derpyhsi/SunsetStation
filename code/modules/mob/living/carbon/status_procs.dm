//Here are the procs used to modify status effects of a mob.
//The effects include: stun, knockdown, unconscious, sleeping, resting, jitteriness, dizziness, ear damage,
// eye damage, eye_blind, eye_blurry, druggy, TRAIT_BLIND trait, TRAIT_NEARSIGHT trait, and TRAIT_HUSK trait.

/mob/living/carbon/damage_eyes(amount)
	var/obj/item/organ/eyes/eyes = getorganslot(ORGAN_SLOT_EYES)
	if (!eyes)
		return
	if(amount>0)
		eyes.set_damage(amount)
		if(eyes.get_damage_perc() > 20)
			if(eyes.get_damage_perc() > 30)
				overlay_fullscreen("eye_damage", /obj/screen/fullscreen/impaired, 2)
			else
				overlay_fullscreen("eye_damage", /obj/screen/fullscreen/impaired, 1)

/mob/living/carbon/set_eye_damage(amount)
	var/obj/item/organ/eyes/eyes = getorganslot(ORGAN_SLOT_EYES)
	if (!eyes)
		return
	eyes.set_damage(amount)
	if(eyes.get_damage_perc() > 20)
		if(eyes.get_damage_perc() > 30)
			overlay_fullscreen("eye_damage", /obj/screen/fullscreen/impaired, 2)
		else
			overlay_fullscreen("eye_damage", /obj/screen/fullscreen/impaired, 1)
	else
		clear_fullscreen("eye_damage")

/mob/living/carbon/adjust_eye_damage(amount)
	var/obj/item/organ/eyes/eyes = getorganslot(ORGAN_SLOT_EYES)
	if (!eyes)
		return
	eyes.take_damage(amount)
	var/damage_to_eyes = eyes.get_damage_perc()
	if(damage_to_eyes > 20)
		if(damage_to_eyes > 30)
			overlay_fullscreen("eye_damage", /obj/screen/fullscreen/impaired, 2)
		else
			overlay_fullscreen("eye_damage", /obj/screen/fullscreen/impaired, 1)
	else
		clear_fullscreen("eye_damage")

/mob/living/carbon/adjust_drugginess(amount)
	druggy = max(druggy+amount, 0)
	if(druggy)
		overlay_fullscreen("high", /obj/screen/fullscreen/high)
		throw_alert("high", /obj/screen/alert/high)
		SEND_SIGNAL(src, COMSIG_ADD_MOOD_EVENT, "high", /datum/mood_event/high)
	else
		clear_fullscreen("high")
		clear_alert("high")
		SEND_SIGNAL(src, COMSIG_CLEAR_MOOD_EVENT, "high")

/mob/living/carbon/set_drugginess(amount)
	druggy = max(amount, 0)
	if(druggy)
		overlay_fullscreen("high", /obj/screen/fullscreen/high)
		throw_alert("high", /obj/screen/alert/high)
	else
		clear_fullscreen("high")
		clear_alert("high")

/mob/living/carbon/adjust_disgust(amount)
	disgust = CLAMP(disgust+amount, 0, DISGUST_LEVEL_MAXEDOUT)

/mob/living/carbon/set_disgust(amount)
	disgust = CLAMP(amount, 0, DISGUST_LEVEL_MAXEDOUT)

/mob/living/carbon/mend_fractures()
	for(var/obj/item/bodypart/B in bodyparts)
		B.fix_bone() 

////////////////////////////////////////TRAUMAS/////////////////////////////////////////

/mob/living/carbon/proc/get_traumas()
	. = list()
	var/obj/item/organ/brain/B = getorganslot(ORGAN_SLOT_BRAIN)
	if(B)
		. = B.traumas

/mob/living/carbon/proc/has_trauma_type(brain_trauma_type, resilience)
	var/obj/item/organ/brain/B = getorganslot(ORGAN_SLOT_BRAIN)
	if(B)
		. = B.has_trauma_type(brain_trauma_type, resilience)

/mob/living/carbon/proc/gain_trauma(datum/brain_trauma/trauma, resilience, ...)
	var/obj/item/organ/brain/B = getorganslot(ORGAN_SLOT_BRAIN)
	if(B)
		var/list/arguments = list()
		if(args.len > 2)
			arguments = args.Copy(3)
		. = B.brain_gain_trauma(trauma, resilience, arguments)

/mob/living/carbon/proc/gain_trauma_type(brain_trauma_type = /datum/brain_trauma, resilience)
	var/obj/item/organ/brain/B = getorganslot(ORGAN_SLOT_BRAIN)
	if(B)
		. = B.gain_trauma_type(brain_trauma_type, resilience)

/mob/living/carbon/proc/cure_trauma_type(brain_trauma_type = /datum/brain_trauma, resilience)
	var/obj/item/organ/brain/B = getorganslot(ORGAN_SLOT_BRAIN)
	if(B)
		. = B.cure_trauma_type(brain_trauma_type, resilience)

/mob/living/carbon/proc/cure_all_traumas(resilience)
	var/obj/item/organ/brain/B = getorganslot(ORGAN_SLOT_BRAIN)
	if(B)
		. = B.cure_all_traumas(resilience)

