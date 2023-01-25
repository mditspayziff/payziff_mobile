// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDTO _$TransactionDTOFromJson(Map<String, dynamic> json) =>
    TransactionDTO(
      json['orderId'] as int,
      json['orderCurrency'] as String,
      (json['orderAmount'] as num).toDouble(),
      json['orderStatus'] as String,
      json['orderNote'] as String,
      json['createdAt'] as String,
    );

Map<String, dynamic> _$TransactionDTOToJson(TransactionDTO instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderCurrency': instance.orderCurrency,
      'orderAmount': instance.orderAmount,
      'orderStatus': instance.orderStatus,
      'orderNote': instance.orderNote,
      'createdAt': instance.createdAt,
    };
