import 'package:vaccinator2/main.dart';
import 'package:vaccinator2/models/model.dart';

class Vaccine extends Model {

  static String table = 'records';

  int vaccineID;
  String vaccineName;
  String milestone;

  Vaccine({ this.vaccineID, this.vaccineName, this.milestone});

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      'vaccineID': vaccineID,
      'vaccineName': vaccineName,
      'milestone': milestone,
    };

    if (id != null) { map['id'] = id; }
    return map;
  }

  static Vaccine fromMap(Map<String, dynamic> map) {

    return Vaccine(
      vaccineID: map['vaccineID'],
      vaccineName: map['vaccineName'],
      milestone: map['milestone'],
    );
  }
}