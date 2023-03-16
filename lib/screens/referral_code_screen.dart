import 'package:flutter/material.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';

class ReferralCodeScreen extends StatelessWidget {
  final String referralCode;

  ReferralCodeScreen({required this.referralCode});

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);

    return Scaffold(
      backgroundColor: appTheme.canvasColor,
      appBar: CustomAppBar(title: 'Invita a tus amigos'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Comparte tu código de referencia',
                style: appTheme.textTheme.headline5?.copyWith(
                  color: appTheme.primaryColor,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: appTheme.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  referralCode,
                  style: appTheme.textTheme.headline1?.copyWith(
                    fontSize: 48,
                    color: appTheme.canvasColor,
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Tus amigos recibirán beneficios al unirse con tu código',
                style: appTheme.textTheme.bodyText1?.copyWith(
                  color: appTheme.primaryColor,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
