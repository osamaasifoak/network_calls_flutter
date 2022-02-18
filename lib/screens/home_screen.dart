import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_network_calls/components/error_component.dart';
import 'package:sample_network_calls/components/loaders/simple_loader_component.dart';
import 'package:sample_network_calls/constants/colors/color_constants.dart';
import 'package:sample_network_calls/providers/sample_calls_providers.dart';
import 'package:sample_network_calls/wrappers/user_list_wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SampleCallsProvider _callsProvider;
  late UserListWrapper? _userListWrapper;
  bool showLoader = true;
  @override
  void initState() {
    _callsProvider = Provider.of<SampleCallsProvider>(context, listen: false);
    _callsProvider.getUserList().then((value) {
      _userListWrapper = value;
      setState(() {
        showLoader = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Network calls in flutter"),
      ),
      body: Container(
        height: _height,
        width: _width,
        child: Consumer<SampleCallsProvider>(
            child: SimpleLoaderComponent(),
            builder: (context, consumer, child) {
              if (showLoader) {
                return child!;
              } else if (_userListWrapper != null) {
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      showLoader = true;
                    });
                    _userListWrapper = await _callsProvider.getUserList();
                    setState(() {
                      showLoader = false;
                    });
                  },
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      UserLisData user = _userListWrapper!.data![index];
                      return ListTile(
                        title: Text(user.firstName!),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(user.avatar!),
                        ),
                        subtitle: Text(user.email!),
                      );
                    },
                    itemCount: _userListWrapper!.data!.length,
                  ),
                );
              } else {
                return ErrorComponent(
                  message: "${consumer.error}",
                  onTap: () async {
                    setState(() {
                      showLoader = true;
                    });
                    _userListWrapper = await _callsProvider.getUserList();
                    setState(() {
                      showLoader = false;
                    });
                  },
                );
              }
            }),
      ),
    );
  }
}
