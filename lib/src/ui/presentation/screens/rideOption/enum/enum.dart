import 'package:ridex_mobile_app/src/configs/images/images.dart';

enum RideType {
  economy,
  comfort,
  xl,
  bike,
}

extension RideTypeExtension on RideType {
  String get title {
    switch (this) {
      case RideType.economy:
        return 'Economy';
      case RideType.comfort:
        return 'Comfort';
      case RideType.xl:
        return 'XL';
      case RideType.bike:
        return 'Bike';
    }
  }

  String get seats {
    switch (this) {
      case RideType.economy:
        return '4 Seats';
      case RideType.comfort:
        return '4 Seats';
      case RideType.xl:
        return '6 Seats';
      case RideType.bike:
        return '1 Seat';
    }
  }

  String get price {
    switch (this) {
      case RideType.economy:
        return 'PKR 450';
      case RideType.comfort:
        return 'PKR 650';
      case RideType.xl:
        return 'PKR 900';
      case RideType.bike:
        return 'PKR 250';
    }
  }

  String get imagePath {
    switch (this) {
      case RideType.economy:
        return CustomImagesPath.economyImagePath;
      case RideType.comfort:
        return CustomImagesPath.economyImagePath;
      case RideType.xl:
        return CustomImagesPath.economyImagePath;
      case RideType.bike:
        return CustomImagesPath.bikeImagePath;
    }
  }
}