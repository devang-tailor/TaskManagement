// TODO add common files here
// Note:- Don't add screens and it's provider files except main.dart

export 'dart:convert';
export 'dart:io';
export 'package:flutter/foundation.dart';
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter/rendering.dart';
export 'package:flutter/services.dart';
export 'package:flutter/widgets.dart';

///resource

export 'package:taskmanagement/models/task.dart';
export 'package:taskmanagement/res/ui_extentions/size_extension.dart';
export 'package:taskmanagement/res/theme/theme_data.dart';
export 'package:taskmanagement/res/layout_constant.dart';


/// screens

export 'package:taskmanagement/screens/task_screen/add_task_screen.dart';
export 'package:taskmanagement/screens/task_screen/widgets/task_list.dart';
export 'package:taskmanagement/screens/task_screen/home_screen.dart';
export 'package:taskmanagement/screens/task_screen/provider/theme_provider.dart';


///provider

export 'package:taskmanagement/screens/task_screen/services/task_service.dart';
export 'package:taskmanagement/data/shared_prefrence_storage/shared_pref_service.dart';
export 'package:taskmanagement/screens/task_screen/provider/filter_provider.dart';
export 'package:taskmanagement/screens/task_screen/provider/task_provider.dart';

///storage service
export 'package:path/path.dart';
export 'package:sqflite/sqflite.dart';

/// localization
export 'package:taskmanagement/generated/locale_keys.g.dart';
export 'package:taskmanagement/res/color_constants.dart';


/// Common


export 'package:taskmanagement/utils/commons/widgets/custom_elevated_button.dart';
export 'package:taskmanagement/utils/commons/widgets/text_widgets.dart';
export 'package:taskmanagement/utils/commons/widgets/animated_primary_button.dart';




