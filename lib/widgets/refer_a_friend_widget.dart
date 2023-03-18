import 'package:flutter/material.dart';
import 'package:slylist_app/screens/referral_code_screen.dart';
import 'package:slylist_app/theme.dart';
import 'package:slylist_app/widgets/card_widget.dart';

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
      child: CardWidget(
        title: "Invita a tus amigos",
        subtitle: "Gana hasta \$200",
        leadingIcon: Icons.card_travel,
        trailingIcon: Icons.arrow_forward_ios,
        cardColor: Color(0xFF00008B),
        titleFontSize: 20,
        subtitleFontSize: 16,
      ),
    );
  }
}
