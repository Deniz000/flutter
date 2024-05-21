import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData getIconData(String iconName) {
  switch (iconName) {
    case 'instagram':
      return FontAwesomeIcons.instagram;
    case 'skype':
      return FontAwesomeIcons.skype;
    case 'google':
      return FontAwesomeIcons.google;
    case 'dribbble':
      return FontAwesomeIcons.dribbble;
    default:
      return FontAwesomeIcons.exclamation; // Varsayılan bir ikon
  }
}
