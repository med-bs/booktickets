import 'package:booktickets/utils/app_layout.dart';
import 'package:flutter/material.dart';

class AppTicketTab extends StatelessWidget {
  final String leftTab;
  final String rightTab;
  const AppTicketTab({Key? key, required this.leftTab, required this.rightTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return FittedBox(
      child: Container(
        padding: EdgeInsets.all(AppLayout.getHeight(3.5)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getHeight(50)),
          color: const Color(0xFFF4F6FD),
        ),
        child: Row(
          children: [
            // airline
            Container(
              width: size.width * .44,
              padding:
              EdgeInsets.symmetric(vertical: AppLayout.getHeight(10)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(AppLayout.getHeight(50))),
                color: Colors.white,
              ),
              child: Center(child: Text(leftTab)),
            ),
            // hotel
            Container(
              width: size.width * .44,
              padding:
              EdgeInsets.symmetric(vertical: AppLayout.getHeight(10)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(AppLayout.getHeight(50))),
                color: Colors.transparent,
              ),
              child: Center(child: Text(rightTab)),
            ),
          ],
        ),
      ),
    );
  }
}
