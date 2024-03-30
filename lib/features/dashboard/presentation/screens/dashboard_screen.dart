import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_state.dart';
import 'package:flutter_chat_gpt/features/dashboard/presentation/providers/dashboard_state_provider.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/widgets/flexible_sliver_app_bar/flexible_sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:rive/rive.dart';

part '../widgets/_chat_list_with_dismiss.dart';
part '../widgets/_dismissible_card.dart';
part '../widgets/_floating_action_gpt_button.dart';

class DashboardScreen extends HookWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController();
    return Stack(
      children: [
        _buildChatList(context, animationController.forward),
        _buildActionButton(animationController.forward),
      ],
    )
        .animate(
          controller: animationController,
          autoPlay: false,
          onComplete: (controller) => controller.reverse(),
        )
        .moveX(
          duration: 400.milliseconds,
          end: 300,
          curve: Curves.easeIn,
        )
        .fadeOut();
  }

  Widget _buildChatList(BuildContext context, Function() forwardAnimation) {
    return CustomScrollView(
      slivers: <Widget>[
        FlexibleSliverAppBar(
          title: AppLocalizations.of(context).chats,
        ),
        _ChatListWithDismiss(
          forwardAnimation: forwardAnimation,
        ),
      ],
    );
  }

  Widget _buildActionButton(Function() forwardAnimation) {
    return Positioned(
      bottom: 110,
      right: 70,
      child: _FloatingActionGptButton(
        forwardAnimation: forwardAnimation,
      ),
    );
  }
}
