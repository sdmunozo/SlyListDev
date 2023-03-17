import 'package:flutter/material.dart';
import 'package:slylist_app/screens/referral_code_screen.dart';
import 'package:slylist_app/theme.dart';

class ReferAFriendWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReferralCodeScreen(
              referralCode:
                  'ABCD1234', // Reemplaza con el código de referencia real del usuario
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: AppTheme.primaryRed,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: ListTile(
            leading: Icon(Icons.card_travel, size: 50, color: Colors.white),
            title: Text(
              "Invita a tus amigos",
              style: appTheme.textTheme.headline6!
                  .copyWith(color: Colors.white, fontSize: 20),
            ),
            subtitle: Text(
              "Gana hasta \$200",
              style: appTheme.textTheme.bodyText1!
                  .copyWith(color: Colors.white, fontSize: 16),
            ),
            trailing:
                Icon(Icons.arrow_forward_ios, size: 35, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
