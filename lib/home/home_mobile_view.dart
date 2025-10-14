import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/home/widgets/experience_tile.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants.dart';

class HomeMobileView extends StatefulWidget {
  const HomeMobileView({super.key});

  @override
  State<HomeMobileView> createState() => _HomeMobileViewState();
}

class _HomeMobileViewState extends State<HomeMobileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0f172a),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(50),
                  child: Image.asset(
                    'assets/images/murshid.png',
                    height: 300,
                    width: 300,
                  ),
                ),
              ).pT(40),
              20.hBox,
              Text(
                "Murshid KK",
                style:
                    context.headL.w700.copyWith(fontSize: 43).col(Colors.white),
              ).pH(30),
              10.hBox,
              Text(
                "Flutter Developer",
                style: context.bodyL.w500.copyWith(fontSize: 18),
              ).pH(30),
              20.hBox,
              Text(
                "I am a Flutter Developer with 1 years of experience in building cross platform applications.",
                style: context.bodyM.w400
                    .col(Colors.white.withOpacity(0.5))
                    .copyWith(fontSize: 16),
                maxLines: 2,
              ).pH(30),
              25.hBox,
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () async {
                      final uri = Uri.parse("https://github.com/Murshi-d/");
                      if (await canLaunchUrl(uri)) {
                        launchUrl(uri);
                      }
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.github,
                      color: Colors.white54,
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const FaIcon(
                  //     FontAwesomeIcons.instagram,
                  //     color: Colors.white54,
                  //   ),
                  // ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const FaIcon(
                  //     FontAwesomeIcons.twitter,
                  //     color: Colors.white54,
                  //   ),
                  // ),
                  IconButton(
                    onPressed: () async {
                      final uri =
                          Uri.parse("https://www.linkedin.com/in/murshid-kk-/");
                      if (await canLaunchUrl(uri)) {
                        launchUrl(uri);
                      }
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ).pH(30),
              100.hBox,
              Text(
                "ABOUT",
                style: context.bodyM
                    .copyWith(fontSize: 14, letterSpacing: 1.5)
                    .bold,
              ).pH(30),
              40.hBox,
              EasyRichText(
                about,
                defaultStyle: context.bodyM
                    .col(Colors.white54)
                    .copyWith(fontSize: 16, height: 1.5),
                patternList: [
                  EasyRichTextPattern(
                    targetString: "clean, maintainable code",
                    style:
                        context.bodyM.bold.copyWith(fontSize: 16, height: 1.5),
                  )
                ],
              ).pH(30),
              60.hBox,
              Text(
                "EXPERIENCE",
                style: context.bodyM
                    .copyWith(fontSize: 14, letterSpacing: 1.5)
                    .bold,
              ).pH(30),
              40.hBox,
              ...expList.map((e) => ExpTileMob(details: e)).toList(),
              60.hBox,
              Text(
                "PROJECTS",
                style: context.bodyM
                    .copyWith(fontSize: 14, letterSpacing: 1.5)
                    .bold,
              ).pH(30),
              40.hBox,
              ...projectList
                  .map((e) => ProjectTileMob(details: e).pB(20))
                  .toList(),
              Linkify(
                text: bottomText,
                style:
                    context.bodyS.copyWith(height: 1.5, color: Colors.white54),
                onOpen: (link) async {
                  if (await canLaunchUrl(Uri.parse(link.url))) {
                    launchUrl(Uri.parse(link.url));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Cannot open link")));
                  }
                },
              ).pH(30),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectTileMob extends StatefulWidget {
  const ProjectTileMob({
    Key? key,
    required this.details,
  }) : super(key: key);

  final Map details;
  @override
  State<ProjectTileMob> createState() => _ProjectTileMobState();
}

class _ProjectTileMobState extends State<ProjectTileMob>
    with SingleTickerProviderStateMixin {
  bool hover = false;
  Color normalColor = Colors.transparent;

  Color hoverColor = const Color.fromRGBO(45, 212, 191, 0.1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          hover = true;
        });
      },
      onExit: (event) {
        setState(() {
          hover = false;
        });
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: hover ? hoverColor : normalColor,
          borderRadius: BorderRadius.circular(20),
        ),
        // color: hover ? hoverColor : normalColor,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: InkWell(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          onTap: () async {
            final uri = Uri.parse(widget.details["link"]);
            if (await canLaunchUrl(uri)) {
              launchUrl(uri);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.details["title"]}",
                style: context.bodyM.col(Colors.white).w600,
              ),
              10.hBox,
              Text(
                "${widget.details["description"]}",
                style: context.bodyS
                    .copyWith(height: 1.5, color: Colors.white54, fontSize: 14),
              ),
              10.hBox,
              Wrap(
                spacing: 10,
                runSpacing: 5,
                children: (widget.details["skills"] as List<String>)
                    .map((e) => CustomChip(text: e))
                    .toList(),
              ),
              15.hBox,
              ...(widget.details["img"] as List<String>)
                  .map((imgPath) => Padding(
                        padding: const EdgeInsets.only(
                            bottom: 12), // Adjust spacing as needed
                        child: Image.asset(imgPath),
                      ))
                  .toList(),
              40.hBox,
            ],
          ),
        ),
      ),
    );
  }
}

class ExpTileMob extends StatelessWidget {
  const ExpTileMob({
    Key? key,
    required this.details,
  }) : super(key: key);

  final Map details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${details["start"]} - ${details["end"]}",
          style: context.bodyM.col(Colors.white54),
        ),
        10.hBox,
        Text(
          "${details["title"]} · ${details["company"]}",
          style: context.bodyM.col(Colors.white).w600,
        ),
        10.hBox,
        Text(
          "${details["description"]}",
          style: context.bodyS
              .copyWith(height: 1.5, color: Colors.white54, fontSize: 14),
        ),
        10.hBox,
        Wrap(
          spacing: 10,
          runSpacing: 5,
          children: (details["skills"] as List<String>)
              .map((e) => CustomChip(text: e))
              .toList(),
        ),
        40.hBox,
      ],
    ).pH(30);
  }
}
