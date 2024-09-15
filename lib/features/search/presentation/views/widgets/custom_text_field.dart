import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/search_result_cubit/search_result_cubit.dart';

class CustomTextField extends StatelessWidget{
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value){
        BlocProvider.of<SearchResultCubit>(context).fetchSearchResult(subject: value);
      },
      style: TextStyles.font14Regular.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        prefixIcon: const Icon(
          Icons.search,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Colors.white),
  );
}