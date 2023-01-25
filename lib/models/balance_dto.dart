import 'package:json_annotation/json_annotation.dart';

part 'balance_dto.g.dart';

@JsonSerializable()
class Data {
  final String balance;
  final String availableBalance;

  const Data({this.balance = "", this.availableBalance = ""});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

@JsonSerializable()
class BalanceDTO {
  String status;
  String subCode;
  String message;
  Data data;

  BalanceDTO({this.status = "", this.subCode = "", this.message = "", this.data = const Data()});

  factory BalanceDTO.fromJson(Map<String, dynamic> json) => _$BalanceDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceDTOToJson(this);

}