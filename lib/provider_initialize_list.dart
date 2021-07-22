import 'package:provider/provider.dart';
import 'package:sample_network_calls/providers/sample_calls_providers.dart';

providersList(context) {
  return [
    ChangeNotifierProvider(
      create: (context) => SampleCallsProvider(),
    ),
    //   ChangeNotifierProvider(
    //     create: (context) => AuthProvider(),
    //   ),
    //   ChangeNotifierProvider(
    //     create: (context) => UserProvider(),
    //   ),
    //   ChangeNotifierProvider(
    //     create: (context) => OnboardingProvider(),
    //   ),
    //   ChangeNotifierProvider(
    //     create: (context) => CreatePostProvider(),
    //   ),
    //   ChangeNotifierProvider(
    //     create: (context) => FeedMainProvider(),
    //   ),
    //   ChangeNotifierProvider(
    //     create: (context) => ChatProvider(),
    //   ),
  ];
}
