extends Node2D

const BULLET = preload("res://Assets/Playables/bullet.tscn")


var ammo = int()


@onready var shoot_audio = $ShootAudio

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Input.is_action_just_pressed("shoot") and ammo > 0:
		shoot_audio.play()

