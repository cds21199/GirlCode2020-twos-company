import 'package:vaccinator2/main.dart';
import 'package:vaccinator2/models/model.dart';

class Voucher extends Model {

  static String table = 'records';

  int id;
  //FK
  int caregiverID;
  int vaccineID;

  Voucher({ this.id, this.caregiverID, this.vaccineID});

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      'caregiverID': caregiverID,
      'vaccineID': vaccineID,
    };

    if (id != null) { map['id'] = id; }
    return map;
  }

  static Voucher fromMap(Map<String, dynamic> map) {

    return Voucher(
      id: map['id'],
      caregiverID: map['caregiverID'],
      vaccineID: map['vaccineID'],
    );
  }
}