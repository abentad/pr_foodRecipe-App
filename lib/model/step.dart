class Step {
  late int stepId;
  late String stepName;
  late String stepDescription;
  late String stepCookTime;
  late String stepNameAm;
  late String stepDescriptionAm;
  late int foodId;

  Step(
      {required this.stepId,
      required this.stepName,
      required this.stepDescription,
      required this.stepCookTime,
      required this.stepNameAm,
      required this.stepDescriptionAm,
      required this.foodId});

  Step.fromJson(Map<String, dynamic> json) {
    stepId = json['stepId'];
    stepName = json['stepName'];
    stepDescription = json['stepDescription'];
    stepCookTime = json['stepCookTime'];
    stepNameAm = json['stepNameAm'];
    stepDescriptionAm = json['stepDescriptionAm'];
    foodId = json['foodId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stepId'] = this.stepId;
    data['stepName'] = this.stepName;
    data['stepDescription'] = this.stepDescription;
    data['stepCookTime'] = this.stepCookTime;
    data['stepNameAm'] = this.stepNameAm;
    data['stepDescriptionAm'] = this.stepDescriptionAm;
    data['foodId'] = this.foodId;
    return data;
  }
}
