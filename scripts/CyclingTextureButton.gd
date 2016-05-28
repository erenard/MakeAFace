extends TextureButton

var textureIndex = 0
var textureNames = []
var texture
var position

func _init(_textureNames):
	textureNames = _textureNames
	randomize()
	textureIndex = floor(rand_range(0, textureNames.size()));

func _ready():
	position = get_pos()
	_load_texture()

func _load_texture():
	texture = ResourceLoader.load(textureNames[textureIndex])
	var scale = get_scale()
	var pos = Vector2(position.x - texture.get_width() * scale.x / 2, position.y - texture.get_height() * scale.y / 2)
	set_normal_texture(texture)
	set_pos(pos)

func _on_pressed():
	textureIndex += 1
	if textureIndex == textureNames.size() :
		textureIndex = 0
	_load_texture()
