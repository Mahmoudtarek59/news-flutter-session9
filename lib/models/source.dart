import 'package:flutter/cupertino.dart';

class SourceData {
  String? status;
  List<Source>? source=[];

  SourceData({required this.status,required this.source});
  SourceData.fromJson(Map json) {
    this.status = json["status"] ?? "";
    if(json["sources"]!=null) {
      json["sources"].forEach((element){
        source!.add(Source.formJsom(element));
      });
    }else{
      source = [];
    }

  }
}

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;
  Source(
      {required this.id,
      required this.name,
      required this.description,
      required this.url,
      required this.language,
      required this.country,
      required this.category});
  Source.formJsom(Map json){
    this.id = json["id"]??"";
    this.name = json["name"]??"";
    this.description = json["description"]??"";
    this.url = json["url"]??"www.google.com";
    this.category = json["category"]??"";
    this.language = json["language"]??"en";
    this.country =json["country"]??"eg";
  }
}
