import 'package:vaccinator2/main.dart';
import 'package:vaccinator2/models/model.dart';

class Caregiver extends Model {

  static String table = 'caregiver';

  int caregiverID;
  String caregiverFName;
  String caregiverLName;
  String caregiverContact;

  Caregiver({ this.caregiverID, this.caregiverFName, this.caregiverLName, this.caregiverContact});

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      'caregiverID': caregiverID,
      'babyFName': caregiverFName,
      'babyLName': caregiverLName,
      'caregiverContact': caregiverContact,
    };

    if (id != null) { map['id'] = id; }
    return map;
  }

  static Caregiver fromMap(Map<String, dynamic> map) {

    return Caregiver(
      caregiverID: map['caregiverID'],
      caregiverFName: map['babyFName'],
      caregiverLName: map['babyLName'],
      caregiverContact: map['caregiverContact'],

    );
  }
}