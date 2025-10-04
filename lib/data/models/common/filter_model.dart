class FilterModel {
  int? limit;
  int? offset;
  String? search;
  int? categoryId;

  FilterModel({this.limit = 20, this.offset, this.search, this.categoryId});

  FilterModel.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
    search = json['search'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (limit != null) data['limit'] = limit;
    if (offset != null) data['offset'] = offset;
    if (search != null) data['search'] = search;
    if (categoryId != null) data['category_id'] = categoryId;

    return data;
  }
}
