extends Node2D

onready var deck = $CanvasLayer/CombatGUI/Deck
onready var hand = $CanvasLayer/CombatGUI/PlayerHand

var current_hand_size = 0
var max_hand_size = 5

func _ready():
	draw_card()


func draw_card():
	if current_hand_size >= max_hand_size:
		return
	var new_card = deck.remove_top_card()
	hand.add_card(new_card)
	current_hand_size += 1

func _input(event):
	if Input.is_action_just_pressed('ui_accept'):
		draw_card()
