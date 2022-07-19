import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widget/ticket_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  const TicketView({Key? key, required this.ticket }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width*0.8,
      height: AppLayout.getHeight(200),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getWidth(20) ,left: AppLayout.getWidth(5)),
        child: Column(
          children: [
            // blue part of the card/ticket
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF526799),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppLayout.getHeight(20)),
                    topLeft: Radius.circular(AppLayout.getHeight(20))),
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(15)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket["from"]["code"],
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                      const Spacer(),
                      const TicketContainer(),
                      Expanded(
                          child: Stack(children: [
                        SizedBox(
                          height: AppLayout.getHeight(24),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(5)),
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    (constraints.constrainWidth() / 10).floor(),
                                    (index) => SizedBox(
                                      width: AppLayout.getWidth(3),
                                      height: AppLayout.getHeight(1),
                                      child: const DecoratedBox(
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Center(
                          child: Transform.rotate(
                            angle: 1.5,
                            child: const Icon(
                              Icons.local_airport_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ])),
                      const TicketContainer(),
                      const Spacer(),
                      Text(
                        ticket["to"]["code"],
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(3)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          ticket["from"]["name"],
                          style: Styles.headLineStyle4
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Text(ticket["flying_time"],style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          ticket["to"]["name"],
                          textAlign: TextAlign.end,
                          style: Styles.headLineStyle4
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // orange part of the card/ticket
            Container(
              color: Styles.orangeColor,
              child: Row(
                children:[
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppLayout.getHeight(10)),
                          bottomRight: Radius.circular(AppLayout.getHeight(10)),
                        )
                      ),
                    ),
                  ),
                  Expanded(child: Container(
                    padding: EdgeInsets.all(AppLayout.getHeight(10)),
                    child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                      return Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate((constraints.constrainWidth()/15).floor(), (index) => SizedBox(
                          width: AppLayout.getWidth(5),
                          height: AppLayout.getHeight(1),
                          child: const DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                          ),
                        )),
                      );
                    },
                    ),
                  )),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppLayout.getHeight(10)),
                            bottomLeft: Radius.circular(AppLayout.getHeight(10)),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // bottom orange part of the card/ticket
            Container(
              decoration: BoxDecoration(
                color: Styles.orangeColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(AppLayout.getHeight(20)),
                bottomRight: Radius.circular(AppLayout.getHeight(20)))
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(15)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ticket["date"], style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          Gap(AppLayout.getHeight(5)),
                          Text("date", style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(ticket["departure_time"], style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          Gap(AppLayout.getHeight(5)),
                          Text("Departure time", style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(ticket["number"].toString(), style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          Gap(AppLayout.getHeight(5)),
                          Text("Number", style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
