
import 'package:demoTabBar/ileft_viewmodel.dart';
import 'package:demoTabBar/left_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> viewmodelProviders = [
  ChangeNotifierProvider<ILeftViewmodel>(create: (_) => LeftViewmodel(),),
];