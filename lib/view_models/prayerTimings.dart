import 'package:adhan_dart/adhan_dart.dart';

class PrayerTimingFunctions {
  static remainingTime(
    PrayerTimes prayerTimes,
  ) async* {
    yield* Stream.periodic(
      Duration(seconds: 1),
      (t) {
        String prayer = prayerTimes.nextPrayer();
        DateTime nextPrayerTime = prayerTimes.timeForPrayer(prayer)!.toLocal();
        DateTime now = DateTime.now();
        Duration remains = nextPrayerTime.difference(now);
        return secondsToHour(remains.inSeconds);
      },
    );
  }

  static String secondsToHour(int seconds) {
    int minutes = seconds ~/ 60;
    int hour = minutes ~/ 60;
    seconds = seconds - minutes * 60;
    minutes = minutes - hour * 60;
    return "$hour:$minutes:$seconds";
  }
}
