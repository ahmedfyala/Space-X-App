import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/features/about_company/data/models/about_company_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/spaces.dart';

class SocialLinksWidget extends StatelessWidget {
  final Links links;
  const SocialLinksWidget({super.key, required this.links});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            _launchUrl(links.twitter!);
          },
          child: const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 20,
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeuegnyZIvXfNMWFoMraXgssGjhhNj6DGYRD2JNyYX-w&s',
            ),
          ),
        ),
        horizontalSpace(10.w),
        InkWell(
          onTap: () {
            _launchUrl(links.website!);
          },
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 20,
            child: Icon(
              CupertinoIcons.globe,
              color: Colors.white,
              size: 35.sp,
            ),
          ),
        ),
        horizontalSpace(10.w),
        InkWell(
          onTap: () {
            _launchUrl(links.flickr!);
          },
          child: const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 20,
            backgroundImage: NetworkImage(
                'https://static-00.iconduck.com/assets.00/flickr-icon-2048x2048-58fx1jp5.png'),
          ),
        ),
      ],
    );
  }
}

Future<void> _launchUrl(String link) async {
  final Uri url = Uri.parse(link);

  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
