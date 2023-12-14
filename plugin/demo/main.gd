extends Control

@export var scheme = "https"
@export var host = "applinksexample.com"

@onready var open_url_btn = $OpenUrl
@onready var intent_data = $IntentData

func _ready() -> void:
	Applinks.data_received.connect(_on_applinks_data_received)
	open_url_btn.text = scheme + "://" + host


func _on_open_url_pressed() -> void:
	OS.shell_open("https://halgatewood.com/deeplink?link=" + scheme + "%3A%2F%2F" + host)


func _on_applinks_data_received(data: String):
	intent_data.text = data
