import 'package:vaccinator2/main.dart';
import 'package:vaccinator2/models/model.dart';

class Records extends Model {

  static String table = 'records';

  int id;
  bool complete;
  DateTime recordDate;
  //as FK
  int vaccineID;
  int babyID;
  int clinicID;

  Records({ this.id, this.complete, this.recordDate, this.vaccineID, this.babyID, this.clinicID});

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      'complete': complete,
      'recordDate': recordDate,
      'vaccineID': vaccineID,
      'babyID': babyID,
      'clinicID': clinicID
    };

    if (id != null) { map['id'] = id; }
    return map;
  }

  static Records fromMap(Map<String, dynamic> map) {

    return Records(
        id: map['id'],
        complete: map['complete'],
        recordDate: map['recordDate'],
        vaccineID: map['vaccineID'],
        babyID: map['babyID'],
        clinicID: map['clinicID']
    );
  }
}