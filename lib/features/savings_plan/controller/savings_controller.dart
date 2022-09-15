import 'package:get/get.dart';
import 'package:kwaba_test/features/savings_plan/data/savings_model.dart';

class SavingsController extends GetxController {
  var buddySavingTitle = ''.obs;
  var noOfBuddiesSaving = ''.obs;
  var buddiesHaveTargetYesNo = ''.obs;
  var howDoYouWantToSave = ''.obs;
  var savingFrequency = ''.obs;
  var whenToStartSaving = ''.obs;
  var howMuchToSaveIn12Months = ''.obs;
  var whenToStartSaving2 = ''.obs;
  var howLongToSaveWithBuddies = ''.obs;
  var startDate = ''.obs;
  var endDate = ''.obs;
  var relationshipWithBuddies = ''.obs;

  var savingsBuddiesList = <SavingsModel>[].obs;
}
