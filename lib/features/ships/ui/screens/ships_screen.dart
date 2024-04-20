import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/features/ships/logic/cubit.dart';
import 'package:flutter_mentorship_b1/features/ships/logic/states.dart';
import 'package:flutter_mentorship_b1/features/ships/ui/widgets/ship_item_in_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/themes/styles.dart';

class ShipsScreen extends StatefulWidget {
  const ShipsScreen({super.key});

  @override
  State<ShipsScreen> createState() => _ShipsScreenState();
}

class _ShipsScreenState extends State<ShipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.ships,
            style: TextStyles.font24Bold,
          ),
        ),
        body: BlocBuilder<ShipCubit, ShipStates>(
          builder: (context, state) {
            if (state.shipStatus.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.shipStatus.isError) {
              return Center(
                child: Text(state.errorMessage ?? '@@@@@@@@'),
              );
            }
            if (state.shipStatus.isSuccess) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                  itemCount: state.ships!.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20.sh,
                  ),
                  itemBuilder: (context, index) {
                    return ShipItemInList(
                      image: state.ships![index].imageUrl.toString(),
                      name: state.ships![index].shipName.toString(),
                    );
                  },
                ),
              );
            }else{return const Center(child: Text('error ui'));}

          },
        ));
  }
}
