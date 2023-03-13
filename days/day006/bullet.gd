extends RigidBody2D

signal delete_terrain

func _give_me_poly(vertices:int, radius: float):
	var angle: float = 2*PI/vertices
	var poly: PackedVector2Array = []
	for i in range(vertices):
		poly.append(Vector2(cos(angle*i)*radius, sin(angle*i)*radius))
	return poly

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("DestructionArea/CollisionPolygon2D").polygon = _give_me_poly(12, 20.0) # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func explode():
	queue_free()

func _on_explode_timer_timeout():
	explode()

func _get_polygon_area(polygon:PackedVector2Array):
	var area = 0.0
	var i = 0
	while i < len(polygon):
		area += polygon[i].x*polygon[(i+1)%len(polygon)].y
		area -= polygon[i].y*polygon[(i+1)%len(polygon)].x
		i+=1
	return abs(area)


func _on_body_entered(body: Node):
	if body.is_in_group("Destructible"):
		var destruct_poly = get_node("DestructionArea/CollisionPolygon2D").polygon
		var i = 0
		while i < len(destruct_poly):
			destruct_poly[i] += position
			i+=1
		var new_poly_arr : Array[PackedVector2Array] = Geometry2D.clip_polygons(body.get_node("CollisionPolygon2D").polygon, destruct_poly)
		if len(new_poly_arr) == 0:
			body.queue_free()
		elif _get_polygon_area(new_poly_arr[0]) <= 100:
			body.queue_free()
			print('antypypec 1')
			#emit_signal("delete_terrain")
		else:
			var new_poly = new_poly_arr[0]
			body.get_node("CollisionPolygon2D").set_deferred("polygon", new_poly)
			body.get_node("Polygon2D").set_deferred("polygon", new_poly)
			var root = body.get_parent()
			print("New area %f" % _get_polygon_area(new_poly))
			i = 1
			while i < len(new_poly_arr):
				var area = _get_polygon_area(new_poly_arr[i])
				if area > 100:
					var new_terrain = body.duplicate()
					new_terrain.name += "a"
					new_terrain.get_node("Polygon2D").polygon = new_poly_arr[i]
					new_terrain.get_node("CollisionPolygon2D").polygon = new_poly_arr[i]
					root.call_deferred("add_child", new_terrain)
				else:
					print('antypypec 2')
				i += 1
		explode()
