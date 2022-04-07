import 'dart:convert';


class Customer {
  int ? id;
  String? name;
  String? mobile;
  String? address;
  String? customerGroup;
  String? agent;
  String? agentId;
  String? upozila;
  String? upozilaId;
  String? district;
  String? districtId;
  String? previousAgentName;
  String? previousAgentAddress;
  String? feedId;
  String? farmerType;
  String? previousFeedName;
  String? cultureSpeciesItemAndQty;

  Customer(
      {this.id,
      this.name,
      this.mobile,
      this.address,
      this.customerGroup,
      this.agent,
      this.agentId,
      this.upozila,
      this.upozilaId,
      this.district,
      this.districtId,
      this.previousAgentName,
      this.previousAgentAddress,
      this.feedId,
      this.farmerType,
      this.previousFeedName,
      this.cultureSpeciesItemAndQty});


  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    address = json['address'];
    customerGroup = json['customerGroup'];
    agent = json['agent'];
    agentId = json['agentId'];
    upozila = json['upozila'];
    upozilaId = json['upozilaId'];
    district = json['district'];
    districtId = json['districtId'];
    previousAgentName = json['previousAgentName'];
    previousAgentAddress = json['previousAgentAddress'];
    feedId = json['feed_id'];
    farmerType = json['farmerType'];
    previousFeedName = json['previousFeedName'];
    cultureSpeciesItemAndQty = json['culture_species_item_and_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['customerGroup'] = this.customerGroup;
    data['agent'] = this.agent;
    data['agentId'] = this.agentId;
    data['upozila'] = this.upozila;
    data['upozilaId'] = this.upozilaId;
    data['district'] = this.district;
    data['districtId'] = this.districtId;
    data['previousAgentName'] = this.previousAgentName;
    data['previousAgentAddress'] = this.previousAgentAddress;
    data['feed_id'] = this.feedId;
    data['farmerType'] = this.farmerType;
    data['previousFeedName'] = this.previousFeedName;
    data['culture_species_item_and_qty'] = this.cultureSpeciesItemAndQty;
    return data;
  }
}
