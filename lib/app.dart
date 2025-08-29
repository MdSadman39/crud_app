import 'package:crud_app/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import 'ui/screens/Add_new_product_list_screen.dart';
import 'ui/screens/update_product._screen.dart';

class CrudApp extends StatefulWidget {
  const CrudApp({super.key});

  @override
  State<CrudApp> createState() => _CrudAppState();
}

class _CrudAppState extends State<CrudApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',

      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          fillColor: Colors.white,
          hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;

        if (settings.name == ProductListScreen.name) {
          widget = const ProductListScreen();
        } else if (settings.name == AddNewProductListScreen.name) {
          widget = const AddNewProductListScreen();
        } else if (settings.name == UpdateProductScreen.name) {
          widget = const UpdateProductScreen();
        }

        return MaterialPageRoute(builder: (_) => widget);
      },
    );
  }
}
