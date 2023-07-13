import 'package:flutter/material.dart';

import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/presentation/widgets/other/bottom_sheet_divider.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class SignUpPolicyBottomSheet extends StatelessWidget {
  const SignUpPolicyBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: .85,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.setPadding(20),
          ),
          const FadeAnimationYDown(delay: .1, child: BottomSheetDivider()),
          SizedBox(
            height: SizeConfig.setPadding(5),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.setPadding(15),
                  vertical: SizeConfig.setPadding(20)),
              children: [
                Text(
                  'Terms of Service & Privacy Policy',
                  style:
                      kBold.copyWith(color: kDarkBlue, fontSize: SizeConfig.h1),
                ),
                SizedBox(
                  height: SizeConfig.setPadding(20),
                ),
                Text(
                  'These Terms of Service reflect the way Google’s business works, the laws that apply to our company, and certain things we’ve always believed to be true.\nAs a result, these Terms of Service help define Google’s relationship with you as you interact with our services. For example, these terms include the following topic headings: What you can expect from us, which describes how we provide and develop our services What we expect from you, which establishes certain rules for using our services Content in Google services, which describes the intellectual property rights to the content you find in our services - whether that content belongs to you, Google, or others In case of problems or disagreements, which describes other legal rights you have, and what to expect in case someone violates these terms Understanding these terms is important because, by using our services, youre agreeing to these terms. Besides these terms, we also publish a Privacy Policy. Although its not part of these terms, we encourage you to read it to better understand how you can update, manage, export, and delete your information.\nTerms Service provider Google services are provided by, and you’re contracting with: Google LLC organized under the laws of the State of Delaware, USA, and operating under the laws of the USA 1600 Amphitheatre Parkway Mountain View, California 94043 USA Age requirements If youre under the age required to manage your own Google Account, you must have your parent or legal guardians permission to use a Google Account.\nPlease have your parent or legal guardian read these terms with you. If youre a parent or legal guardian, and you allow your child to use the services, then these terms apply to you and youre responsible for your childs activity on the services. Some Google services have additional age requirements as described in their service-specific additional terms and policies. Your relationship with Google These terms help define the relationship between you and Google.\nBroadly speaking, we give you permission to use our services if you agree to follow these terms, which reflect how Google’s business works and how we earn money. When we speak of "Google," "we," "us," and "our," we mean Google LLC and its affiliates. What you can expect from us Provide a broad range of useful services We provide a broad range of services that are subject to these terms, including: apps and sites (like Search and Maps) platforms (like Google Shopping) integrated services (like Maps embedded in other companies apps or sites) devices (like Google Nest).\nMany of these services also include content that you can stream or interact with. Our services are designed to work together, making it easier for you to move from one activity to the next. For example, if your Calendar event includes an address, you can click on that address and Maps can show you how to get there. Develop, improve, and update Google services Were constantly developing new technologies and features to improve our services. For example, we use artificial intelligence and machine learning to provide you with simultaneous translations, and to better detect and block spam and malware. As part of this continual improvement, we sometimes add or remove features and functionalities, increase or decrease limits to our services, and start offering new services or stop offering old ones. When a service requires or includes downloadable software, that software sometimes updates automatically on your device once a new version or feature is available. Some services let you adjust your automatic update settings. If we make material changes that negatively impact your use of our services or if we stop offering a service, well provide you with reasonable advance notice, except in urgent situations such as preventing abuse, responding to legal requirements, or addressing security and operability issues.\nWell also provide you with an opportunity to export your content from your Google Account using Google Takeout, subject to applicable law and policies. What we expect from you Follow these terms and service-specific additional terms The permission we give you to use our services continues as long as you comply with: these terms service-specific additional terms, which could, for example, include things like additional age requirements We also make various policies, help centers, and other resources available to you to answer common questions and to set expectations about using our services.\nThese resources include our Privacy Policy, Copyright Help Center, Safety Center, and other pages accessible from our policies site. Although we give you permission to use our services, we retain any intellectual property rights we have in the services. Respect others We want to maintain a respectful environment for everyone, which means you must follow these basic rules of conduct: comply with applicable laws, including export control, sanctions, and human trafficking laws respect the rights of others, including privacy and intellectual property rights dont abuse or harm others or yourself (or threaten or encourage such abuse or harm) - for example, by misleading, defrauding, illegally impersonating, defaming, bullying, harassing, or stalking others dont abuse, harm, interfere with, or disrupt the services - for example, by accessing or using them in fraudulent or deceptive ways, introducing malware, or spamming, hacking, or bypassing our systems or protective measures. When we index the web to bring you search results, we respect standard usage restrictions that website owners specify in their websites code, so we require the same when others use our services Our service-specific additional terms and policies provide additional details about appropriate conduct that everyone using those services must follow.\nIf you find that others aren’t following these rules, many of our services allow you to report abuse. If we act on a report of abuse, we also provide the process described in the Taking action in case of problems section. Permission to use your content Some of our services are designed to let you upload, submit, store, send, receive, or share your content. You have no obligation to provide any content to our services and you’re free to choose the content that you want to provide. If you choose to upload or share content, please make sure you have the necessary rights to do so and that the content is lawful.',
                  style: kMedium.copyWith(
                      color: kDarkBlue, fontSize: SizeConfig.body1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
