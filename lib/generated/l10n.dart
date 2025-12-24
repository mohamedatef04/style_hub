// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Style Hub`
  String get splashLogo {
    return Intl.message('Style Hub', name: 'splashLogo', desc: '', args: []);
  }

  /// `Shop Online`
  String get onBoardingTitle1 {
    return Intl.message(
      'Shop Online',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Discover the latest fashion trends and find the perfect outfit for any occasion.`
  String get onBoardingSubtitle1 {
    return Intl.message(
      'Discover the latest fashion trends and find the perfect outfit for any occasion.',
      name: 'onBoardingSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Find Your Style Match`
  String get onBoardingTitle2 {
    return Intl.message(
      'Find Your Style Match',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Get personalized fashion recommendations based on your preferences and style.`
  String get onBoardingSubtitle2 {
    return Intl.message(
      'Get personalized fashion recommendations based on your preferences and style.',
      name: 'onBoardingSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Welcome to Style Hub! Please log in to continue.`
  String get loginWelcomeMessage {
    return Intl.message(
      'Welcome to Style Hub! Please log in to continue.',
      name: 'loginWelcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Enter your first name`
  String get firstNameHint {
    return Intl.message(
      'Enter your first name',
      name: 'firstNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your last name`
  String get lastNameHint {
    return Intl.message(
      'Enter your last name',
      name: 'lastNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email address`
  String get emailHint {
    return Intl.message(
      'Enter your email address',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Guest Account`
  String get guest {
    return Intl.message('Guest Account', name: 'guest', desc: '', args: []);
  }

  /// `Don't have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get orContinueWith {
    return Intl.message(
      'Or continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Style Hub! Please register to start shopping.`
  String get registerWelcomeMessage {
    return Intl.message(
      'Welcome to Style Hub! Please register to start shopping.',
      name: 'registerWelcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Verify Your Email`
  String get verifyEmail {
    return Intl.message(
      'Verify Your Email',
      name: 'verifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email Verified Successfully`
  String get emailVerified {
    return Intl.message(
      'Email Verified Successfully',
      name: 'emailVerified',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get sendOtp {
    return Intl.message('Send OTP', name: 'sendOtp', desc: '', args: []);
  }

  /// `Please enter your OTP code.`
  String get otpValidation {
    return Intl.message(
      'Please enter your OTP code.',
      name: 'otpValidation',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP Code`
  String get enterOtpCode {
    return Intl.message(
      'Enter OTP Code',
      name: 'enterOtpCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter the OTP code sent to your email to verify your account.`
  String get enterOtpMessage {
    return Intl.message(
      'Enter the OTP code sent to your email to verify your account.',
      name: 'enterOtpMessage',
      desc: '',
      args: [],
    );
  }

  /// `A new OTP has been sent to your email`
  String get newOtpSent {
    return Intl.message(
      'A new OTP has been sent to your email',
      name: 'newOtpSent',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the code?`
  String get didntReceiveCode {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'didntReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message('Resend Code', name: 'resendCode', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your New Password`
  String get enterNewPassword {
    return Intl.message(
      'Enter Your New Password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your confirm password`
  String get confirmPasswordvValidation {
    return Intl.message(
      'Enter your confirm password',
      name: 'confirmPasswordvValidation',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match`
  String get passwordDoesNotMatch {
    return Intl.message(
      'Password does not match',
      name: 'passwordDoesNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Confirm Password`
  String get enterConfirmPassword {
    return Intl.message(
      'Enter Your Confirm Password',
      name: 'enterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Password Updated Successfully`
  String get passwordUpdated {
    return Intl.message(
      'Password Updated Successfully',
      name: 'passwordUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been updated successfully. You can now log in with your new password.`
  String get passwordUpdatedMessage {
    return Intl.message(
      'Your password has been updated successfully. You can now log in with your new password.',
      name: 'passwordUpdatedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get backToLogin {
    return Intl.message(
      'Back to Login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name.`
  String get firstNameValidation {
    return Intl.message(
      'Please enter your first name.',
      name: 'firstNameValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name.`
  String get lastNameValidation {
    return Intl.message(
      'Please enter your last name.',
      name: 'lastNameValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address.`
  String get emailValidation1 {
    return Intl.message(
      'Please enter your email address.',
      name: 'emailValidation1',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get emailValidation2 {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'emailValidation2',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get passwordValidation1 {
    return Intl.message(
      'Please enter your password',
      name: 'passwordValidation1',
      desc: '',
      args: [],
    );
  }

  /// `Password must be ≥8 chars include upperlower, number & special char`
  String get passwordValidation2 {
    return Intl.message(
      'Password must be ≥8 chars include upperlower, number & special char',
      name: 'passwordValidation2',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Check Your Email`
  String get checkYourEmail {
    return Intl.message(
      'Check Your Email',
      name: 'checkYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeNavBar {
    return Intl.message('Home', name: 'homeNavBar', desc: '', args: []);
  }

  /// `Language`
  String get appLanguage {
    return Intl.message('Language', name: 'appLanguage', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Categories`
  String get categoryNavBar {
    return Intl.message(
      'Categories',
      name: 'categoryNavBar',
      desc: '',
      args: [],
    );
  }

  /// `Welcome,\nto Style Hub APP!`
  String get homeWelcomeMessage {
    return Intl.message(
      'Welcome,\nto Style Hub APP!',
      name: 'homeWelcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Search for products`
  String get searchHint {
    return Intl.message(
      'Search for products',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `New Collection`
  String get newCollection {
    return Intl.message(
      'New Collection',
      name: 'newCollection',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `Item Details`
  String get itemDetails {
    return Intl.message(
      'Item Details',
      name: 'itemDetails',
      desc: '',
      args: [],
    );
  }

  /// `Details View`
  String get detailsView {
    return Intl.message(
      'Details View',
      name: 'detailsView',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Quantity`
  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Color`
  String get color {
    return Intl.message('Color', name: 'color', desc: '', args: []);
  }

  /// `Stock`
  String get stock {
    return Intl.message('Stock', name: 'stock', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `My Cart`
  String get myCart {
    return Intl.message('My Cart', name: 'myCart', desc: '', args: []);
  }

  /// `Coupon`
  String get coupon {
    return Intl.message('Coupon', name: 'coupon', desc: '', args: []);
  }

  /// `Enter your coupon code`
  String get couponHint {
    return Intl.message(
      'Enter your coupon code',
      name: 'couponHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your coupon code`
  String get couponValidation {
    return Intl.message(
      'Please enter your coupon code',
      name: 'couponValidation',
      desc: '',
      args: [],
    );
  }

  /// `Coupon applied successfully`
  String get couponApplied {
    return Intl.message(
      'Coupon applied successfully',
      name: 'couponApplied',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Items`
  String get items {
    return Intl.message('Items', name: 'items', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
  }

  /// `Final Total`
  String get finalTotal {
    return Intl.message('Final Total', name: 'finalTotal', desc: '', args: []);
  }

  /// `Proceed to Checkout`
  String get checkout {
    return Intl.message(
      'Proceed to Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkoutBar {
    return Intl.message('Checkout', name: 'checkoutBar', desc: '', args: []);
  }

  /// `Item added to cart successfully`
  String get addedToCartSuccess {
    return Intl.message(
      'Item added to cart successfully',
      name: 'addedToCartSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Item removed from cart successfully`
  String get itemRemovedFromCart {
    return Intl.message(
      'Item removed from cart successfully',
      name: 'itemRemovedFromCart',
      desc: '',
      args: [],
    );
  }

  /// `DELIVERY METHOD`
  String get deliveryMethod {
    return Intl.message(
      'DELIVERY METHOD',
      name: 'deliveryMethod',
      desc: '',
      args: [],
    );
  }

  /// `ADD/EDIT`
  String get addEditAddress {
    return Intl.message('ADD/EDIT', name: 'addEditAddress', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Remove`
  String get delete {
    return Intl.message('Remove', name: 'delete', desc: '', args: []);
  }

  /// `Add New Address`
  String get addNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Edit Your Address`
  String get editAddress {
    return Intl.message(
      'Edit Your Address',
      name: 'editAddress',
      desc: '',
      args: [],
    );
  }

  /// `My Addresses`
  String get myAddresses {
    return Intl.message(
      'My Addresses',
      name: 'myAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Address added successfully`
  String get addressAdded {
    return Intl.message(
      'Address added successfully',
      name: 'addressAdded',
      desc: '',
      args: [],
    );
  }

  /// `You have no saved addresses`
  String get emptyAddress {
    return Intl.message(
      'You have no saved addresses',
      name: 'emptyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address deleted successfully`
  String get addressDeleted {
    return Intl.message(
      'Address deleted successfully',
      name: 'addressDeleted',
      desc: '',
      args: [],
    );
  }

  /// `PAYMENT METHOD`
  String get paymentMethod {
    return Intl.message(
      'PAYMENT METHOD',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message('State', name: 'state', desc: '', args: []);
  }

  /// `Enter your state`
  String get stateHint {
    return Intl.message(
      'Enter your state',
      name: 'stateHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your state`
  String get stateValidation1 {
    return Intl.message(
      'Please enter your state',
      name: 'stateValidation1',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid state`
  String get stateValidation2 {
    return Intl.message(
      'Please enter a valid state',
      name: 'stateValidation2',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Enter your city`
  String get cityHint {
    return Intl.message(
      'Enter your city',
      name: 'cityHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your city`
  String get cityValidation1 {
    return Intl.message(
      'Please enter your city',
      name: 'cityValidation1',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid city`
  String get cityValidation2 {
    return Intl.message(
      'Please enter a valid city',
      name: 'cityValidation2',
      desc: '',
      args: [],
    );
  }

  /// `Steet`
  String get steet {
    return Intl.message('Steet', name: 'steet', desc: '', args: []);
  }

  /// `Enter your steet`
  String get steetHint {
    return Intl.message(
      'Enter your steet',
      name: 'steetHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your steet`
  String get steetValidation1 {
    return Intl.message(
      'Please enter your steet',
      name: 'steetValidation1',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid steet`
  String get streetValidation2 {
    return Intl.message(
      'Please enter a valid steet',
      name: 'streetValidation2',
      desc: '',
      args: [],
    );
  }

  /// `Apartment`
  String get apartment {
    return Intl.message('Apartment', name: 'apartment', desc: '', args: []);
  }

  /// `Enter your apartment`
  String get apartmentHint {
    return Intl.message(
      'Enter your apartment',
      name: 'apartmentHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your apartment`
  String get apartmentValidation1 {
    return Intl.message(
      'Please enter your apartment',
      name: 'apartmentValidation1',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid apartment`
  String get apartmentValidation2 {
    return Intl.message(
      'Please enter a valid apartment',
      name: 'apartmentValidation2',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get phoneNumberHint {
    return Intl.message(
      'Enter your phone number',
      name: 'phoneNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get phoneNumberValidation1 {
    return Intl.message(
      'Please enter your phone number',
      name: 'phoneNumberValidation1',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get phoneNumberValidation2 {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'phoneNumberValidation2',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message('Notes', name: 'notes', desc: '', args: []);
  }

  /// `Enter your notes`
  String get notesHint {
    return Intl.message(
      'Enter your notes',
      name: 'notesHint',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Orders`
  String get orders {
    return Intl.message('Orders', name: 'orders', desc: '', args: []);
  }

  /// `Search`
  String get searchView {
    return Intl.message('Search', name: 'searchView', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
