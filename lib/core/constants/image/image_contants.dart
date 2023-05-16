class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants? get instace => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get logo => toPng('name');

  String get hotDog => toPng('hotdogs');

  String toPng(String name) => "asset/image/$name.png";
}
