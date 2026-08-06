import 'package:flutter/material.dart';
import 'package:split_arch/app_routes.dart';
import 'package:split_arch/core/constants/app_colors.dart';
import 'package:split_arch/core/constants/app_text_styles.dart';
import 'package:split_arch/features/groups/domain/entities/group_list.dart';
import 'package:split_arch/features/groups/domain/entities/member.dart';
// import 'package:split_arch/features/groups/presentation/pages/group_screen.dart';

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({super.key});

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  List<Member> members = [
    // const Member(memId: '1', name: "Bhadri"),
    // const Member(memId: '2', name: "Prabhu"),
  ];

  final TextEditingController _groupName = TextEditingController();
  final TextEditingController _groupDesc = TextEditingController();
  final TextEditingController _memName = TextEditingController();

  @override
  void dispose() {
    _groupName.dispose();
    _groupDesc.dispose();
    _memName.dispose();
    super.dispose();
  }

  Future<void> _showAddDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Add new member",
            style: AppTextStyles().appBarTitleStyle,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 60.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    controller: _memName,
                    maxLength: 50,
                    decoration: InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                      prefixIcon: Icon(Icons.person, color: Colors.indigo[600]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _memName.text = "";
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_memName.text.trim().isNotEmpty) {
                            setState(() {
                              members.add(
                                Member(
                                  memId: DateTime.now().toString(),
                                  name: _memName.text.toString(),
                                ),
                              );
                            });
                            Navigator.pop(context);
                            _memName.text = "";
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.indigo[600],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.group,
                (route) => false,
              );
            }
          },
          icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
        ),
        title: Text("Create Group", style: AppTextStyles().appBarTitleStyle),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.0),
              TextField(
                controller: _groupName,
                autofocus: false,
                maxLength: 50,
                decoration: InputDecoration(
                  hintText: "Group Name",
                  prefixIcon: Icon(
                    Icons.groups_outlined,
                    color: Colors.indigo[600],
                  ),
                  labelText: "Group Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(width: 1),
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _groupDesc,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Description",
                  prefixIcon: Icon(
                    Icons.description_outlined,
                    color: Colors.grey[500],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(width: 1),
                  ),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Members:",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showAddDialog();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors().lightIndigo,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 20,
                          color: AppColors().indigo,
                          weight: 700,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Add Member",
                          style: TextStyle(color: AppColors().indigo),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (members.isNotEmpty)
                    ...members.asMap().entries.map((e) {
                      return InputChip(
                        label: Text(
                          e.value.name,
                          style: TextStyle(fontSize: 14),
                        ),
                        avatar: CircleAvatar(
                          radius: 10,
                          child: Text(
                            e.value.name[0].toUpperCase(),
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        deleteIcon: Icon(Icons.clear, size: 16.0),
                        onDeleted: () {
                          setState(() {
                            members.removeAt(e.key);
                          });
                        },
                      );
                    })
                  else
                    Center(
                      heightFactor: 10,
                      child: Text(
                        "Yet to add the members",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: ElevatedButton(
            onPressed: () {
              if (_groupName.text.isNotEmpty && members.length > 1) {
                  final newGroup = GroupList(
                    id: DateTime.now().toString(),
                    title: _groupName.text.toString(),
                    desc: _groupDesc.text.toString(),
                    list: members.toList(),
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
        ),
      ),
    );
  }
}
