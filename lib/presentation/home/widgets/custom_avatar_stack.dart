import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/material.dart';

class CustomAvatarStack extends StatelessWidget {
  const CustomAvatarStack({super.key});

  @override
  Widget build(BuildContext context) {
    return AvatarStack(
                height: 50,
                avatars: [
                  for (var n = 0; n < 3; n++)
                    NetworkImage('https://i.pravatar.cc/150?img=$n'),
                ],
              );
  }
}