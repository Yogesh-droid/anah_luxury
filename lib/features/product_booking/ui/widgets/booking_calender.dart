import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:anah_luxury/features/product_booking/ui/widgets/anah_calender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anah_luxury/features/product_booking/ui/controllers/cubit/booking_timeslider_controller_cubit.dart';

class BookingCalender extends StatelessWidget {
  const BookingCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnahCalendarDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          currentDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 30)),
          onDateChanged: (value) {},
        ),
        const Spacer(),
        const Divider(),
        const Text(kPreferredTime, style: secMed15),
        BlocBuilder<BookingTimesliderControllerCubit, int>(
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: appPadding),
                SliderTheme(
                  data: SliderThemeData(
                      trackHeight: 20,
                      trackShape: const RectangularSliderTrackShape(),
                      tickMarkShape: CustomSliderTickMarkShape()),
                  child: Slider(
                      thumbColor: black,
                      activeColor: transparent,
                      inactiveColor: transparent,
                      value: state.toDouble(),
                      min: 10,
                      max: 20,
                      label: state < 12
                          ? "$state AM"
                          : state == 12
                              ? "$state PM"
                              : "${(state - 12)} PM",
                      divisions: 10,
                      onChanged: (value) {
                        context
                            .read<BookingTimesliderControllerCubit>()
                            .updateTime(value.toInt());
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("10 AM", style: secMed12),
                        Text("8 PM", style: secMed12)
                      ]),
                ),
                const SizedBox(height: appPadding * 3)
              ],
            );
          },
        )
      ],
    );
  }
}

class CustomSliderTickMarkShape extends SliderTickMarkShape {
  @override
  Size getPreferredSize({
    required SliderThemeData sliderTheme,
    required bool isEnabled,
  }) {
    return Size.fromRadius(sliderTheme.trackHeight! / 4);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required Animation<double> enableAnimation,
      required Offset thumbCenter,
      required bool isEnabled,
      required TextDirection textDirection}) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    Rect rect = Rect.fromCenter(center: center, width: 2, height: 20);
    context.canvas.drawRect(rect, paint);
  }
}
