import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gotixx/models/models.dart';
import 'package:gotixx/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      UserModels user = await UserServices.getUsers(event.id);

      yield UserLoaded(user);
    } else if (event is SignOutUser) {
      yield UserInitial();
    } else if (event is UpdateDataUser) {
      UserModels user = (state as UserLoaded)
          .user
          .copyWith(name: event.name, profilePicture: event.profilePicture);

      await UserServices.updateUsers(user);
      yield UserLoaded(user);
    } else if (event is TopUp) {
      if (state is UserLoaded) {
        try {
          UserModels updatedUsers = (state as UserLoaded).user.copyWith(
              balance: (state as UserLoaded).user.balance + event.amount);

          await UserServices.updateUsers(updatedUsers);

          yield UserLoaded(updatedUsers);
        } catch (e) {
          print(e);
        }
      }
    } else if (event is Purchase) {
      if (state is UserLoaded) {
        try {
          UserModels updatedUsers = (state as UserLoaded).user.copyWith(
              balance: (state as UserLoaded).user.balance - event.amount);

          await UserServices.updateUsers(updatedUsers);

          yield UserLoaded(updatedUsers);
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
