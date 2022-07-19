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
      height: 200,
      child: Container(
        margin: const EdgeInsets.only(right: 20 ,left: 5),
        child: Column(
          children: [
            // blue part of the card/ticket
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF526799),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(15),
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
                          height: 24,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    (constraints.constrainWidth() / 10).floor(),
                                    (index) => const SizedBox(
                                      width: 3,
                                      height: 1,
                                      child: DecoratedBox(
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
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          ticket["from"]["name"],
                          style: Styles.headLineStyle4
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Text(ticket["flying_time"],style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                      SizedBox(
                        width: 100,
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
                  const SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      ),
                    ),
                  ),
                  Expanded(child: Container(
                    padding: const EdgeInsets.all(10),
                    child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                      return Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate((constraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                          width: 5,
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                          ),
                        )),
                      );
                    },
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
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
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ticket["date"], style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          const Gap(5),
                          Text("date", style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(ticket["departure_time"], style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          const Gap(5),
                          Text("Departure time", style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(ticket["number"].toString(), style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          const Gap(5),
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
