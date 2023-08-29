import 'package:shopping_app/core/functions/navigate_to_and_remove.dart';
import 'package:shopping_app/features/home/presentation/widgets/layout_provider.dart';

navigateToLayout(context) {
  navigateToAndRemoveWithFade(
    context: context,
    child: const LayoutProvider(),
  );
}
