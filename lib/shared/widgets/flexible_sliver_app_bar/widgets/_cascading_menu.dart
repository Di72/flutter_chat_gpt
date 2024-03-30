part of '../flexible_sliver_app_bar.dart';

class _CascadingMenu extends ConsumerWidget {
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
      mainAxisAlignment: MainAxisAlignment.center,
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
            DecoratedBox(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: AppColors.secondarySystemFill, width: 1),
                ),
              ),
              child: _CascadingMenuCard(
                title: AppLocalizations.of(context).language,
                subTitle: getLocalizationName(localization.languageCode),
                icon: AppIcons.textAlignleft,
                cardChildren: _buildListLocalizationButton(
                    context, localizationNotifier, localization),
              ),
            ),
            _CascadingMenuCard(
              title: AppLocalizations.of(context).theme,
              subTitle: getThemeName(currentTheme),
              icon: AppIcons.circleLefthalfFill,
              cardChildren:
                  _buildListThemeButton(context, themeNotifier, isCurrentTheme),
            ),
          ],
          builder: (BuildContext context, custom.MenuController controller,
              Widget? child) {
            return GestureDetector(
              onTap: () =>
                  controller.isOpen ? controller.close() : controller.open(),
              child: IconWrapper(
                icon: AppIcons.ellipsisCircle,
                verticalPadding: 8,
                color: isOpen
                    ? AppColors.activeGreen.withOpacity(.2)
                    : AppColors.activeGreen,
              ),
            );
          },
        ),
      ],
    );
  }

  List<Widget> _buildListLocalizationButton(BuildContext context,
      LocalizationService localizationNotifier, Locale localization) {
    return <Widget>[
      DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.secondarySystemFill, width: 1),
          ),
        ),
        child: _MenuItemButtonWithCheckMark(
          AppLocalizations.of(context).english,
          onPressed: () =>
              localizationNotifier.setLocalization(const Locale("en")),
          isShowMark: localization == const Locale("en"),
        ),
      ),
      _MenuItemButtonWithCheckMark(
        AppLocalizations.of(context).russian,
        onPressed: () =>
            localizationNotifier.setLocalization(const Locale("ru")),
        isShowMark: localization == const Locale("ru"),
      ),
    ];
  }

  List<Widget> _buildListThemeButton(
      BuildContext context,
      ThemeService themeNotifier,
      bool Function(ThemeMode theme) isCurrentTheme) {
    return <Widget>[
      DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.secondarySystemFill, width: 1),
          ),
        ),
        child: _MenuItemButtonWithCheckMark(
          AppLocalizations.of(context).system,
          onPressed: () => themeNotifier.setTheme(ThemeMode.system),
          isShowMark: isCurrentTheme(ThemeMode.system),
        ),
      ),
      DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.secondarySystemFill, width: 1),
          ),
        ),
        child: _MenuItemButtonWithCheckMark(
          AppLocalizations.of(context).dark,
          onPressed: () => themeNotifier.setTheme(ThemeMode.dark),
          isShowMark: isCurrentTheme(ThemeMode.dark),
        ),
      ),
      _MenuItemButtonWithCheckMark(
        AppLocalizations.of(context).light,
        onPressed: () => themeNotifier.setTheme(ThemeMode.light),
        isShowMark: isCurrentTheme(ThemeMode.light),
      ),
    ];
  }
}
