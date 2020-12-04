import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Blocs {
  BuildContext _context;

  Blocs(BuildContext context) {
    _context = context;
  }

  AuthBloc get auth => BlocProvider.of<AuthBloc>(_context);

  ContractsBloc get contracts => BlocProvider.of<ContractsBloc>(_context);

  EventsBloc get events => BlocProvider.of<EventsBloc>(_context);
}
