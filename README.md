# <img src="./plugin/demo/icon.svg" alt="drawing" width="25" style="padding-top: 20px;"/> ReorderableContainer
Applinks plugin for Godot 4.2+ 
====================================
____________________________________


Godot Android Plugin (4.2+) for getting intent data for App Links 

See demo project [`plugin/demo/`](plugin/demo/) (Godot 4.2.0).

**_NOTE:_** Starting in Godot 4.2, Android plugins built on the v1 architecture are now deprecated. Instead, Godot 4.2 introduces a new Version 2 (v2) architecture for Android plugins.

More information about v2 architecture: [official documentation](https://docs.godotengine.org/en/stable/tutorials/platform/android/android_plugin.html "documentation")

Installation
============

1. Grab and extract the latest applinks.zip from the [releases tab](https://github.com/FoolLin/Godot-Applinks-Android-Plugin/releases) into `res://addons/`
   
2. Activate plugin in Godot by navigate to `Project` -> `Project Settings...` -> `Plugins`, and ensure the plugin "Applinks" is enabled.
   
3. In your Anndroid export settings, make sure `Use Gradle Build` is enabled

Build plugin .aar file
----------------------

If there is no plugin release that compatible with your Godot version, you could try generate new plugin .aar file.  

1. Set correct Godot version by edit the gradle file [`plugin/build.gradle.kts`](plugin/build.gradle.kts):

```
dependencies {
    // Update this to match your Godot engine version
    implementation("org.godotengine:godot:4.2.0.stable")
```

2. Compile the project:

	Open command window and *cd* into plugin root directory and run command below
	
	* Windows:
	
		gradlew.bat assemble
		
	* Linux:
	
		./gradlew assemble
	
3. On successful completion of the build, the output files can be found in
  [`plugin/demo/addons/applinks`](plugin/demo/addons/applinks)

# Plugin API

In Android 12 Google has changed the way that web intents get resolved. If you are targeting Android 12 or above you need to implement specific features. 
Read more about it [here](https://developer.android.com/about/versions/12/behavior-changes-all#web-intent-resolution).
	
Methods
-------

***get_data()***  
Return a intent URL string.

Signals
---------------

***data_received(data: String)***  
Emitted when application main activity start or resume.

Constants
-----------

***CUSTOM_MANIFEST_ACTIVITY_ELEMENT***  
Custom intent element block can be added here.

***SINGLETON_NAME***  
An name that applinks plugin will use when adding gdscript wrapper singleton

***PLUGIN_NAME***  
JNISingleton name, this name should not be change unless you know what you are doing.
