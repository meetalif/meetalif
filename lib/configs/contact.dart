import 'package:adhunitech/models/contact_model.dart';
import 'package:flutter/material.dart';

const String contactText = "Contact Us";
const String contactTitle = "Get In Touch With Us";
const String contactSubtitle =
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature";

final List<ContactModel> contactList = [
  ContactModel(
    icon: Icons.home_outlined,
    title: "Our Location",
    subtitle: "Haripur, Thakurgaon, Bangladesh",
  ),
  ContactModel(
    icon: Icons.phone_outlined,
    title: "Phone Number",
    subtitle: "(+880) 1705967121",
  ),
  ContactModel(
    icon: Icons.email_outlined,
    title: "Email Address",
    subtitle: "contact@adhunitech.com",
  ),
];
