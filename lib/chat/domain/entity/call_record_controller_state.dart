import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'call_record_controller_state.g.dart';

@CopyWith()
class CallRecordControllerState extends Equatable {
  final RecorderController recorderController;
  final bool isRecording;
  final bool isPaused;
  final bool isDone;
  final bool isAudio;
  final String? audioPath;
  final Duration elapsedDuration;
  final Duration elapsedDurationPlayer;
  final PlayerController playerController;
  const CallRecordControllerState({
    required this.recorderController,
    required this.isRecording,
    required this.isPaused,
    required this.isDone,
    required this.isAudio,
    this.audioPath,
    required this.elapsedDurationPlayer,
    required this.elapsedDuration,
    required this.playerController,
  });

  @override
  List<Object?> get props => [
        recorderController,
        isRecording,
        isPaused,
        isDone,
        isAudio,
        audioPath,
        elapsedDuration,
        playerController,
        elapsedDurationPlayer,
      ];
}
