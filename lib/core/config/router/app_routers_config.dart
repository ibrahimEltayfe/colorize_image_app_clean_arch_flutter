import 'dart:typed_data';

import 'package:colorize_image/features/home/presentation/pages/home_page.dart';
import 'package:colorize_image/features/home/presentation/pages/image_download_page.dart';
import 'package:flutter/material.dart';

class RoutesManager{
  static Route<dynamic> routes(RouteSettings settings){
    switch(settings.name){
      case HomePage.routeName:
        return MaterialPageRoute(
            builder: (_)=> const HomePage(),
            settings: settings,
        );

      case ImageDownloadPage.routeName:
        return MaterialPageRoute(
          builder: (_)=> ImageDownloadPage(imageBytes: settings.arguments as Uint8List,),
          settings: settings,
        );

      default: return MaterialPageRoute(
        builder: (_)=> const HomePage(),
        settings: settings
      );
    }

  }
}
