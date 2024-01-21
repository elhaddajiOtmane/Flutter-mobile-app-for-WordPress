import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-9213050600051453~1521960454';
    } else if (Platform.isIOS) {
      return 'YOUR_UNIT_ID';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3277946216094091/7476515165';
    } else if (Platform.isIOS) {
      return 'YOUR_UNIT_ID';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
