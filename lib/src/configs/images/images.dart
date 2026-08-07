class CustomImagesPath {
  CustomImagesPath._();

  static const String folderAssets = 'assets';
  static const String folderImages = 'images';
  static const String folderHome = 'home';

  static const String map = 'map.png';

  static String get mapImagePath =>
      '$folderAssets/$folderImages/$folderHome/$map';
}
