import 'package:evening_flow/constants/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? leadingIcon;
  final IconData? actionIcon;
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.leadingIcon,
    this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        foregroundColor: AppColors.textOnAccent,
        backgroundColor: AppColors.actionPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(leadingIcon),
            ),
          Text(text),
          if (actionIcon != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(actionIcon),
            ),
        ],
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? leadingIcon;
  final IconData? actionIcon;
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.leadingIcon,
    this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        foregroundColor: AppColors.textPrimary,
        backgroundColor: AppColors.actionSecondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(leadingIcon),
            ),
          Text(text, style: Theme.of(context).textTheme.labelMedium),
          if (actionIcon != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(actionIcon),
            ),
        ],
      ),
    );
  }
}
