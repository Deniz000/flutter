class OnBoardItem {
  final String imagesPath;
  final String header;
  final String description;

  OnBoardItem(this.imagesPath, this.header, this.description);

  static List<OnBoardItem> getOnBoardItems = [
    OnBoardItem(Images.alwaysChat.imagesPath.toString(),
        Images.alwaysChat.header.toString(), Images.alwaysChat.description),
    OnBoardItem(
        Images.biometricAuthentication.imagesPath.toString(),
        Images.biometricAuthentication.header.toString(),
        Images.biometricAuthentication.description),
    OnBoardItem(Images.secure.imagesPath.toString(),
        Images.secure.header.toString(), Images.secure.description),
    OnBoardItem(Images.cloudStorage.imagesPath.toString(),
        Images.cloudStorage.header.toString(), Images.cloudStorage.description),
  ];
}

enum Images {
  biometricAuthentication,
  alwaysChat,
  cloudStorage,
  secure,
}

String imagePath(String name) =>
    "/Users/guldenizozdemir/flutter_learn_process/start_week/demo_pages/lib/onboardings/assets/$name.png";

extension OnBoardItemExtension on Images {
  String? get imagesPath {
    switch (this) {
      case Images.biometricAuthentication:
        return imagePath(Images.biometricAuthentication.name);
      case Images.alwaysChat:
        return imagePath(Images.alwaysChat.name);
      case Images.cloudStorage:
        return imagePath(Images.cloudStorage.name);
      case Images.secure:
        return imagePath(Images.secure.name);
      default:
        return "There is an error in the imagesPath getter";
    }
  }

  String? get header {
    switch (this) {
      case Images.biometricAuthentication:
        return 'Şifreli Kolay Erişim';
      case Images.alwaysChat:
        return 'Her Zaman ve Her Yerde Yanınızdayız';
      case Images.cloudStorage:
        return 'Güvenli ve Kolay Depolama';
      case Images.secure:
        return 'Güvenliğiniz Bizim İçin Önemli';
      default:
        return "There is an error in the header getter";
    }
  }

  String get description {
    switch (this) {
      case Images.biometricAuthentication:
        return 'Parmak izi veya yüz tanıma ile hızlı ve güvenli bir şekilde hesabınıza erişin.';
      case Images.alwaysChat:
        return 'Günün her saati erişim sağlayın ve yapay zeka destekli sohbet ile ihtiyaçlarınıza anında yanıt alın.';
      case Images.cloudStorage:
        return 'Dosyalarınızı bulutta güvenle saklayın ve dilediğiniz her yerden kolayca erişin';
      case Images.secure:
        return 'En son güvenlik önlemleri ile bilgilerinizi koruyoruz, böylece verileriniz her zaman güvende kalır.';
    }
  }
}
