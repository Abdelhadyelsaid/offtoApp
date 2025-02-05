class SearchModel {
  SearchModel({
    required this.success,
    required this.data,
    required this.message,
    required this.status,
  });

  final bool? success;
  final Data? data;
  final String? message;
  final int? status;

  factory SearchModel.fromJson(Map<String, dynamic> json){
    return SearchModel(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
      status: json["status"],
    );
  }

}

class Data {
  Data({
    required this.items,
    required this.pagination,
  });

  final List<DataItem> items;
  final Pagination? pagination;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      items: json["items"] == null ? [] : List<DataItem>.from(json["items"]!.map((x) => DataItem.fromJson(x))),
      pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );
  }

}

class DataItem {
  DataItem({
    required this.country,
    required this.items,
  });

  final Country? country;
  final List<ItemItem> items;

  factory DataItem.fromJson(Map<String, dynamic> json){
    return DataItem(
      country: json["country"] == null ? null : Country.fromJson(json["country"]),
      items: json["items"] == null ? [] : List<ItemItem>.from(json["items"]!.map((x) => ItemItem.fromJson(x))),
    );
  }

}

class Country {
  Country({
    required this.id,
    required this.name,
    required this.flagImage,
    required this.code,
    required this.isoCode,
    required this.nativeName,
  });

  final int? id;
  final String? name;
  final String? flagImage;
  final String? code;
  final String? isoCode;
  final String? nativeName;

  factory Country.fromJson(Map<String, dynamic> json){
    return Country(
      id: json["id"],
      name: json["name"],
      flagImage: json["flag_image"],
      code: json["code"],
      isoCode: json["iso_code"],
      nativeName: json["native_name"],
    );
  }

}

class ItemItem {
  ItemItem({
    required this.city,
    required this.items,
  });

  final City? city;
  final List<dynamic> items;

  factory ItemItem.fromJson(Map<String, dynamic> json){
    return ItemItem(
      city: json["city"] == null ? null : City.fromJson(json["city"]),
      items: json["items"] == null ? [] : List<dynamic>.from(json["items"]!.map((x) => x)),
    );
  }

}

class City {
  City({
    required this.id,
    required this.name,
    required this.code,
    required this.distance,
    required this.country,
  });

  final int? id;
  final String? name;
  final String? code;
  final dynamic distance;
  final Country? country;

  factory City.fromJson(Map<String, dynamic> json){
    return City(
      id: json["id"],
      name: json["name"],
      code: json["code"],
      distance: json["distance"],
      country: json["country"] == null ? null : Country.fromJson(json["country"]),
    );
  }

}

class Pagination {
  Pagination({
    required this.currentPage,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  final String? currentPage;
  final String? firstPageUrl;
  final String? from;
  final String? lastPage;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String? perPage;
  final String? prevPageUrl;
  final String? to;
  final String? total;

  factory Pagination.fromJson(Map<String, dynamic> json){
    return Pagination(
      currentPage: json["current_page"],
      firstPageUrl: json["first_page_url"],
      from: json["from"],
      lastPage: json["last_page"],
      lastPageUrl: json["last_page_url"],
      nextPageUrl: json["next_page_url"],
      perPage: json["per_page"],
      prevPageUrl: json["prev_page_url"],
      to: json["to"],
      total: json["total"],
    );
  }

}
