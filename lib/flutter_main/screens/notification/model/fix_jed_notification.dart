
class FixJedNotification {
  String _createdDate;
  String _subject;
  String _subjectAr;
  String _subjectEn;
  String _content;
  String _contentAr;
  String _contentEn;
  dynamic _imageUrl;
  dynamic _imageUrlAr;
  dynamic _imageUrlEn;

  String get createdDate => _createdDate;

  String get subject => _subject;

  String get subjectAr => _subjectAr;

  String get subjectEn => _subjectEn;

  String get content => _content;

  String get contentAr => _contentAr;

  String get contentEn => _contentEn;

  dynamic get imageUrl => _imageUrl;

  dynamic get imageUrlAr => _imageUrlAr;

  dynamic get imageUrlEn => _imageUrlEn;

  Fix_jed_notification(
      {String createdDate,
      String subject,
      String subjectAr,
      String subjectEn,
      String content,
      String contentAr,
      String contentEn,
      dynamic imageUrl,
      dynamic imageUrlAr,
      dynamic imageUrlEn}) {
    _createdDate = createdDate;
    _subject = subject;
    _subjectAr = subjectAr;
    _subjectEn = subjectEn;
    _content = content;
    _contentAr = contentAr;
    _contentEn = contentEn;
    _imageUrl = imageUrl;
    _imageUrlAr = imageUrlAr;
    _imageUrlEn = imageUrlEn;
  }

  FixJedNotification.fromJson(dynamic json) {
    _createdDate = json["createdDate"];
    _subject = json["subject"];
    _subjectAr = json["subjectAr"];
    _subjectEn = json["subjectEn"];
    _content = json["content"];
    _contentAr = json["contentAr"];
    _contentEn = json["contentEn"];
    _imageUrl = json["imageUrl"];
    _imageUrlAr = json["imageUrlAr"];
    _imageUrlEn = json["imageUrlEn"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["createdDate"] = _createdDate;
    map["subject"] = _subject;
    map["subjectAr"] = _subjectAr;
    map["subjectEn"] = _subjectEn;
    map["content"] = _content;
    map["contentAr"] = _contentAr;
    map["contentEn"] = _contentEn;
    map["imageUrl"] = _imageUrl;
    map["imageUrlAr"] = _imageUrlAr;
    map["imageUrlEn"] = _imageUrlEn;
    return map;
  }

}