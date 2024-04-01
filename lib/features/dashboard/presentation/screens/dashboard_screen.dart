import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_state.dart';
import 'package:flutter_chat_gpt/features/dashboard/presentation/providers/dashboard_state_provider.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/main/app_scaffold.dart';
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
    // Initialize an animation controller to control animations programmatically.
    final animationController = useAnimationController();

    // Use a Stack to overlay the chat list and action button on the screen.
    return Stack(
      children: [
        // Build the main chat list with a custom scroll view and flexible app bar.
        _buildChatList(context, animationController.forward),
        // Add an action button that can trigger an animation or action when tapped.
        _buildActionButton(animationController.forward),
      ],
    )
        // Apply animations to the entire Stack widget. These animations are controlled
        // by the animationController defined above.
        .animate(
          controller: animationController,
          autoPlay: false,
          onComplete: (controller) =>
              controller.reverse(), // Reverse the animation once it's complete.
        )
        .moveX(
          duration: $styles.times.fast,
          end: $styles.scale * 300,
          curve: Curves.easeIn,
        )
        .fadeOut(); // Apply a fade-out effect at the end of the animation.
  }

  // Helper method to build the chat list component of the screen.
  Widget _buildChatList(BuildContext context, Function() forwardAnimation) {
    return CustomScrollView(
      slivers: <Widget>[
        // Add a flexible sliver app bar at the top of the chat list.
        FlexibleSliverAppBar(
          title: AppLocalizations.of(context).chats,
        ),
        // Include the chat list widget with dismissible chat items.
        _ChatListWithDismiss(
          forwardAnimation: forwardAnimation,
        ),
      ],
    );
  }

  // Helper method to build the floating action button that triggers animations.
  Widget _buildActionButton(Function() forwardAnimation) {
    return Positioned(
      bottom: $styles.insets.offset,
      right: $styles.insets.xxl,
      child: _FloatingActionGptButton(
        forwardAnimation: forwardAnimation,
      ),
    );
  }
}
