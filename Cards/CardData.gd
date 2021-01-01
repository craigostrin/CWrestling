extends Resource
class_name CardData

export(String) var name setget ,get_name
export(int) var deck_count setget ,get_deck_count
export(String) var combo_card setget ,get_combo_card
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

# Regular actions
#export(int) var trust_given = null
#export(int) var trust_gained = null
#export(int) var trust_pooled = null
#export(int) var trust_converted = null
#export(int) var satisfaction_released = null
#
## Combo actions
#export(int) var c_trust_given = null
#export(int) var c_trust_gained = null
#export(int) var c_trust_pooled = null
#export(int) var c_trust_converted = null
#export(int) var c_satisfaction_released = null

export(Dictionary) var effects = {
	'Give' : null,
	'Gain' : null,
	'Pool' : null,
	'Convert' : null,
	'Satisfy' : null,
} setget ,get_effects

export(Dictionary) var combo_effects = {
	'Give' : null,
	'Gain' : null,
	'Pool' : null,
	'Convert' : null,
	'Satisfy' : null,
} setget ,get_combo_effects


func get_name():
	return name


func get_deck_count():
	return deck_count


func get_combo_card():
	return combo_card


func get_effects():
	return effects


func get_combo_effects():
	return combo_effects

#var effects = []
#var combo_effects = []

#func _init():
#	if trust_given:
#		effects.append(trust_given)
#	if trust_gained:
#		effects.append(trust_gained)
#	if trust_pooled:
#		effects.append(trust_pooled)
#	if trust_converted != 0:
#		effects.append(trust_converted)
#		print(trust_converted)
#	if satisfaction_released:
#		effects.append(satisfaction_released)
#	print(effects)
