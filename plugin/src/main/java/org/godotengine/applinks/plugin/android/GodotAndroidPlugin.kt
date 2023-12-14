// TODO: Update to match your plugin's package name.
package org.godotengine.applinks.plugin.android

import android.util.Log
import android.widget.Toast
import org.godotengine.godot.Godot
import org.godotengine.godot.plugin.GodotPlugin
import org.godotengine.godot.plugin.UsedByGodot
import org.godotengine.godot.GodotFragment

class GodotAndroidPlugin(godot: Godot): GodotPlugin(godot) {

    override fun getPluginName() = BuildConfig.GODOT_PLUGIN_NAME

    @UsedByGodot
    fun getData(): String? {
        val url = GodotFragment.getCurrentIntent()?.dataString
        GodotFragment.getCurrentIntent().data = null
        return url
    }
}
