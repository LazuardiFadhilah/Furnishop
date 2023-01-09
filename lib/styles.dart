import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bgColor = Color(0xffF5F8F7);
const Color whiteColor = Color(0xffFFFFFF);
const Color orangeColor = Color(0xffEB7430);
const Color blackColor = Color(0xff1C1C27);
const Color redColor = Color(0xffFF6363);
const Color greyColor = Color(0xffA2A2A2);
Color lightOrangeColor = orangeColor.withOpacity(0.1);

FontWeight thin = FontWeight.w100;
FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

TextStyle titlePageTextStyle = GoogleFonts.robotoSlab(
  color: blackColor,
  fontSize: 22,
  fontWeight: bold,
);

TextStyle titleTextStyle = GoogleFonts.poppins(
  color: blackColor,
  fontSize: 14,
  fontWeight: semiBold,
);

TextStyle descTextStyle = GoogleFonts.poppins(
  color: greyColor,
  fontSize: 10,
  fontWeight: regular,
);

TextStyle buttonTextStyle = GoogleFonts.poppins(
  color: whiteColor,
  fontSize: 12,
  fontWeight: semiBold,
);

TextStyle pagingTextStyle = GoogleFonts.poppins(
  color: orangeColor,
  fontSize: 12,
  fontWeight: medium,
);
