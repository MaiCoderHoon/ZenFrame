import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/palette_model.dart';

/// Manages the list of recent palettes and active palette selection.
class PalettesNotifier extends Notifier<List<PaletteModel>> {
  @override
  List<PaletteModel> build() => PaletteModel.samplePalettes;

  void toggleFavorite(String id) {
    state = [
      for (final p in state)
        if (p.id == id) p.copyWith(isFavorite: !p.isFavorite) else p,
    ];
  }

  void remove(String id) {
    state = state.where((p) => p.id != id).toList();
  }
}

final palettesProvider =
    NotifierProvider<PalettesNotifier, List<PaletteModel>>(
        PalettesNotifier.new);

/// Tracks the currently selected palette id for detail view.
final selectedPaletteIdProvider = StateProvider<String?>((ref) => null);
