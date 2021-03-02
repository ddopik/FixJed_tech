/// id : null
/// createdDate : "2021-02-16T12:35:41.484+00:00"
/// description : "Your Transaction has submitted Successfully"
/// isEnabled : null
/// errors : null
/// title : "Success Transaction"

class FixJedNotification {
  dynamic _id;
  String _createdDate;
  String _description;
  dynamic _isEnabled;
  dynamic _errors;
  String _title;

  dynamic get id => _id;
  String get createdDate => _createdDate;
  String get description => _description;
  dynamic get isEnabled => _isEnabled;
  dynamic get errors => _errors;
  String get title => _title;

  FixJedNotification({
      dynamic id, 
      String createdDate, 
      String description, 
      dynamic isEnabled, 
      dynamic errors, 
      String title}){
    _id = id;
    _createdDate = createdDate;
    _description = description;
    _isEnabled = isEnabled;
    _errors = errors;
    _title = title;
}

  FixJedNotification.fromJson(dynamic json) {
    _id = json["id"];
    _createdDate = json["createdDate"];
    _description = json["description"];
    _isEnabled = json["isEnabled"];
    _errors = json["errors"];
    _title = json["title"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["createdDate"] = _createdDate;
    map["description"] = _description;
    map["isEnabled"] = _isEnabled;
    map["errors"] = _errors;
    map["title"] = _title;
    return map;
  }

}