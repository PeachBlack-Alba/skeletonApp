import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thebase_app/generated/models/customers.dart';
import '../../generated/api/client.dart';
import '../../generated/api/response.dart';
import 'ContractsState.dart';

class ContractsBloc extends Cubit<ContractsState> {

  ApiClientBase apiClient;

  ContractsBloc({@required this.apiClient}) : super(ContractsState(null));

  Future<ApiResponse<List<CustomerContractModel>>> loadList(String org, String account) {
    var future = apiClient.customersApi.contracts.listByCustomer(org, account);

    future.then((value) {
      emit(ContractsState(value.data));
    });

    return future;
  }
}