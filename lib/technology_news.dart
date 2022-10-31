class Technology {
  String? status;
  Feed? feed;
  List<Items>? items;

  Technology({this.status, this.feed, this.items});

  Technology.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    feed = json['feed'] != null ? Feed.fromJson(json['feed']) : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (feed != null) {
      data['feed'] = feed!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Feed {
  String? url;
  String? title;
  String? link;
  String? author;
  String? description;
  String? image;

  Feed(
      {this.url,
      this.title,
      this.link,
      this.author,
      this.description,
      this.image});

  Feed.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    link = json['link'];
    author = json['author'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['title'] = title;
    data['link'] = link;
    data['author'] = author;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}

class Items {
  String? title;
  String? pubDate;
  String? link;
  String? guid;
  String? author;
  String? thumbnail;
  String? description;
  String? content;
  Enclosure? enclosure;
  List<String>? categories;

  Items(
      {this.title,
      this.pubDate,
      this.link,
      this.guid,
      this.author,
      this.thumbnail,
      this.description,
      this.content,
      this.enclosure,
      this.categories});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    pubDate = json['pubDate'];
    link = json['link'];
    guid = json['guid'];
    author = json['author'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    content = json['content'];
    enclosure = json['enclosure'] != null
        ? Enclosure.fromJson(json['enclosure'])
        : null;
    categories = json['categories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['pubDate'] = pubDate;
    data['link'] = link;
    data['guid'] = guid;
    data['author'] = author;
    data['thumbnail'] = thumbnail;
    data['description'] = description;
    data['content'] = content;
    if (enclosure != null) {
      data['enclosure'] = enclosure!.toJson();
    }
    data['categories'] = categories;
    return data;
  }
}

class Enclosure {
  String? link;
  String? type;

  Enclosure({this.link, this.type});

  Enclosure.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['type'] = type;
    return data;
  }
}
