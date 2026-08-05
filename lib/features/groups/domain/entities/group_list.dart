import 'package:split_arch/features/groups/domain/entities/member.dart';

class GroupList {
  final String id;
  String title;
  String desc;
  List<Member> list;
  GroupList({
    required this.id,
    required this.title,
    this.desc = "",
    List<Member>? list,
  }) : list = list ?? [const Member(memId: '1', name: "Bhadri", desc: "")];
  
  int get memCount => list.length;
}