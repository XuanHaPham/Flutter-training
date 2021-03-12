import 'package:flutter_svg/flutter_svg.dart';

Future<void> initPrecacheImages() async {
  await Future.wait([
    _initSvgAsset('assets/images/logo/logo_with_text.svg'),
  ]);
}

Future<void> _initSvgAsset(String assetName) async {
  await precachePicture(
    ExactAssetPicture(
      SvgPicture.svgStringDecoder,
      assetName,
    ),
    null,
  );
}
