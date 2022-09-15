class SavingsModel {
  final String? buddySavingTitle,
      noOfBuddiesSaving,
      buddiesHaveTargetYesNo,
      howDoYouWantToSave,
      savingFrequency,
      whenToStartSaving,
      howMuchToSaveIn12Months,
      whenToStartSaving2,
      howLongToSaveWithBuddies,
      startDate,
      endDate,
      relationshipWithBuddies;

  SavingsModel(
      {this.buddiesHaveTargetYesNo,
      this.buddySavingTitle,
      this.endDate,
      this.howDoYouWantToSave,
      this.howLongToSaveWithBuddies,
      this.howMuchToSaveIn12Months,
      this.noOfBuddiesSaving,
      this.relationshipWithBuddies,
      this.savingFrequency,
      this.startDate,
      this.whenToStartSaving,
      this.whenToStartSaving2});

  factory SavingsModel.fromJson(Map<String, dynamic> json) => SavingsModel(
        buddiesHaveTargetYesNo: json["buddiesHaveTargetYesNo"],
        buddySavingTitle: json["buddySavingTitle"],
        endDate: json["endDate"],
        howDoYouWantToSave: json["howDoYouWantToSave"],
        howLongToSaveWithBuddies: json["howLongToSaveWithBuddies"],
        howMuchToSaveIn12Months: json["howMuchToSaveIn12Months"],
        noOfBuddiesSaving: json["noOfBuddiesSaving"],
        savingFrequency: json["savingFrequency"],
        startDate: json["startDate"],
        relationshipWithBuddies: json["relationshipWithBuddies"],
        whenToStartSaving2: json["whenToStartSaving2"],
        whenToStartSaving: json["whenToStartSaving"],
      );
}
