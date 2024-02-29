import 'package:flutter_chat_gpt/core/domain/providers/localization_provider.dart';
import 'package:flutter_chat_gpt/core/domain/providers/theme_provider.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';
import 'package:flutter_chat_gpt/shared/widgets/navigation_bar/cascading_menu_card.dart';
import 'package:flutter_chat_gpt/shared/widgets/navigation_bar/menu_item_button_with_check_mark.dart';
import 'package:flutter_chat_gpt/shared/widgets/custom_widgets/menu_anchor_custom.dart'
    as custom;

class CascadingMenu extends ConsumerWidget {
  const CascadingMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final localizationNotifier = ref.read(localizationProvider.notifier);

    final currentTheme = ref.watch(themeProvider);
    final localization = ref.watch(localizationProvider);

    bool isOpen = false;
    bool isCurrentTheme(ThemeMode theme) => theme == currentTheme;

    String getLocalizationName(String languageCode) {
      switch (languageCode) {
        case "en":
          return AppLocalizations.of(context).english;
        case "ru":
          return AppLocalizations.of(context).russian;
        default:
          return "";
      }
    }

    String getThemeName(ThemeMode mode) {
      switch (mode) {
        case ThemeMode.light:
          return AppLocalizations.of(context).light;
        case ThemeMode.dark:
          return AppLocalizations.of(context).dark;
        case ThemeMode.system:
          return AppLocalizations.of(context).system;
        default:
          return "";
      }
    }

    return Column(
      children: <Widget>[
        custom.MenuAnchor(
          alignmentOffset: const Offset(0, 12),
          onOpen: () => isOpen = true,
          onClose: () => isOpen = false,
          style: MenuStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColors.semiBlack.withOpacity(0.85),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          menuChildren: <Widget>[
            CascadingMenuCard(
              title: AppLocalizations.of(context).language,
              subTitle: getLocalizationName(localization.languageCode),
              icon: AppIcons.textAlignleft,
              cardChildren: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: AppColors.secondarySystemFill, width: 1),
                    ),
                  ),
                  child: MenuItemButtonWithCheckMark(
                    AppLocalizations.of(context).english,
                    onPressed: () =>
                        localizationNotifier.setLocalization(Locale("en")),
                    isShowMark: localization == Locale("en"),
                  ),
                ),
                MenuItemButtonWithCheckMark(
                  AppLocalizations.of(context).russian,
                  onPressed: () =>
                      localizationNotifier.setLocalization(Locale("ru")),
                  isShowMark: localization == Locale("ru"),
                ),
              ],
            ),
            CascadingMenuCard(
              title: AppLocalizations.of(context).theme,
              subTitle: getThemeName(currentTheme),
              icon: AppIcons.circleLefthalfFill,
              cardChildren: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: AppColors.secondarySystemFill, width: 1),
                    ),
                  ),
                  child: MenuItemButtonWithCheckMark(
                    AppLocalizations.of(context).system,
                    onPressed: () => themeNotifier.setTheme(ThemeMode.system),
                    isShowMark: isCurrentTheme(ThemeMode.system),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: AppColors.secondarySystemFill, width: 1),
                    ),
                  ),
                  child: MenuItemButtonWithCheckMark(
                    AppLocalizations.of(context).dark,
                    onPressed: () => themeNotifier.setTheme(ThemeMode.dark),
                    isShowMark: isCurrentTheme(ThemeMode.dark),
                  ),
                ),
                MenuItemButtonWithCheckMark(
                  AppLocalizations.of(context).light,
                  onPressed: () => themeNotifier.setTheme(ThemeMode.light),
                  isShowMark: isCurrentTheme(ThemeMode.light),
                ),
              ],
            ),
          ],
          builder: (BuildContext context, custom.MenuController controller,
              Widget? child) {
            return GestureDetector(
              onTap: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Icon(
                  AppIcons.ellipsisCircle,
                  size: 22,
                  color: isOpen
                      ? AppColors.activeGreen.withOpacity(.2)
                      : AppColors.activeGreen,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
