import 'package:adhunitech/models/service_model.dart';
import 'package:flutter/material.dart';

const String companyName = "Adhunitech";

const String introConf = "#1 We are the best";
const String introTitle = "WANT TO BUILD YOUR MOBILE APP?";
const String introSubtitle =
    "Adhunitech is specializing in designing, developing and launching the world's most ambitious apps with Flutter, which means you save time, money and stress.\nLet our mobile expert help you choose the right tech and process for your app.";
const String introButtonText = "GET IN TOUCH";
const String introButtonUrl = "mailto:contact@adhunitech.com";

const String servicesTitle = "Let's build your next big idea";
final List<ServiceModel> services = [
  ServiceModel(
    title: "Mobile App Development",
    subtitle:
        "Our mobile app development team provides cross platform mobile app solutions using advanced features of Flutter Framework.",
    icon: Icons.phone_android_sharp,
  ),
  ServiceModel(
    title: "Web Applications",
    subtitle:
        "We build outstanding and fast web applications that empower your company. This web also made with same tech.",
    icon: Icons.tv,
  ),
  ServiceModel(
    title: "Support & Scale",
    subtitle:
        "Personalising experiences, annotating data and improving interactions to enrich customer journeys.",
    icon: Icons.security,
  ),
];

bool isMobile(BoxConstraints constraints) => constraints.maxWidth <= 900;
