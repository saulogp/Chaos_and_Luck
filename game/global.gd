extends Node

var player: PlayerController

var flightEye = preload("res://game/enemies/flight_eye.tscn")
var mashroom = preload("res://game/enemies/mushroom.tscn")
var enemies = [flightEye, mashroom]

var bluePower = preload("res://game/powers/blue_power.tscn")
var greenPower = preload("res://game/powers/green_power.tscn")
var mypowers = [bluePower, greenPower]

var pizza = preload("res://game/collectibles/pizza.tscn")
var foods = [pizza]

var gold = preload("res://game/collectibles/coin_gold.tscn")
var itens = [gold]
