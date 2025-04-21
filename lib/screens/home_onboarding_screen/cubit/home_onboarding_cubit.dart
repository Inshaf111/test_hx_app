import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_onboarding_state.dart';

class HomeOnboardingCubit extends Cubit<HomeOnboardingState> {
  HomeOnboardingCubit() : super(HomeOnboardingInitial());

  startOnboarding() {
    emit(HomeOnboardingProgress(currentStep: 1, totalSteps: 7));
    // Simulate onboarding steps
    Future.delayed(const Duration(seconds: 2), () {
      emit(HomeOnboardingProgress(currentStep: 2, totalSteps: 7));
    });
    Future.delayed(const Duration(seconds: 4), () {
      emit(HomeOnboardingProgress(currentStep: 3, totalSteps: 7));
    });
    Future.delayed(const Duration(seconds: 6), () {
      emit(HomeOnboardingProgress(currentStep: 4, totalSteps: 7));
    });
    Future.delayed(const Duration(seconds: 8), () {
      emit(HomeOnboardingProgress(currentStep: 5, totalSteps: 7));
    });
    Future.delayed(const Duration(seconds: 10), () {
      emit(HomeOnboardingProgress(currentStep: 6, totalSteps: 7));
    });
    // Future.delayed(const Duration(seconds: 12), () {
    //   emit(HomeOnboardingProgress(currentStep: 7, totalSteps: 7));
    // });
    Future.delayed(const Duration(seconds: 12), () {
      emit(HomeOnboardingCompleted());
    });
  }
}
