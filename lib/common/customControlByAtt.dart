import 'package:flutter/material.dart';
import 'package:flutter_html_v3/custom_render.dart';
import 'package:flutter_testing/util/Utils.dart';


CustomRenderMatcher backgroundImgMatcher() =>
        (context) => (context.tree.element?.localName == 'div' && context.tree.element?.attributes["background-image"] != null);