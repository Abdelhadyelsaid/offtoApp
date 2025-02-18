import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offto/Core/Shared%20Cubit/Theme/theme_cubit.dart';

class SelectorWidget extends StatelessWidget {
  final String hintText;
  final String? selectedText;
  final Widget bottomSheet;
  final VoidCallback onFetchCities;

  const SelectorWidget({
    Key? key,
    required this.hintText,
    this.selectedText,
    required this.bottomSheet,
    required this.onFetchCities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
  builder: (context, state) {
    return GestureDetector(
      onTap: () {
        onFetchCities();
        showModalBottomSheet(
          context: context,
          useSafeArea: true,
          isScrollControlled: true,
          backgroundColor:state is ThemeDark ? Colors.grey[900] : Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => bottomSheet,
        );
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Text(
                  selectedText?.isNotEmpty == true ? selectedText! : hintText,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: selectedText?.isNotEmpty == true
                        ? Colors.black
                        : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                if (selectedText?.isNotEmpty == true)
                  Positioned(
                    top: -10,
                    child: Text(
                      hintText,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
  }
}
