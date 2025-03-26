extends Node

var player: PlayerController

var flightEye = preload("res://game/enemies/flight_eye.tscn")
var mashroom = preload("res://game/enemies/mushroom.tscn")
var enemies = [flightEye, mashroom]
var enemies_dic = {
	flightEye:5, 
	mashroom:5
}

var bluePower = preload("res://game/powers/blue_power.tscn")
var greenPower = preload("res://game/powers/green_power.tscn")
var my_powers = [bluePower, greenPower] # esse será o objeto onde todos os poderes do personagem ficaram
var powers_dic = { # esse objeto será manipulado com os valores da carta
	bluePower:5, 
	greenPower:5
}

var pizza = preload("res://game/collectibles/pizza.tscn")
var coconut = preload("res://game/collectibles/coconut.tscn")
var foods = [pizza, coconut]

var gold = preload("res://game/collectibles/coin_gold.tscn")
var ruby = preload("res://game/collectibles/coin_ruby.tscn")
var itens = [gold, ruby]
