import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/styles.dart';
import '../../data/modes/rocket_model.dart';
import 'rocket_details_box_widget.dart';
import 'text_row_widget.dart';

class RocketDetailsEngineWidget extends StatelessWidget {
  final Engines? engines;

  const RocketDetailsEngineWidget({super.key, this.engines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(10.h),
        Text(
          AppStrings.engines,
          style: TextStyles.font20RegularPrimary,
        ),
        RocketDetailsBoxWidget(
          text: '',
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (engines!.number != null)
                TextRowWidget(
                  title: AppStrings.number,
                  subtitle: engines!.number!.toString(),
                ),
              if (engines!.type != null)
                TextRowWidget(
                  title: AppStrings.type,
                  subtitle: engines!.type!,
                ),
              if (engines!.propellant1 != null)
                TextRowWidget(
                  title: AppStrings.propellant1,
                  subtitle: engines!.propellant1!,
                ),
              if (engines!.propellant2 != null)
                TextRowWidget(
                  title: AppStrings.propellant2,
                  subtitle: engines!.propellant2!,
                ),
              if (engines!.thrustToWeight != null)
                TextRowWidget(
                  title: AppStrings.thrustToWeight,
                  subtitle: engines!.thrustToWeight!.toString(),
                ),
              if (engines!.version != null || engines!.version != '')
                TextRowWidget(
                  title: AppStrings.version,
                  subtitle: engines!.version!,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
