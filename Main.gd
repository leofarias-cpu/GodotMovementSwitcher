extends Node2D
var i: int = 1
var current_movement: Node

#preload acontece na compilação e não na execução, retorna um recurso doq leu
#no caso o recurso é a cena toda preparada pra ser instanciada
var platformer = preload("res://Scenes/platformer.tscn")
var eight_way = preload("res://Scenes/8-way_mover.tscn")
var click_move = preload("res://Scenes/click_and_move.tscn")

var movement_types = [platformer, eight_way, click_move]


func _ready():
	#instantiate le aquele recurso como uma classe e seus filhos, 
	#que, com o add_child, é adicionada na cena 
	current_movement = movement_types[0].instantiate()
	add_child(current_movement)
	

func _process(delta):
	if Input.is_action_just_pressed("space"):
		proximo_movimento()
	#isso existe pra testar o metodo so, nao use se quiser mudar o movimento dps
	#pq ele usa a posição do movimento antigo pra determinar a do novo
	if Input.is_action_just_pressed("k"):
		mata_movimentos()
		

func proximo_movimento():
	#Confuso talvez mas aqui eu to salvando a posicao do movimento atual
	var posicao_atual = current_movement.position
	
	current_movement = movement_types[i].instantiate()
	#aqui eu falo que a posicao do movimento novo fica na posicao do movimento antigo
	#fazendo ele nascer em cima do lugar que o velho tava antes de morrer
	current_movement.position = posicao_atual
	mata_movimentos()
	add_child(current_movement)
	i += 1
	if i > len(movement_types) -1 :
		i = 0
	
func mata_movimentos():
	#get_children retorna uma lista como todos os filhos do node
	for node in get_children():
		if node.is_class("CharacterBody2D"):
			#morte
			node.queue_free()
	
