
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../cubits/product_cubit.dart';
import '../util/app_colors.dart';
import '../util/app_strings.dart';

class SearchAndCartComponent extends StatelessWidget {
  const SearchAndCartComponent({
    super.key,
    required this.cubit,
  });

  final ProductCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 9,
          child: SizedBox(
            height: 55.h,
            child: TextField(
              onChanged: (val){
                cubit.searchProduct(val);
              },
              decoration: InputDecoration(
                hintText: AppStrings.hintSearch,
                prefixIcon: Icon(
                  IconlyLight.search,
                  size: 35.sp,
                  color: AppColors.primary,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  ),
                // borderRadius: BorderRadius.circular(50),
                // coloBorder: AppColors.primary,
                // colorEnabledBorder: AppColors.primary,
                // colorFocusedBorder: AppColors.primary,
              ),

            ),
          ),
        ),
        ),
        Flexible(
          flex: 1,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyLight.buy,
              size: 35.sp,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}