library iblaze.globals;

import 'package:get_storage/get_storage.dart';
import 'package:iblaze/Models/conductor.dart';
import 'package:iblaze/Models/offre.dart';
import 'package:iblaze/Models/user.dart';

User? currentUser = null;

List<OffreModel> currentOffre = <OffreModel>[];
Conductor? currentConductor = null;
final userData = GetStorage();
final ConductorData = GetStorage();
bool checkLogin = false;
bool checkRegister = false;
bool checkUpdate = false;
bool checkLoginCondcuctor = false;
bool checkRegisterCondcuctor = false;
