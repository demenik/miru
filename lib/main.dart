import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:miru/extensions/l10n.dart';
import 'package:miru/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MiruApp());
}

class MiruApp extends StatelessWidget {
  const MiruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: theme.appBarTheme.systemOverlayStyle!,
      child: MaterialApp(
        title: 'Miru',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: theme,
        home: const TabRouter(),
      ),
    );
  }
}

class TabRouter extends StatefulWidget {
  const TabRouter({super.key});

  @override
  State<StatefulWidget> createState() => _TabRouterState();
}

class _TabRouterState extends State<StatefulWidget> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTabIndex,
        children: const [
          NavigatorView(child: Text("Home")),
          NavigatorView(child: Text("Search")),
          NavigatorView(child: Text("Settings")),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() => currentTabIndex = index);
        },
        animationDuration: const Duration(seconds: 0),
        selectedIndex: currentTabIndex,
        destinations: <NavigationDestination>[
          NavigationDestination(
            icon: const Icon(Icons.home_rounded),
            label: context.l10n!.tabHome,
          ),
          NavigationDestination(
            icon: const Icon(Icons.search_rounded),
            label: context.l10n!.tabSearch,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_rounded),
            label: context.l10n!.tabSettings,
          )
        ],
      ),
    );
  }
}

class NavigatorView extends StatelessWidget {
  final Widget child;

  const NavigatorView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => child);
        },
      ),
    );
  }
}
