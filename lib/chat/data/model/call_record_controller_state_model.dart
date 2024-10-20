// import 'package:audio_waveforms/audio_waveforms.dart';

// import 'call_record_controller_state.dart';

// class CallRecordControllerStateModel extends CallRecordControllerState {
//   const CallRecordControllerStateModel({
//     required RecorderController recorderController,
//     required bool isRecording,
//     required bool isPaused,
//   }) : super(
//           recorderController: recorderController,
//           isRecording: isRecording,
//           isPaused: isPaused,
//         );

//   // Factory constructor for default initial values
//   factory CallRecordControllerStateModel.initial() {
//     return CallRecordControllerStateModel(
//       recorderController: RecorderController(), // Placeholder, initialize as per your use case
//       isRecording: false,
//       isPaused: false,
//     );
//   }

//   // Method to create an object from a JSON map (deserialization)
//   factory CallRecordControllerStateModel.fromJson(Map<String, dynamic> json) {
//     return CallRecordControllerStateModel(
//       recorderController: RecorderController(), // Customize deserialization for `recorderController`
//       isRecording: json['isRecording'] ?? false,
//       isPaused: json['isPaused'] ?? false,
//     );
//   }

//   // Method to convert the object to a JSON map (serialization)
//   Map<String, dynamic> toJson() {
//     return {
//       'isRecording': isRecording,
//       'isPaused': isPaused,
//       // You can add serialization logic for `recorderController` here if needed
//     };
//   }
// }
