extends Area2D

var velocidad = 200
#var posAnterior = Vector2()
var objetivo = Vector2()
var pantalla
var bala = preload("res://scenes/player/bulletPlayer.tscn")

func _ready():
	pantalla = get_viewport_rect().size
	#set_modulate(Color.white)#Set color

func _input(event):
	objetivo = get_global_mouse_position()
	if event.is_action_pressed("mouse_click_izquierdo") && global_var.estadoJuego == "juego":
		disparar()

func _physics_process(delta):
	#posAnterior = position
	position.x = clamp(position.x,85,pantalla.x - 270)
	
	look_at(objetivo)#Gira en direccion al mouse
	
	#TECLAS DE DIRECCION
	#get_overlapping_bodies().size() == 0 indica que no esta
	#colisionando con ningun cuerpo
	if Input.is_key_pressed(KEY_A) && get_overlapping_bodies().size() == 0:
		position.x -= velocidad * delta
	if Input.is_key_pressed(KEY_D) && get_overlapping_bodies().size() == 0:
		position.x += velocidad * delta
#	if Input.is_action_pressed("ui_up"):
#		position.y -= velocidad * delta
#	if Input.is_action_pressed("ui_down"):
#		position.y += velocidad * delta



func disparar():
	var balaPlayer = bala.instance()
	balaPlayer.inicio(self.position,rotation)
	get_parent().add_child(balaPlayer)
	balaPlayer.position = self.position
	

#func _on_Cuadrado_area_entered(area):
#	if area.is_in_group("enemigo"):
#		area.queue_free()#Elimina la instancia contraria
#		queue_free()#Se destruye asimismo


#func _on_player_body_entered(body):
#	position = posAnterior#Evita que salga de los limites



#func _on_player_area_entered(area):
#	if area.is_in_group("solido"):
#		position = posAnterior
#		print("Colisona con ", area.get_name())
#		print("posAnterior ", posAnterior)
