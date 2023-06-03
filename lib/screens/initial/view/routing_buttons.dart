import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'initial_page_button.dart';
import 'package:dahae_mobile/screens/initial/viewmodel/initial_page_viewmodel.dart';

class RoutingButtons extends StatelessWidget {
  const RoutingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<InitialPageViewModelImpl>(context);
    return _routingButtons(viewModel, context);
  }

  Widget _routingButtons(viewModel, context) {
    return Column(
      children: [
        InitialPageButton(
          child: const Text('처음 다 해 봐요!'),
          onPressed: () {
            viewModel.goRegisterPage(context);
          },
        ),
        const SizedBox(height: 20),
        InitialPageButton(
          child: const Text('다 해 본 적 있어요'),
          onPressed: () {
            viewModel.goLoginPage(context);
          },
        ),
      ],
    );
  }
}
