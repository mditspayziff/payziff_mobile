import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:untitled/services/generic_service.dart';

import '../models/balance_dto.dart';
import 'loading_state.dart';

class PayoutManager extends ChangeNotifier implements LoaderState{
  @override
  Loader state;

  BalanceDTO _balanceDTO = BalanceDTO();

  PayoutManager(): state = Loader.idle {
    PZService().apiRequest("/cashfree/getBalance", RequestMethod.get, (json) => BalanceDTO.fromJson(json))
        .then((data) => balanceDTO = data);
  }

  BalanceDTO get balanceDTO => _balanceDTO;


  set balanceDTO(BalanceDTO balanceDTO) {
    _balanceDTO = balanceDTO;
    notifyListeners();
  }


}