part of 'ticket_bloc.dart';

class TicketState extends Equatable {
  final List<Tickets> ticket;
  TicketState(this.ticket);

  @override
  List<Object> get props => [ticket];
}
