import 'package:flutter/material.dart';

import 'app/my_app.dart';
import 'core/dependency_injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjection();
  runApp(const MyApp());
}