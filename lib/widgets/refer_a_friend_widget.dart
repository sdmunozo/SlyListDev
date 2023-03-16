import 'package:flutter/material.dart';
import 'package:slylist_app/screens/referral_code_screen.dart';
import 'package:slylist_app/theme.dart';

class ReferAFriendWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);

    return GestureDetector(
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
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: primaryColorRed,
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.card_travel, size: 50, color: Colors.white),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Invita a tus amigos",
                          style: secondaryTextTitleStyle.copyWith(
                              color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          "Gana hasta \$200",
                          style: secondaryTextBodyStyle.copyWith(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 35, color: Colors.white),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
