extends Resource
class_name CardData

### Might want to change this into just a single data file that includes
### all card stats in one place. Also cuz editing CardData in the inspector
### is just kind of time consuming and a pain.
###
### Can use "if 'property' in Object" to check if a card has a variable
### Or can keep checking Null, or (cuz apparently null is bad) you can set
### everything to 0 and just check "if > 0"

export(String) var name
export(int) var deck_count
export(String) var combo_card
export(bool) var good_combo
export(String) var combo_flavor_text

enum phases {
	GIVE_BACK,
	GAIN_TRUST,
	POOL_TRUST,
	CONVERT_TRUST,
	SATISFY,
}

export(phases) var phase_played

export(Dictionary) var effects = {
	'Give' : null,
	'Gain' : null,
	'Pool' : null,
	'Convert' : null,
	'Satisfy' : null,
}

export(Dictionary) var combo_effects = {
	'Give' : null,
	'Gain' : null,
	'Pool' : null,
	'Convert' : null,
	'Satisfy' : null,
}
