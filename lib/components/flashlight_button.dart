import 'package:flashlight_app/assets/custom_icons.dart';
import 'package:flashlight_app/bloc/flashlight_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlashlightButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlashlightBloc()..add(FlashlightInitialEvent()),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: BlocBuilder<FlashlightBloc, FlashlightState>(
          builder: (context, state) {
            if (state is FlashlightIsAvailable) {
              return Ink(
                decoration: ShapeDecoration(
                  color: state.isOn ? Colors.white : null,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(
                    CustomIcons.flashlight,
                    color: state.isOn
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                  onPressed: () {
                    context.bloc<FlashlightBloc>().add(FlashlightTouchEvent());
                  },
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
