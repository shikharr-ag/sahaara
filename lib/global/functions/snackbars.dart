import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:sahaara/global/sahaara_theme.dart';

class MyFlushbarHelper {
  static const Duration _defaultDuration = Duration(seconds: 3);
  static const double _defaultIconSize = 28.0;
  
  /// Get a success notification flushbar.
  static Flushbar createSuccess({
    required String message,
    String? title,
    Duration duration = _defaultDuration,
    bool isDismissible = true,
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    return Flushbar(
      title: title,
      message: message,
      icon: Icon(
        Icons.check_circle,
        color: AppColors.success,
        size: _defaultIconSize,
      ),
      leftBarIndicatorColor: AppColors.success,
      duration: duration,
      isDismissible: isDismissible,
      flushbarPosition: position,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      animationDuration: const Duration(milliseconds: 500),
      backgroundColor: AppColors.surface,
      titleColor: AppColors.textPrimary,
      messageColor: AppColors.textSecondary,
      boxShadows: [
        BoxShadow(
          color: AppColors.primaryDark.withOpacity(0.1),
          offset: const Offset(0, 2),
          blurRadius: 6,
        )
      ],
    );
  }

  /// Get an information notification flushbar
  static Flushbar createInformation({
    required String message,
    String? title,
    Duration duration = _defaultDuration,
    bool isDismissible = true,
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    return Flushbar(
      title: title,
      message: message,
      icon: Icon(
        Icons.info_outline,
        size: _defaultIconSize,
        color: AppColors.primary,
      ),
      leftBarIndicatorColor: AppColors.primary,
      duration: duration,
      isDismissible: isDismissible,
      flushbarPosition: position,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      animationDuration: const Duration(milliseconds: 500),
      backgroundColor: AppColors.surface,
      titleColor: AppColors.textPrimary,
      messageColor: AppColors.textSecondary,
      boxShadows: [
        BoxShadow(
          color: AppColors.primaryDark.withOpacity(0.1),
          offset: const Offset(0, 2),
          blurRadius: 6,
        )
      ],
    );
  }

  /// Get an error notification flushbar
  static Flushbar createError({
    required String message,
    String? title,
    Duration duration = _defaultDuration,
    bool isDismissible = true,
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    return Flushbar(
      title: title,
      message: message,
      icon: Icon(
        Icons.warning,
        size: _defaultIconSize,
        color: AppColors.error,
      ),
      leftBarIndicatorColor: AppColors.error,
      duration: duration,
      isDismissible: isDismissible,
      flushbarPosition: position,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      animationDuration: const Duration(milliseconds: 500),
      backgroundColor: AppColors.surface,
      titleColor: AppColors.textPrimary,
      messageColor: AppColors.textSecondary,
      boxShadows: [
        BoxShadow(
          color: AppColors.primaryDark.withOpacity(0.1),
          offset: const Offset(0, 2),
          blurRadius: 6,
        )
      ],
    );
  }

  /// Get a flushbar that can receive a user action through a button.
  static Flushbar createAction({
    required String message,
    required Widget button,
    String? title,
    Duration duration = _defaultDuration,
    bool isDismissible = true,
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    return Flushbar(
      title: title,
      message: message,
      duration: duration,
      mainButton: button,
      isDismissible: isDismissible,
      flushbarPosition: position,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      animationDuration: const Duration(milliseconds: 500),
      backgroundColor: AppColors.surface,
      titleColor: AppColors.textPrimary,
      messageColor: AppColors.textSecondary,
      boxShadows: [
        BoxShadow(
          color: AppColors.primaryDark.withOpacity(0.1),
          offset: const Offset(0, 2),
          blurRadius: 6,
        )
      ],
    );
  }

  /// Get a flushbar that shows the progress of an async computation.
  static Flushbar createLoading({
    required String message,
    String? title,
    Duration? duration,
    AnimationController? progressIndicatorController,
    Color? progressIndicatorBackgroundColor,
    bool isDismissible = false,
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    return Flushbar(
      title: title,
      message: message,
      icon: Icon(
        Icons.cloud_upload,
        color: AppColors.accent,
        size: _defaultIconSize,
      ),
      duration: duration,
      showProgressIndicator: true,
      progressIndicatorController: progressIndicatorController,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor ?? AppColors.accentLight,
      isDismissible: isDismissible,
      flushbarPosition: position,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      animationDuration: const Duration(milliseconds: 500),
      backgroundColor: AppColors.surface,
      titleColor: AppColors.textPrimary,
      messageColor: AppColors.textSecondary,
      boxShadows: [
        BoxShadow(
          color: AppColors.primaryDark.withOpacity(0.1),
          offset: const Offset(0, 2),
          blurRadius: 6,
        )
      ],
    );
  }

  /// Get a flushbar that shows a user input form.
  static Flushbar createInputFlushbar({
    required Form textForm,
    bool isDismissible = true,
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    return Flushbar(
      duration: null,
      userInputForm: textForm,
      isDismissible: isDismissible,
      flushbarPosition: position,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      animationDuration: const Duration(milliseconds: 500),
      backgroundColor: AppColors.surface,
      titleColor: AppColors.textPrimary,
      messageColor: AppColors.textSecondary,
      boxShadows: [
        BoxShadow(
          color: AppColors.primaryDark.withOpacity(0.1),
          offset: const Offset(0, 2),
          blurRadius: 6,
        )
      ],
    );
  }

  /// Show a flushbar with customizable options
  static Future<void> showFlushbar(
    BuildContext context,
    Flushbar flushbar,
  ) async {
    await flushbar.show(context);
  }
}