
#define SALVAGE_METAL /obj/item/stack/ore/salvage/scrapmetal
#define	SALVAGE_TITANIUM /obj/item/stack/ore/salvage/scraptitanium
#define	SALVAGE_SILVER /obj/item/stack/ore/salvage/scrapsilver
#define	SALVAGE_GOLD /obj/item/stack/ore/salvage/scrapgold
#define SALVAGE_PLASMA /obj/item/stack/ore/salvage/scrapplasma
#define SALVAGE_URANIUM /obj/item/stack/ore/salvage/scrapuranium
#define SALVAGE_BLUESPACE /obj/item/stack/ore/salvage/scrapbluespace

//salvage from destruction of wrecks

/obj/item/stack/ore/salvage
	name = "salvage"
	icon = 'sunset/icons/obj/salvage.dmi'

/obj/item/stack/ore/salvage/scrapmetal
	name = "scrap metal"
	desc = "A collection of metal peices and parts."
	icon_state = "smetal"
	item_state = "smetal"
	materials = list(MAT_METAL=MINERAL_MATERIAL_AMOUNT)
	points = 1
	refined_type = /obj/item/stack/sheet/metal

/obj/item/stack/ore/salvage/scraptitanium
	name = "scrap titanium"
	desc = "A bunch of strong metal peices and parts from high-preformance equppment."
	icon_state = "stitanium"
	item_state = "stitanium"
	materials = list(MAT_TITANIUM=MINERAL_MATERIAL_AMOUNT)
	points = 50
	refined_type = /obj/item/stack/sheet/mineral/titanium

/obj/item/stack/ore/salvage/scrapsilver
	name = "worn crt"
	desc = "An old CRT display. the letters 'Please wait' are burned into the screen."
	icon_state = "ssilver"
	item_state = "ssilver"
	materials = list(MAT_SILVER=MINERAL_MATERIAL_AMOUNT)
	points = 16
	refined_type = /obj/item/stack/sheet/mineral/silver

/obj/item/stack/ore/salvage/scrapgold
	name = "scrap electronics"
	desc = "Various bits of electrical components."
	icon_state = "sgold"
	item_state = "sgold"
	materials = list(MAT_GOLD=MINERAL_MATERIAL_AMOUNT)
	points = 18
	refined_type = /obj/item/stack/sheet/mineral/gold

/obj/item/stack/ore/salvage/scrapplasma
	name = "junk plasma cell"
	desc = "This plasma cell looks nonfunctional."
	icon_state = "splasma"
	item_state = "splasma"
	materials = list(MAT_GOLD=MINERAL_MATERIAL_AMOUNT)
	points = 15
	refined_type = /obj/item/stack/sheet/mineral/plasma

/obj/item/stack/ore/salvage/scrapuranium
	name = "broken detector"
	desc = "There is a label on the side of the old detector warning of radioactive elements."
	icon_state = "suranium"
	item_state = "suranium"
	materials = list(MAT_URANIUM=MINERAL_MATERIAL_AMOUNT)
	points = 30
	refined_type = /obj/item/stack/sheet/mineral/uranium

/obj/item/stack/ore/salvage/scrapbluespace
	name = "damaged bluespace circuit"
	desc = "The circuit looks too damaged to be operational, but the crystal inside its housing looks fine."
	icon_state = "sbluespace"
	item_state = "sbluespace"
	materials = list (MAT_BLUESPACE=MINERAL_MATERIAL_AMOUNT)
	points = 50
	refined_type = /obj/item/stack/sheet/bluespace_crystal
