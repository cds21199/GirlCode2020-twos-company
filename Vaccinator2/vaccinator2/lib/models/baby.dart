import 'package:vaccinator2/main.dart';
import 'package:vaccinator2/models/model.dart';

class Baby extends Model {

  static String table = 'baby';

  int id;
  String babyFName;
  String babyLName;
  DateTime babyDOB;
  double babyWeight;
  //as FK
  int caregiverID;

  Baby({ this.id, this.babyFName, this.babyLName, this.babyDOB, this.babyWeight, this.caregiverID});

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      'babyFName': babyFName,
      'babyLName': babyLName,
      'babyDOB': babyDOB,
      'babyWeight': babyWeight,
      'caregiverID': caregiverID
    };

    if (id != null) { map['id'] = id; }
    return map;
  }

  static Baby fromMap(Map<String, dynamic> map) {

    return Baby(
        id: map['id'],
        babyFName: map['babyFName'],
        babyLName: map['babyLName'],
        babyDOB: map['babyDOB'],
        babyWeight: map['babyWeight'],
        caregiverID: map['caregiverID'],
    );
  }
}