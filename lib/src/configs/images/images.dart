class CustomImagesPath {
  CustomImagesPath._();

  static const String folderAssets = 'assets';
  static const String folderImages = 'images';
  static const String folderHome = 'home';
  static const String folderSelectLocation = 'selectlocation';
  static const String folderRideOption = 'rideoption';

  static const String map = 'map.png';
  static const String maplocation = 'maplocation.png';
  static const String economy = 'economy.png';
  static const String bike = 'bike.png';

  static String get mapImagePath =>
      '$folderAssets/$folderImages/$folderHome/$map';

  static String get maplocationImagePath =>
      '$folderAssets/$folderImages/$folderSelectLocation/$maplocation';
  static String get economyImagePath =>
      '$folderAssets/$folderImages/$folderRideOption/$economy';

  static String get bikeImagePath =>
      '$folderAssets/$folderImages/$folderRideOption/$bike';
}
