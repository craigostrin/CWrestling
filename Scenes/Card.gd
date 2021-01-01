extends Control

# NOTES:
# RL card size with 1280x720 conversion
# Card length - 12cm (270 px)
# Header - 1.6 cm (36 px)
# Footer - 1.7 cm (38.25 px)

# I guess the top-level Panel should be a NinePatchRect for round corners

onready var nameLabel = $Panel/VBoxContainer/Header/HBoxContainer/NameLabel
onready var effectsContainer = $Panel/VBoxContainer/Header/HBoxContainer/EffectsContainer
#onready var effect1Label = $Panel/VBoxContainer/Header/HBoxContainer/Effects/Effect1Label
#onready var effect2Label = $Panel/VBoxContainer/Header/HBoxContainer/Effects/Effect2Label
#onready var artRect = $Panel/VBoxContainer/TextureRect
onready var comboHeader = $Panel/VBoxContainer/Footer/ComboHeader
onready var comboLabel = $Panel/VBoxContainer/Footer/VBoxContainer/ComboLabel
onready var comboEffectsContainer = $Panel/VBoxContainer/Footer/VBoxContainer/ComboEffectsContainer
#onready var comboEffect1Label = $Panel/VBoxContainer/Footer/VBoxContainer/ComboEffects/ComboEffect1Label
#onready var comboEffect2Label = $Panel/VBoxContainer/Footer/VBoxContainer/ComboEffects/ComboEffect2Label


var card_data: CardData


func set_card_data(cd: CardData):
	card_data = cd
	update_display()


func update_display():
	set_card_name()
	set_effects()
	set_combo_header()
	set_combo_label()
	set_combo_effects()


func set_card_name():
	nameLabel.text = card_data.get_name()


func set_effects():
	var fx = card_data.get_effects()
	create_effect_labels(fx, effectsContainer)


func set_combo_header():
	if card_data.good_combo:
		comboHeader.text = "Combo!"
	else:
		comboHeader.text = "Combo?"


func set_combo_label():
	var _name = card_data.name
	var _combo_card = card_data.get_combo_card()
	comboLabel.text = _name + ' + ' + _combo_card


func set_combo_effects():
	var fx = card_data.get_combo_effects()
	create_effect_labels(fx, comboEffectsContainer)


func create_effect_labels(fx: Dictionary, container_node: Control):
	var labels = []
	
	# For each effect, make a Label and add it to a Labels array
	for effect in fx:
		if fx[effect]:
			var label = Label.new()
			label.text = str(effect) + ' ' + str(fx[effect])
			labels.append(label)
	
	# Loop backward through the Labels array
	for i in range(labels.size() - 1, -1, -1):
		container_node.add_child(labels[i])
