part of 'home_onboarding_cubit.dart';

@immutable
sealed class HomeOnboardingState {}

final class HomeOnboardingInitial extends HomeOnboardingState {}

final class HomeOnboardingProgress extends HomeOnboardingState {
  final int currentStep;
  final int totalSteps;

  HomeOnboardingProgress({
    required this.currentStep,
    required this.totalSteps,
  });
}

final class HomeOnboardingCompleted extends HomeOnboardingState {
  HomeOnboardingCompleted();
}
