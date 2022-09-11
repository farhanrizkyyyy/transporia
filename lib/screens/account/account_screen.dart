import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intransporia/blocs/account/account.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/model/account.dart';
import 'package:intransporia/services/services.dart';
import 'package:intransporia/theme/theme.dart';
import 'package:intransporia/widgets/widgets.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var navService = locator<NavigationServices>();
    Account? account;

    return Scaffold(
      key: IntransporiaKeys.account,
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: Image.asset(IntransporiaImages.pp),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              IntransporiaImages.intransporiaLogo,
              height: 34,
              width: 34,
            ),
          ),
        ],
      ),
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (_, state) {
          if (state is AccountLoading) {
            return const RegularSkeleton();
          } else if (state is AccountLoaded) {
            account = state.account;
          }

          return Container(
            margin: const EdgeInsets.all(20.0),
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${account?.name}',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    DefaultIconButton(
                      onPressed: () => navService.navigateTo(
                        IntransporiaRoutes.editAccount,
                      ),
                      icon: SvgPicture.asset(IntransporiaImages.edit),
                    ),
                  ],
                ),
                AccountListTile(
                  title: '${account?.email}',
                  leading: SvgPicture.asset(IntransporiaImages.message),
                ),
                AccountListTile(
                  title: '${account?.phoneNum}',
                  leading: SvgPicture.asset(IntransporiaImages.call),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  onTap: () => navService.navigateTo(
                    IntransporiaRoutes.editPhoneNum,
                  ),
                ),
                const Divider(),
                AccountListTile(
                  title: 'Logout',
                  leading: SvgPicture.asset(IntransporiaImages.logout),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AccountListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Widget? leading;
  final Widget? trailing;

  const AccountListTile({
    Key? key,
    this.onTap,
    required this.title,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title, style: const TextStyle(color: Constants.sky3)),
      leading: leading,
      trailing: trailing,
    );
  }
}
