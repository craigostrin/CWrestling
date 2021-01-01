extends Node2D

onready var deck = $CanvasLayer/CombatGUI/Deck
onready var hand = $CanvasLayer/CombatGUI/PlayerHand

var current_hand_size = 0
var max_hand_size = 5

func _ready():
	for i in range(5):
		draw_card()


func _input(_event):
	if Input.is_action_just_pressed('ui_accept'):
		draw_card()
	if Input.is_action_just_pressed('left_click'):
		play_card()


func play_card():
	var card = hand.take_card()
	$CanvasLayer/CombatGUI/PlayerCardPos.add_child(card)
	update_hand_count()
	draw_card()


func draw_card():
	if current_hand_size >= max_hand_size:
		return
	var new_card = deck.take_top_card()
	hand.add_card(new_card)
	update_hand_count()


func update_hand_count():
	current_hand_size = $CanvasLayer/CombatGUI/PlayerHand/HBoxContainer.get_children().size()
