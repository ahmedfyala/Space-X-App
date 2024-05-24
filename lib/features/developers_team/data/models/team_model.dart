class TeamModel {
  final String name;
  final String linkedin;
  final String github;
  final String image;

  TeamModel(
      {required this.name,
      required this.linkedin,
      required this.github,
      required this.image});
}

List<TeamModel> team = [
  TeamModel(
      name: 'Nada Nabil',
      linkedin: 'https://www.linkedin.com/in/nadanabilhelmy/',
      github: 'https://github.com/nadanabill',
      image: 'https://avatars.githubusercontent.com/u/62355168?v=4'),
  TeamModel(
    name: 'Hossam Kheder',
    linkedin: 'https://www.linkedin.com/in/hossamkheder/',
    github: 'https://github.com/HossamKheder',
    image: 'https://avatars.githubusercontent.com/u/105512227?v=4',
  ),
];
