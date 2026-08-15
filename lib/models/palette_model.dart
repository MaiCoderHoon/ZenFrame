import 'package:flutter/material.dart';

/// Data model representing a color palette in PaletteSnap.
class PaletteModel {
  final String id;
  final String name;
  final List<Color> colors;
  final DateTime createdAt;
  final String? tag;
  final bool isFavorite;
  final double contrastScore;

  const PaletteModel({
    required this.id,
    required this.name,
    required this.colors,
    required this.createdAt,
    this.tag,
    this.isFavorite = false,
    this.contrastScore = 4.5,
  });

  /// Helper to get hex string representation for a Color
  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }

  /// List of HEX codes for this palette
  List<String> get hexCodes => colors.map(colorToHex).toList();

  PaletteModel copyWith({
    String? id,
    String? name,
    List<Color>? colors,
    DateTime? createdAt,
    String? tag,
    bool? isFavorite,
    double? contrastScore,
  }) {
    return PaletteModel(
      id: id ?? this.id,
      name: name ?? this.name,
      colors: colors ?? this.colors,
      createdAt: createdAt ?? this.createdAt,
      tag: tag ?? this.tag,
      isFavorite: isFavorite ?? this.isFavorite,
      contrastScore: contrastScore ?? this.contrastScore,
    );
  }

  /// Initial realistic sample palettes for demonstration and testing
  static List<PaletteModel> get samplePalettes => [
    PaletteModel(
      id: 'palette_1',
      name: 'Midnight Studio',
      colors: const [
        Color(0xFF0F172A),
        Color(0xFF1E293B),
        Color(0xFF38BDF8),
        Color(0xFF818CF8),
        Color(0xFFF8FAFC),
      ],
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      tag: 'Dark Theme',
      isFavorite: true,
      contrastScore: 7.2,
    ),
    PaletteModel(
      id: 'palette_2',
      name: 'Soft Editorial',
      colors: const [
        Color(0xFF27272A),
        Color(0xFF71717A),
        Color(0xFFD4D4D8),
        Color(0xFFF43F5E),
        Color(0xFFFAFAFA),
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      tag: 'Editorial',
      isFavorite: false,
      contrastScore: 5.4,
    ),
    PaletteModel(
      id: 'palette_3',
      name: 'Neon Contrast',
      colors: const [
        Color(0xFF09090B),
        Color(0xFF22C55E),
        Color(0xFFA855F7),
        Color(0xFFEC4899),
        Color(0xFFF4F4F5),
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      tag: 'Cyberpunk',
      isFavorite: true,
      contrastScore: 8.1,
    ),
    PaletteModel(
      id: 'palette_4',
      name: 'Warm Minimal',
      colors: const [
        Color(0xFF1C1917),
        Color(0xFF78716C),
        Color(0xFFD6D3D1),
        Color(0xFFF97316),
        Color(0xFFFAFAF9),
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
      tag: 'Interior',
      isFavorite: false,
      contrastScore: 4.8,
    ),
  ];
}
