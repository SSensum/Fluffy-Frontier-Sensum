/obj/item/chill_activator
	name = "chill activator"
	desc = "This item gives you traits and other stuff for <i>chillin'</i> purposes."
	icon = 'icons/obj/device_syndie.dmi'
	icon_state = "suspiciousphone"

/obj/item/chill_activator/attack_self(mob/user, modifiers)
	ADD_TRAIT(user, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(user, TRAIT_NOBREATH, TRAIT_GENERIC)
	var/datum/reagent/drug/nicotine/smoker = new /datum/reagent/drug/nicotine
	smoker.addiction_types = list()
	smoker.volume = 2
	smoker.overdose_threshold = 1000
	smoker.metabolization_rate = 0
	var/mob/living/carbon/human/humanuser = user
	humanuser.reagents.reagent_list += smoker;
	balloon_alert(user, "ready for some chillin'...")
	qdel(src)
	