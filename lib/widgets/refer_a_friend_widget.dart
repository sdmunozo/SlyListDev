import 'package:flutter/material.dart';

class ReferAFriendWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFEC193E),
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
                        style: TextStyle(
                          fontFamily: 'Cairo-Bold',
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Gana hasta \$200",
                        style: TextStyle(
                          fontFamily: 'Cairo-Bold',
                          fontSize: 18,
                          color: Colors.white,
                        ),
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
    );
  }
}
