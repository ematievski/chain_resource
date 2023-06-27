import 'dart:math';

import 'package:flutter/material.dart';

class ChainBarWidget extends StatefulWidget {
  ChainBarWidget({
    Key? key,
    required this.x,
  }) : super(key: key);

  double x;

  @override
  State<ChainBarWidget> createState() => _ChainBarWidgetState();
}

class _ChainBarWidgetState extends State<ChainBarWidget> {
  void _incrementCounter() {
    setState(() {
      widget.x = widget.x + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: 210,
      width: MediaQuery.of(context).size.width - 30,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 185, 238, 255),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                width: 90,
                height: 90,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)), //123
                child: radialPercentWidget(
                  percent: widget.x / 100,
                  fillColor: const Color.fromARGB(255, 185, 238, 255),
                  lineColor: Colors.blue,
                  freeColor: const Color.fromARGB(255, 255, 255, 255),
                  lineWidth: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(5.5),
                    child: Center(
                        child: Text(
                      '${widget.x.toStringAsFixed(1)} %',
                      style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 4,
              left: 105,
              child: Container(
                  width: 180,
                  height: 90,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.green)),
                  child: const Center(
                      child: Text(
                    'Цепь_1',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500),
                  ))),
            ),
            Positioned(
              top: 108,
              left: 20,
              child: Container(
                  width: 180,
                  height: 75,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Пройдено: 100км',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'До смены цепи: 150км',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Общий пробег: 500км',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
            ),
            Positioned(
              top: 6,
              right: 1,
              child: ElevatedButton(
                onPressed: () {
                  _incrementCounter();
                  print(widget.x);
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(13),
                  backgroundColor: Colors.white, // <-- Button color
                  foregroundColor: Colors.blue, // <-- Splash color
                ),
                child: const Icon(Icons.settings, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class radialPercentWidget extends StatelessWidget {
  final Widget child;
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  const radialPercentWidget(
      {super.key,
      required this.child,
      required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
            painter: myPainter(
          percent: percent,
          fillColor: fillColor,
          lineColor: lineColor,
          freeColor: freeColor,
          lineWidth: lineWidth,
        )),
        child,
      ],
    );
  }
}

class myPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  myPainter({
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);

    drawBackground(canvas, size);

    drawFreeArc(canvas, arcRect);

    drawFilledArc(canvas, arcRect);
  }

  void drawFilledArc(Canvas canvas, Rect arcRect) {
    final feelPaint = Paint();
    feelPaint.color = lineColor;
    feelPaint.style = PaintingStyle.stroke;
    feelPaint.strokeWidth = lineWidth;
    feelPaint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi * 2 * percent,
      false,
      feelPaint,
    );
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final filedPaint = Paint();
    filedPaint.color = freeColor;
    filedPaint.style = PaintingStyle.stroke;
    filedPaint.strokeWidth = lineWidth;
    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi * 2,
      false,
      filedPaint,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final backgraundPaint = Paint();
    backgraundPaint.color = fillColor;
    backgraundPaint.style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.height / 2, size.width / 2),
      size.height / 2,
      backgraundPaint,
    );
  }

  Rect calculateArcsRect(Size size) {
    const linesMargin = 3;
    final offset = lineWidth / 2 + linesMargin;
    final arcRect = Offset(offset, offset) &
        Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
