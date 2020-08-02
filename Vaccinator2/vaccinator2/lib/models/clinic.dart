import 'package:vaccinator2/main.dart';
import 'package:vaccinator2/models/model.dart';

class Clinic extends Model {

  static String table = 'records';

  int id;
  String clinicName;
  String clinicAddress;

  Clinic({ this.id, this.clinicName, this.clinicAddress});

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      'clinicName': clinicName,
      'clinicAddress': clinicAddress,
    };

    if (id != null) { map['id'] = id; }
    return map;
  }

  static Clinic fromMap(Map<String, dynamic> map) {

    return Clinic(
        id: map['id'],
        clinicName: map['clinicName'],
        clinicAddress: map['clinicAddress'],
    );
  }
}