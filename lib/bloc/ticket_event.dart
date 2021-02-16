part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

class BuyTickets extends TicketEvent {
  final Tickets tickets;
  final String userID;

  BuyTickets(this.tickets, this.userID);

  @override
  List<Object> get props => [tickets, userID];
}

class GetTickets extends TicketEvent {
  final String userID;

  GetTickets(this.userID);
  @override
  List<Object> get props => [userID];
}
