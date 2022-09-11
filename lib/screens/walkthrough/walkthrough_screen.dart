import 'package:flutter/material.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/model/walktrough.dart';
import 'package:intransporia/services/services.dart';
import 'package:intransporia/theme/theme.dart';
import 'package:intransporia/widgets/widgets.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final List<Walktrough> items = Walktrough.walktroughs;
  final NavigationServices _navService = locator<NavigationServices>();
  final PageController _pageController = PageController();
  final double _indicatorSize = 12.0;
  late int _currentPage = 0;
  late bool _isLastIndex = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      key: IntransporiaKeys.walktrough,
      child: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: items.length,
                      onPageChanged: (v) => setState(() {
                        _currentPage = v;
                        _isLastIndex = v == 1;
                      }),
                      itemBuilder: (_, i) => Column(
                        key: IntransporiaKeys.walktroughItem(i),
                        children: [
                          SizedBox(height: AppBar().preferredSize.height * 3),
                          Image.asset(items[i].image, fit: BoxFit.cover),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 42.0,
                              right: 42.0,
                            ),
                            child: Text(
                              items[i].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        items.length,
                        (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(right: 10.0, top: 64.0),
                          height: _currentPage == i
                              ? _indicatorSize
                              : _indicatorSize - 4,
                          width: _currentPage == i
                              ? _indicatorSize
                              : _indicatorSize - 4,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == i
                                ? Theme.of(context).primaryColor
                                : Constants.sky2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(42.0, 0.0, 42.0, 26.0),
              child: _isLastIndex
                  ? DefaultTextButton(
                      title: 'Mulai',
                      onPressed: () => _navService.pushTo(
                        IntransporiaRoutes.auth,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultTextButton(
                          title: 'Skip',
                          onPressed: () => _navService.pushTo(
                            IntransporiaRoutes.auth,
                          ),
                        ),
                        DefaultTextButton(
                          title: 'Lanjut',
                          onPressed: () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
