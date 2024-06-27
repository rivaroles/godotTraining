extends CharacterBody2D

var health = 3

@onready var player = $"../Player"
@onready var hurtbox_collision = $CollisionShape2D
@onready var damage_numbers_origin = $DamageNumbersOrigin

func _ready():
	%Slime.play_walk()

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 100.0
	move_and_slide()

func take_damage():
	health -= 1
	DamageNumbers.display_number(health, damage_numbers_origin.global_position)
	%Slime.play_hurt()
	
	if health == 0:
		queue_free()
		
		const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
