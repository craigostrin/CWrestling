extends Control

onready var deckLabel = $Panel/Label

export(Array, Resource) var card_base
var deck = []
var card_count setget set_card_count

func _ready():
	randomize()
	setup_deck()
	self.card_count = deck.size()


func take_top_card() -> CardData:
	var card = deck[0]
	deck.erase(card)
	self.card_count -= 1
	return card


func setup_deck():
	for card in card_base:
		if 'deck_count' in card:
			var deck_count = card.deck_count
			
			# Might want a unique ID for each card
			for i in deck_count:
				deck.append(card)
	
	deck.shuffle()
	print('Initial deck: ' + str(deck))


func set_card_count(value):
	card_count = value
	update_label()


func update_label():
	deckLabel.text = 'DECK:\n' + str(card_count) + ' cards'
