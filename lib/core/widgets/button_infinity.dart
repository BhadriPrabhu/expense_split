import 'package:flutter/material.dart';
import 'package:split_arch/features/groups/domain/entities/group_list.dart';
import 'package:split_arch/features/groups/domain/entities/member.dart';

class ButtonInfinity extends StatefulWidget {
  final TextEditingController groupName;
  final TextEditingController groupDesc;
  final List<Member> members;

  const ButtonInfinity({super.key, required this.groupName, required this.groupDesc, required this.members });

  @override
  State<StatefulWidget> createState() => _ButtonInfinityState();
}

class _ButtonInfinityState extends State<ButtonInfinity> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: ElevatedButton(
        onPressed: () {
          if (widget.groupName.text.isNotEmpty && widget.members.length > 1) {
            final newGroup = GroupList(
              id: DateTime.now().toString(),
              title: widget.groupName.text.toString(),
              desc: widget.groupDesc.text.toString(),
              list: widget.members.toList(),
            );
            Navigator.pop(context, newGroup);
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.indigo[600],
          minimumSize: const Size(double.infinity, 0),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_rounded,
              size: 24.0,
              color: Colors.white,
              weight: 700,
            ),
            SizedBox(width: 8.0),
            Text(
              "Create Group",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
