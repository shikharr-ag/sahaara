import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../datasource/model/onboarding_data_model.dart';

class OnboardingNotifier extends Notifier<OnboardingDataModel>{
  OnboardingDataModel _localOnboardingState = OnboardingDataModel.initial()
;  @override
  OnboardingDataModel build() {
    return OnboardingDataModel.initial();
  }

  void updateCurrentPage(int pageIndex){
    _localOnboardingState = _localOnboardingState.copyWith(currentPage: pageIndex);
    state = _localOnboardingState;
  }
}


final onboardingNotifierProvider = NotifierProvider<OnboardingNotifier,OnboardingDataModel>(OnboardingNotifier.new);