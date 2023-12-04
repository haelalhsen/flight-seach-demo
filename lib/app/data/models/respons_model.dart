
import 'flight_model.dart';

class Respons {
  int? status;
  Datum? data;

  Respons({this.status, this.data});

  Respons.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Datum.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class Datum {
  Meta? meta;
  List<Flight>? flights;
  Dictionaries? dictionaries;
  Airlines? airlines;

  Datum({this.meta, this.flights, this.dictionaries, this.airlines});

  Datum.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      flights = <Flight>[];
      json['data'].forEach((v) { flights!.add(new Flight.fromJson(v)); });
    }
    dictionaries = json['dictionaries'] != null ? new Dictionaries.fromJson(json['dictionaries']) : null;
    airlines = json['airlines'] != null ? new Airlines.fromJson(json['airlines']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.flights != null) {
      data['data'] = this.flights!.map((v) => v.toJson()).toList();
    }
    if (this.dictionaries != null) {
      data['dictionaries'] = this.dictionaries!.toJson();
    }
    if (this.airlines != null) {
      data['airlines'] = this.airlines!.toJson();
    }
    return data;
  }
}
