class SourceNeutrant {
  String? sId;
  Source? source;
  City? city;
  dynamic quantity;
  dynamic price;
  String? unit;
  String? createdAt;
  String? updatedAt;
  dynamic iV;

  SourceNeutrant(
      {this.sId,
      this.source,
      this.city,
      this.quantity,
      this.price,
      this.unit,
      this.createdAt,
      this.updatedAt,
      this.iV});

  SourceNeutrant.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    quantity = json['quantity'];
    price = json['price'];
    unit = json['unit'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    if (source != null) {
      data['source'] = source!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    data['quantity'] = quantity;
    data['price'] = price;
    data['unit'] = unit;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Source {
  String? sId;
  String? fId;
  String? foodName;
  String? category;
  String? likelyToEatIn;
  dynamic quantity;
  dynamic unit;
  dynamic water;
  dynamic vitaminD;
  dynamic omega3FattyAcid;
  dynamic vitaminB12;
  dynamic fiber;
  dynamic vitE;
  dynamic calcium;
  dynamic iron;
  dynamic magnesium;
  dynamic potassium;
  dynamic iV;
  String? image;

  Source(
      {this.sId,
      this.fId,
      this.foodName,
      this.category,
      this.likelyToEatIn,
      this.quantity,
      this.unit,
      this.water,
      this.vitaminD,
      this.omega3FattyAcid,
      this.vitaminB12,
      this.fiber,
      this.vitE,
      this.calcium,
      this.iron,
      this.magnesium,
      this.potassium,
      this.iV,
      this.image});

  Source.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fId = json['f_id'];
    foodName = json['foodName'];
    category = json['category'];
    likelyToEatIn = json['likelyToEatIn'];
    quantity = json['quantity'];
    unit = json['unit'];
    water = json['water'];
    vitaminD = json['vitaminD'];
    omega3FattyAcid = json['omega3FattyAcid'];
    vitaminB12 = json['vitaminB12'];
    fiber = json['fiber'];
    vitE = json['vitE'];
    calcium = json['calcium'];
    iron = json['iron'];
    magnesium = json['magnesium'];
    potassium = json['potassium'];
    iV = json['__v'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['f_id'] = fId;
    data['foodName'] = foodName;
    data['category'] = category;
    data['likelyToEatIn'] = likelyToEatIn;
    data['quantity'] = quantity;
    data['unit'] = unit;
    data['water'] = water;
    data['vitaminD'] = vitaminD;
    data['omega3FattyAcid'] = omega3FattyAcid;
    data['vitaminB12'] = vitaminB12;
    data['fiber'] = fiber;
    data['vitE'] = vitE;
    data['calcium'] = calcium;
    data['iron'] = iron;
    data['magnesium'] = magnesium;
    data['potassium'] = potassium;
    data['__v'] = iV;
    data['image'] = image;
    return data;
  }
}

class City {
  String? sId;
  String? name;
  int? iV;

  City({this.sId, this.name, this.iV});

  City.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['name'] = name;
    data['__v'] = iV;
    return data;
  }
}
