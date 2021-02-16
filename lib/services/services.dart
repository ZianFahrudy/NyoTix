import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:gotixx/extensions/extensions.dart';
import 'package:gotixx/shared/shared.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotixx/models/models.dart';
import 'package:gotixx/models/movie.dart';

part 'auth_services.dart';
part 'user_services.dart';
part 'movie_services.dart';
part 'ticket_services.dart';
part 'transactions_services.dart';
