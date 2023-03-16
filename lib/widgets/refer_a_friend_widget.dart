import 'package:flutter/material.dart';
import 'package:slylist_app/screens/referral_code_screen.dart';

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
          color: appTheme.accentColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.card_travel, size: 65, color: Colors.white),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Invita a tus amigos",
                          style: appTheme.textTheme.subtitle1
                              ?.copyWith(color: Colors.white),
                        ),
                        Text(
                          "Gana hasta \$200",
                          style: appTheme.textTheme.subtitle2
                              ?.copyWith(color: Colors.white),
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
