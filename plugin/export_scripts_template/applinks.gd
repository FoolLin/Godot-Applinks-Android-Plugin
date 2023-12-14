extends Node

signal data_received(data: String)

const CUSTOM_MANIFEST_ACTIVITY_ELEMENT = '''
	<intent-filter android:autoVerify="true">
		<action android:name="android.intent.action.VIEW" />
		<category android:name="android.intent.category.DEFAULT" />
		<category android:name="android.intent.category.BROWSABLE" />

		<data android:scheme="https"
			  android:host="applinksexample.com"
			  android:pathPattern="/.*" />
	</intent-filter>
'''
const SINGLETON_NAME = "Applinks"
const PLUGIN_NAME = "applinks"

var applinks

func _ready() -> void:
	if Engine.has_singleton(PLUGIN_NAME):
		applinks = Engine.get_singleton(PLUGIN_NAME)
	elif OS.has_feature("android"):
		printerr("Couldn't find plugin " + PLUGIN_NAME)


func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_RESUMED and OS.has_feature("android"):
		data_received.emit(get_data())


func get_data() -> String:
	if applinks == null:
		printerr("Couldn't find plugin " + PLUGIN_NAME)
		return ""
		
	return applinks.getData()
