class ItemModel {
  String iconName;
  String jobName;
  String salary;

  ItemModel(
      {required this.iconName, required this.jobName, required this.salary});

  List<ItemModel> get items {
    return [
      ItemModel(
          iconName: "instagram",
          jobName: "Lead UI Developer",
          salary: "\$10k - \$20k"),
      ItemModel(
          iconName: "skype",
          jobName: "Senior Web Designer",
          salary: "\$10k - \$18k"),
      ItemModel(
          iconName: "google",
          jobName: "UI/UX Designer",
          salary: "\$8k - \$16k"),
      ItemModel(
          iconName: "dribbble",
          jobName: "Graphic Designer",
          salary: "\$8k - \$14k"),
    ];
  }

static List<ItemModel> list(){
  return [
      ItemModel(
          iconName: "instagram",
          jobName: "Lead UI Developer",
          salary: "\$10k - \$20k"),
      ItemModel(
          iconName: "skype",
          jobName: "Senior Web Designer",
          salary: "\$10k - \$18k"),
      ItemModel(
          iconName: "google", jobName: "UI/UX Designer", salary: "\$8k - \$16k"),
      ItemModel(
          iconName: "dribbble",
          jobName: "Graphic Designer",
          salary: "\$8k - \$14k"),
    ];
}
}
