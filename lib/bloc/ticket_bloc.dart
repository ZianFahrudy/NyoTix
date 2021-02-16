import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gotixx/models/models.dart';
import 'package:gotixx/services/services.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketState([]));

  @override
  Stream<TicketState> mapEventToState(
    TicketEvent event,
  ) async* {
    if (event is BuyTickets) {
      await TicketServices.saveTickets(event.userID, event.tickets);

      List<Tickets> tickets = state.ticket + [event.tickets];

      yield TicketState(tickets);
    } else if (event is GetTickets) {
      List<Tickets> tickets = await TicketServices.getTickets(event.userID);

      yield TicketState(tickets);
    }
  }
}
