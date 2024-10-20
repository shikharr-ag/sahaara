import 'package:flutter/material.dart';

class Sizing {
  // Private constructor
  Sizing._();
  
  // Singleton instance
  static final Sizing _instance = Sizing._();
  
  // Factory constructor to return the singleton instance
  factory Sizing() => _instance;
  
  // Late initialization for size
  late Size _size;
  
  // Initialize the size using BuildContext
  void init(BuildContext context) {
    _size = MediaQuery.of(context).size;
  }
  
  // Getters for various dimensions
  double get width => _size.width;
  double get height => _size.height;
  
  // Helper methods for responsive sizing
  double wp(double percentage) => width * (percentage / 100);
  double hp(double percentage) => height * (percentage / 100);
  
  // Screen size breakpoints
  bool get isSmallScreen => width < 600;
  bool get isMediumScreen => width >= 600 && width < 1200;
  bool get isLargeScreen => width >= 1200;
  
  // Safe area paddings
  EdgeInsets get padding => MediaQuery.of(_lastContext!).padding;
  
  // Store the last context used
  BuildContext? _lastContext;
  
  // Update context
  void updateContext(BuildContext context) {
    _lastContext = context;
    init(context);
  }
  
  // Check if sizing has been initialized
  bool get isInitialized => _lastContext != null;
}