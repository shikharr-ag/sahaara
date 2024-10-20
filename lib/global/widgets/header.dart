import 'package:flutter/material.dart';
import 'package:sahaara/global/sahaara_theme.dart';

List<Widget> headers=  [const SizedBox(
                height: 20,
              ),
              Text(
                'Sahaara',
                style: AppColors.theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 32,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              )];