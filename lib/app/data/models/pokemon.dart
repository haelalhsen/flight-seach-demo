
class Pokemon {
  int? id;
  String? name;
  String? cname;
  String? jname;
  String? image;
  Skills? skills;

  Pokemon({this.id, this.name, this.cname, this.jname, this.image, this.skills});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cname = json['cname'];
    jname = json['jname'];
    image = json['image'];
    skills =
    json['skills'] != null ? new Skills.fromJson(json['skills']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cname'] = this.cname;
    data['jname'] = this.jname;
    data['image'] = this.image;
    if (this.skills != null) {
      data['skills'] = this.skills!.toJson();
    }
    return data;
  }
}

class Skills {
  List<int>? egg;
  List<int>? levelUp;
  List<int>? tm;
  List<int>? transfer;
  List<int>? tutor;

  Skills({this.egg, this.levelUp, this.tm, this.transfer, this.tutor});

  Skills.fromJson(Map<String, dynamic> json) {
    egg = json['egg'].cast<int>();
    levelUp = json['level_up'].cast<int>();
    tm = json['tm'].cast<int>();
    transfer = json['transfer'].cast<int>();
    tutor = json['tutor'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['egg'] = this.egg;
    data['level_up'] = this.levelUp;
    data['tm'] = this.tm;
    data['transfer'] = this.transfer;
    data['tutor'] = this.tutor;
    return data;
  }
}
