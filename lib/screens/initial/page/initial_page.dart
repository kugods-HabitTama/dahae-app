import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dahae_mobile/screens/initial/view/routing_buttons.dart';
import 'package:dahae_mobile/screens/initial/viewmodel/initial_page_viewmodel.dart';

class InitialScreen extends StatelessWidget {
  InitialScreen({super.key});

  late final _viewModel = InitialPageViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage('assets/images/logo_3d.png'), height: 150),
              const SizedBox(height: 25),
              const Text.rich(TextSpan(children: [
                TextSpan(text: '하고 싶은 거 '),
                TextSpan(
                  text: '다 해 ',
                  // style: themeData.textTheme.bodyText1
                  //         ?.copyWith(color: themeData.highlightColor) ??
                  //     themeData.textTheme.bodyText1
                ),
                TextSpan(text: '보자')
              ])),
              const SizedBox(height: 10),
              const Text('다마고치 해빗 트래커'),
              const SizedBox(height: 70),
              routingButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget routingButtons() {
    return ChangeNotifierProvider<InitialPageViewModelImpl>.value(
        value: _viewModel, child: RoutingButtons());
  }
}
