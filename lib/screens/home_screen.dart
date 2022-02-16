import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_network_calls/components/error_component.dart';
import 'package:sample_network_calls/components/loaders/simple_loader_component.dart';
import 'package:sample_network_calls/constants/colors/color_constants.dart';
import 'package:sample_network_calls/providers/sample_calls_providers.dart';
import 'package:sample_network_calls/wrappers/user_list_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    final SampleCallsProvider _callsProvider =
        Provider.of<SampleCallsProvider>(context, listen: false);
    _callsProvider.getUserList();
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
              if (consumer.showLoader) {
                return child!;
              } else if (consumer.userListWrapper != null) {
                return RefreshIndicator(
                    onRefresh: () async {
                      consumer.changeLoaderState(true);
                      await _callsProvider.getUserList();
                    },
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        UserLisData user =
                            consumer.userListWrapper!.data![index];
                        return ListTile(
                          title: Text(user.firstName!),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(user.avatar!),
                          ),
                          subtitle: Text(user.email!),
                        );
                      },
                      itemCount: consumer.userListWrapper!.data!.length,
                    ));
              } else {
                return ErrorComponent(
                  message: "${consumer.error}",
                  onTap: () async {
                    consumer.changeLoaderState(true);
                    await _callsProvider.getUserList();
                  },
                );
              }
            }),
      ),
    );
  }
}
