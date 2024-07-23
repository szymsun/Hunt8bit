extends Node2D

var ammo = 300


@onready var shoot_audio = $ShootAudio

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("shoot") and ammo > 0:
		shoot_audio.play()
		var bullet = load("res://Assets/Playables/bullet.tscn")
		ammo -= 1
