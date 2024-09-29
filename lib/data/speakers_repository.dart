import 'package:flutterconflatam_accesibility/data/speakers_data.dart';
import 'package:flutterconflatam_accesibility/models/speaker.dart';

class SpeakersRepository {
  Future<List<Speaker>> fetchSpeakers() async {
    await Future.delayed(const Duration(seconds: 2));
    return speakersData.map((s) => Speaker.fromJson(s)).toList();
  }
}
