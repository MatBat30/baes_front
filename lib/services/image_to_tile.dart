part of '../main.dart';

/// Exemple d'un TileProvider personnalisé (pour les tuiles de la carte).
class CustomTileProvider extends TileProvider {
  final Map<String, Uint8List> tileCache;

  CustomTileProvider(this.tileCache);

  Uint8List _getPlaceholderTile() {
    return Uint8List.fromList([
      // Octets d'une image PNG minimale transparente
      0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,
      0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,
      0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
      0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4,
      0x89, 0x00, 0x00, 0x00, 0x0A, 0x49, 0x44, 0x41,
      0x54, 0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00,
      0x05, 0x00, 0x01, 0x0D, 0x0A, 0x2D, 0xB4, 0x00,
      0x00, 0x00, 0x00, 0x49, 0x45, 0x4E, 0x44, 0xAE,
      0x42, 0x60, 0x82
    ]);
  }

  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) {
    if (tileCache.isNotEmpty) {
      return MemoryImage(tileCache.values.first);
    }
    return MemoryImage(_getPlaceholderTile());
  }
}
