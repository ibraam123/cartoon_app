import 'package:cartoon_app/core/config/app_keys_localization.dart';
import 'package:cartoon_app/features/auth/presentation/widgets/social_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/assets.dart';
import '../logic/auth_cubit.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: SocialConatiner(
                textName: AuthKeys.google.tr(),
                icon: Assets.imagesGoogleLightSigninIcon,
                onTap: (){
                  context.read<AuthCubit>().signInWithGoogle();
                },
              )
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SocialConatiner(
              textName: AuthKeys.facebook.tr(),
              icon: Assets.imagesFasebook,
              onTap: (){
                context.read<AuthCubit>().signInWithFacebook();
              },
            ),
          )

        ]
    );
  }
}
