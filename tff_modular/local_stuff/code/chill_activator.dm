/obj/item/chill_activator
	name = "chill activator"
	desc = "This item gives you traits and other stuff for <i>chillin'</i> purposes."
	icon = 'icons/obj/art/camera.dmi'
	icon_state = "album"

/obj/item/chill_activator/attack_self(mob/user, modifiers)
	// No hunger or breath for long chillin'
	var/mob/living/carbon/human/humanuser = user
	humanuser.nutrition = NUTRITION_LEVEL_FED
	ADD_TRAIT(user, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(user, TRAIT_NOBREATH, TRAIT_GENERIC)
	
	// No nicotine addiction and lung damage, so you can have breaks between smoking
	var/datum/reagent/drug/nicotine/smoker = new /datum/reagent/drug/nicotine
	smoker.addiction_types = list()
	smoker.volume = 2
	smoker.overdose_threshold = 1000
	smoker.metabolization_rate = 0
	humanuser.reagents.reagent_list += smoker;
	var/obj/item/organ/internal/ourlungs = humanuser.organs_slot["lungs"]
	ourlungs.healing_factor = 1
	
	
	balloon_alert(user, "ready for some chillin'...")
	qdel(src)
	