import 'package:flutter_test/flutter_test.dart';
import 'package:new_project/main.dart';
import 'package:provider/provider.dart';
import 'package:new_project/view_models/auth/login_view_model.dart';
import 'package:new_project/view_models/auth/posts_view_model.dart';
import 'package:new_project/view_models/auth/register_view_model.dart';
import 'package:new_project/view_models/conversation/conversation_view_model.dart';
import 'package:new_project/view_models/profile/edit_profile_view_model.dart';
import 'package:new_project/view_models/status/status_view_model.dart';
import 'package:new_project/view_models/theme/theme_view_model.dart';
import 'package:new_project/view_models/user/user_view_model.dart';
import 'package:new_project/utils/providers.dart'; // Replace with the actual path to your providers list file

void main() {
  test('providers list contains correct view models', () {
    expect(providers.length, 8);

    expect(providers[0], isA<ChangeNotifierProvider<RegisterViewModel>>());
    expect(providers[1], isA<ChangeNotifierProvider<LoginViewModel>>());
    expect(providers[2], isA<ChangeNotifierProvider<PostsViewModel>>());
    expect(providers[3], isA<ChangeNotifierProvider<EditProfileViewModel>>());
    expect(providers[4], isA<ChangeNotifierProvider<ConversationViewModel>>());
    expect(providers[5], isA<ChangeNotifierProvider<StatusViewModel>>());
    expect(providers[6], isA<ChangeNotifierProvider<UserViewModel>>());
    expect(providers[7], isA<ChangeNotifierProvider<ThemeProvider>>());
  });


}
