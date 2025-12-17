import 'package:bmi_calculator/presentation/MoreDetailPage/bloc/moredetail_event.dart';
import 'package:bmi_calculator/presentation/MoreDetailPage/bloc/moredetail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoredetailBloc extends Bloc<MoredetailBlocEvent, MoredetailBlocState> {
  MoredetailBloc() : super(MoredetailState_Loading()) {
    on<MoredetailEvent_Loading>((_onLoad));


  }

  void _onLoad(
    MoredetailEvent_Loading event,
    Emitter<MoredetailBlocState> emit,
  ) {

    final realHeight = event.height / 100;

    final bmi = event.weight / (realHeight * realHeight);

    final genderFactor = event.gender == 0 ? 5 : -161;
    final bmr =
        10 * event.weight + 6.25 * event.height - 5 * event.age + genderFactor;

    final genderWeight = event.gender == 0 ? 50 : 45.5;
    final idealWeight = genderWeight + 0.91 * (event.height - 152.4);

    final genderValue = event.gender == 0 ? 1 : 0;
    final bodyFat =
        1.20 * bmi + 0.23 * event.age - 10.8 * genderValue - 5.4;

    final waterDay = 30 * event.weight.toDouble();

    final valueNum = 100 - (bmi - 22).abs() * 3;

    emit(
      MoredetailState_Loaded(
        bmi: bmi,
        bmr: bmr,
        idealWeight: idealWeight,
        bodyFat: bodyFat,
        waterDay: waterDay,
        valueNum: valueNum,
        gender: event.gender,
        color: event.value_color,
      ),
    );
    }


}