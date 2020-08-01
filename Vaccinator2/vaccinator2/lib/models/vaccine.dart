import 'package:vaccinator2/main.dart';
import 'package:vaccinator2/models/model.dart';

class Vaccine extends Model {

  static String table = 'records';

  int vaccineID;
  String vaccineName;
  //FK
  int milestoneID;

  Vaccine({ this.vaccineID, this.vaccineName, this.milestoneID});

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      'vaccineID': vaccineID,
      'vaccineName': vaccineName,
      'milestoneID': milestoneID,
    };

    if (id != null) { map['id'] = id; }
    return map;
  }

  static Vaccine fromMap(Map<String, dynamic> map) {

    return Vaccine(
      vaccineID: map['vaccineID'],
      vaccineName: map['vaccineName'],
      milestoneID: map['milestoneID'],
    );
  }
}