class Member{
  final String memId;
  final String name;
  final String desc;
  const Member({
    required this.memId,
    required this.name,
    this.desc = "",
  });
}