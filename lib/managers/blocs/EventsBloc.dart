import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thebase_app/managers/apiClients/ApiClientInterface.dart';
import 'package:thebase_app/managers/states/EventsState.dart';

enum EventsEventType {
  loadList
}

class EventsEvent {
  EventsEventType type;

  EventsEvent.fromEventType(EventsEventType eventTypeTemp) {
    type = eventTypeTemp;
  }
}

class EventsBloc extends Bloc<EventsEvent, EventsState> {

  ApiClientInterface apiClient;

  EventsBloc(this.apiClient);

  @override
  EventsState get initialState => EventsState([]);

  @override
  Stream<EventsState> mapEventToState(EventsEvent event) async* {
    switch (event.type) {
      case EventsEventType.loadList:
        yield EventsState(apiClient.getEvents());
        break;
    }
  }
}