class ProductDataModel{
  int? p_id;
  String? p_name;
  String? p_cost;
  String? p_availability;
  String? p_details;
  String? p_category;
  String? p_imageURL;

  ProductDataModel(
  { this.p_id,
    this.p_name,
    this.p_cost,
    this.p_availability,
    this.p_details,
    this.p_category,
    this.p_imageURL,
  }
  );

  ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    p_id=json['p_id'];
    p_name=json['p_name'];
    p_cost=json['p_cost'];
    p_availability=json['p_availability'];
    p_details=json['p_details'];
    p_category=json['p_category'];
    p_imageURL=json['p_imageURL'];

  }
}