
class NewsData{
  String? status;
  int? totalResults;
  List<News>? news=[];
  NewsData.fromJson(Map json){
    this.status =json["status"]??"";
    this.totalResults = json["totalResults"]??0;
    if(json["articles"]!=null){
      json["articles"].forEach((element){
        news!.add(News.fromJson(element));
      });
    }else{
      news = [];
    }
  }

}

class News{
  NewSource? newSource;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  News.fromJson(Map json){
    this.newSource = NewSource.formJson(json["source"]);
    this.author = json["author"]??"";
    this.title = json["title"]??"";
    this.description = json["description"]??"";
    this.url = json["url"]??"www.google.com";
    this.urlToImage = json["urlToImage"]??"https://www.google.com/images/branding/googlelogo/1x/googlelogo_light_color_272x92dp.png";
    this.publishedAt =json["publishedAt"]??"";
    this.content = json["content"]??"";

  }
}

class NewSource{
  String? id;
  String? name;
  NewSource.formJson(Map json){
    this.id = json["id"]??"";
    this.name = json["name"]??"";
  }
}
