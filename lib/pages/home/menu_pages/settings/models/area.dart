import 'package:safqa/pages/home/menu_pages/settings/models/city.dart';

class Area {
  int? id;
  String? nameEn;
  String? nameAr;
  int? defaultc;
  City? city;

  Area({this.id, this.nameEn, this.nameAr, this.defaultc, this.city});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    defaultc = json['default'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['default'] = this.defaultc;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    return data;
  }
}
