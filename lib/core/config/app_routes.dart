import 'package:flutter/widgets.dart';
import 'package:template/presentation/pages/home.dart';

const String home = '/home';

final Map<String, Widget Function(BuildContext)> routes = {
  home: (_) => const TwHome(),
};
