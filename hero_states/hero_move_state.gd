class_name HeroMoveState
extends State

signal request_roll()
signal request_weapon()

func physics_process(delta: float) -> void:
	var hero = actor as Hero
	var input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	hero.facing_direction = input_vector
	hero.direction = input_vector
	
	if hero.facing_direction.x != 0.0:
		hero.flip_anchor.scale.x = sign(hero.facing_direction.x)
	
	if input_vector != Vector2.ZERO:
		hero.play_animation("run")
		CharacterMover.accelerate_in_direction(hero, input_vector, hero.movement_stats, delta)
	else:
		hero.play_animation("idle")
		CharacterMover.decelerate(hero, hero.movement_stats, delta)
	
	CharacterMover.move(hero)
	
