import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final colorListProvider = Provider((ref) => colorList);
final isDarkModeProvider = StateProvider((ref) => false);
final selectedColorProvider = StateProvider((ref) => 0);
