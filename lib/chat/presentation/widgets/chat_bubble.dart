import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahaara/chat/presentation/screens/text_chat_screen.dart';
import 'package:sahaara/global/extension/date_time_extension.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sizer/sizer.dart';

import '../../data/model/message_model.dart';
import '../utils/chat_utils.dart';

class ChatBubble extends StatefulWidget {
  final MessageModel messageModel;
  const ChatBubble({super.key, required this.messageModel});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  final PlayerController playerController = PlayerController();
  @override
  Widget build(BuildContext context) {
    bool isAiGen = widget.messageModel.uid.isEmpty;
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: 100.w, maxWidth: 100.w, minHeight: 40, maxHeight: 50.h),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment:
              isAiGen ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: isAiGen ? AppColors.accentDark : AppColors.primaryDark,
                borderRadius: isAiGen
                    ? BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8))
                    : BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: isAiGen
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AudioFileWaveforms(
                            waveformType: WaveformType.fitWidth,
                            padding: EdgeInsets.only(right: 5),
                            size: Size(50.w - 30, 30),
                            playerController: playerController,
                            waveformData: widget.messageModel.waveformData,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: isAiGen
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Container(
                        width: 50.w,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          '"${widget.messageModel.text}"',
                          style: GoogleFonts.urbanist(
                              color: Colors.white, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    Align(
                      alignment: isAiGen
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Container(
                        width: 50.w,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: Text(
                          widget.messageModel.createdAt.toLocal24HourFormat(),
                          style: GoogleFonts.urbanist(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 12,
                          ),
                          textAlign: isAiGen ? TextAlign.left : TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
