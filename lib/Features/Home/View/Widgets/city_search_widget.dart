import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:offto/Features/Home/Bloc/home_cubit.dart';
import 'package:offto/Features/Home/View/Widgets/textForm_widget.dart';

import '../../../../Core/Const/colors.dart';
import '../../../../generated/l10n.dart';

class CitySearchBottomSheet extends StatelessWidget {
  const CitySearchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr.travelTo,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: locationColor),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: closeColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                DefaultTextFormField(
                  controller: cubit.searchController,
                  enabled: true,
                  hintText: tr.searchHint,
                  fillcolor: Colors.grey.shade200,
                  borderRaduis: 15,
                  onChanged: (query) {
                    context.read<HomeCubit>().getCities(search: query);
                  },
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                state is GetCitiesLoadingState || cubit.searchModel == null
                    ? Center(
                        child: CircularProgressIndicator(
                        color: locationColor,
                      ))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: cubit.searchModel!.data!.items.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: Icon(Icons.location_on,
                                    color: locationColor),
                                title: Text(
                                    cubit.searchModel!.data!.items[index]
                                        .items[0].city!.name!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                  cubit.searchModel!.data!.items[index].country!
                                      .name!,
                                ),
                                onTap: () {
                                  HomeCubit.get(context).setToText(cubit
                                      .searchModel!
                                      .data!
                                      .items[index]
                                      .items[0]
                                      .city!
                                      .name!);
                                  context.pop();
                                });
                          },
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
