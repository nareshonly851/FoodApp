class GetListProductModel {
  String status;
  int count;
  int countTotal;
  int pages;
  List<Products> products;

  GetListProductModel(
      {this.status, this.count, this.countTotal, this.pages, this.products});

  GetListProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    countTotal = json['count_total'];
    pages = json['pages'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['count'] = this.count;
    data['count_total'] = this.countTotal;
    data['pages'] = this.pages;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Products {
  int id;
  Null subCategory;
  String name;
  String image;
  int price;
  int stock;
  int draft;
  String status;
  int createdAt;
  int lastUpdate;
  int weight;
  String unit;
  int mprice;

  Products(
      {this.id,
        this.subCategory,
        this.name,
        this.image,
        this.price,
        this.stock,
        this.draft,
        this.status,
        this.createdAt,
        this.lastUpdate,
        this.weight,
        this.unit,
        this.mprice});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategory = json['sub_category'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    stock = json['stock'];
    draft = json['draft'];
    status = json['status'];
    createdAt = json['created_at'];
    lastUpdate = json['last_update'];
    weight = json['weight'];
    unit = json['unit'];
    mprice = json['mprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sub_category'] = this.subCategory;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['draft'] = this.draft;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['last_update'] = this.lastUpdate;
    data['weight'] = this.weight;
    data['unit'] = this.unit;
    data['mprice'] = this.mprice;
    return data;
  }
}