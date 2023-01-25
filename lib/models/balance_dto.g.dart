// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      balance: json['balance'] as String? ?? "",
      availableBalance: json['availableBalance'] as String? ?? "",
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'balance': instance.balance,
      'availableBalance': instance.availableBalance,
    };

BalanceDTO _$BalanceDTOFromJson(Map<String, dynamic> json) => BalanceDTO(
      status: json['status'] as String? ?? "",
      subCode: json['subCode'] as String? ?? "",
      message: json['message'] as String? ?? "",
      data: json['data'] == null
          ? const Data()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BalanceDTOToJson(BalanceDTO instance) =>
    <String, dynamic>{
      'status': instance.status,
      'subCode': instance.subCode,
      'message': instance.message,
      'data': instance.data,
    };
