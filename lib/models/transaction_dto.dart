import 'package:json_annotation/json_annotation.dart';

part 'transaction_dto.g.dart';


@JsonSerializable()
class TransactionDTO {
  int orderId;
  String orderCurrency;
  double orderAmount;
  String orderStatus;
  String orderNote;
  String createdAt;

  TransactionDTO(this.orderId, this.orderCurrency, this.orderAmount, this.orderStatus, this.orderNote, this.createdAt);

  factory TransactionDTO.fromJson(Map<String, dynamic> json) => _$TransactionDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDTOToJson(this);

}