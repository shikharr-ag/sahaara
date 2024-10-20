package com.example.sahaara

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Intent

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.sahaara/audio_service"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "startAudioService" -> {
                    startAudioRecordingService()
                    result.success(null)
                }
                "stopAudioService" -> {
                    stopAudioRecordingService()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun startAudioRecordingService() {
        val serviceIntent = Intent(this, AudioRecordingService::class.java)
        startForegroundService(serviceIntent)
    }

    private fun stopAudioRecordingService() {
        val serviceIntent = Intent(this, AudioRecordingService::class.java)
        stopService(serviceIntent)
    }
}