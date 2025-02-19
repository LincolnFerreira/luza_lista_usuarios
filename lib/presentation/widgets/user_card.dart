import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../domain/entities/user.dart';

class UserCard extends StatefulWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  String _obfuscateEmail(String email) {
    return email.replaceAll(RegExp(r'[a-zA-Z0-9]'), '*');
  }

  @override
  Widget build(BuildContext context) {
    final emailToShow =
        _isExpanded ? widget.user.email : _obfuscateEmail(widget.user.email);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.user.avatar),
                    radius: 20,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.user.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 12),
                Text(
                  emailToShow,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
