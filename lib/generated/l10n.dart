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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Invalid user name or password `
  String get invalidLogin {
    return Intl.message(
      'Invalid user name or password ',
      name: 'invalidLogin',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get userName {
    return Intl.message(
      'User name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get edit_profile {
    return Intl.message(
      'Edit profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get ForgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset`
  String get resetPassword {
    return Intl.message(
      'Password Reset',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send link`
  String get sendResetPasswordLink {
    return Intl.message(
      'Send link',
      name: 'sendResetPasswordLink',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get DoNotHaveAnAccount {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'DoNotHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get close {
    return Intl.message(
      'close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get loading {
    return Intl.message(
      'loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `My services`
  String get myServices {
    return Intl.message(
      'My services',
      name: 'myServices',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `you have added`
  String get youHaveAdded {
    return Intl.message(
      'you have added',
      name: 'youHaveAdded',
      desc: '',
      args: [],
    );
  }

  /// `service to cart`
  String get cartService {
    return Intl.message(
      'service to cart',
      name: 'cartService',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get doNotHaveAccount {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'doNotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `invalid password`
  String get invalidPassword {
    return Intl.message(
      'invalid password',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `invalid Email`
  String get invalidEmail {
    return Intl.message(
      'invalid Email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `invalid`
  String get invalid {
    return Intl.message(
      'invalid',
      name: 'invalid',
      desc: '',
      args: [],
    );
  }

  /// `password not matched`
  String get notMatchedPassword {
    return Intl.message(
      'password not matched',
      name: 'notMatchedPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phone number`
  String get invalidEmptyPhoneNumber {
    return Intl.message(
      'Invalid Phone number',
      name: 'invalidEmptyPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account you are agree to our \n terms of services and privacy Policy`
  String get policyHint {
    return Intl.message(
      'By creating an account you are agree to our \n terms of services and privacy Policy',
      name: 'policyHint',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully`
  String get accountCreated {
    return Intl.message(
      'Account created successfully',
      name: 'accountCreated',
      desc: '',
      args: [],
    );
  }

  /// `Check your inbox`
  String get checkYourInbox {
    return Intl.message(
      'Check your inbox',
      name: 'checkYourInbox',
      desc: '',
      args: [],
    );
  }

  /// `We have sent you a link through\nThe email you just entered`
  String get checkYourInboxDesc {
    return Intl.message(
      'We have sent you a link through\nThe email you just entered',
      name: 'checkYourInboxDesc',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `EGPِ`
  String get egp {
    return Intl.message(
      'EGPِ',
      name: 'egp',
      desc: '',
      args: [],
    );
  }

  /// `you have removed`
  String get youHaveRemoved {
    return Intl.message(
      'you have removed',
      name: 'youHaveRemoved',
      desc: '',
      args: [],
    );
  }

  /// `Create new account`
  String get createNewAccount {
    return Intl.message(
      'Create new account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Invalid user name`
  String get invalidUserName {
    return Intl.message(
      'Invalid user name',
      name: 'invalidUserName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid first name`
  String get invalidFirstName {
    return Intl.message(
      'Invalid first name',
      name: 'invalidFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid last name`
  String get invalidLastName {
    return Intl.message(
      'Invalid last name',
      name: 'invalidLastName',
      desc: '',
      args: [],
    );
  }

  /// `Password can't be less than 6 char`
  String get passwordErrorLength {
    return Intl.message(
      'Password can\'t be less than 6 char',
      name: 'passwordErrorLength',
      desc: '',
      args: [],
    );
  }

  /// `Password not matched`
  String get passwordWordNotMatched {
    return Intl.message(
      'Password not matched',
      name: 'passwordWordNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `Please check internet connection and try again.`
  String get onTryAgainMessage {
    return Intl.message(
      'Please check internet connection and try again.',
      name: 'onTryAgainMessage',
      desc: '',
      args: [],
    );
  }

  /// `No connection`
  String get noConnection {
    return Intl.message(
      'No connection',
      name: 'noConnection',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't find any results matching your applied Type.`
  String get emptyListMessage {
    return Intl.message(
      'We couldn\'t find any results matching your applied Type.',
      name: 'emptyListMessage',
      desc: '',
      args: [],
    );
  }

  /// `No result Found`
  String get noResultFound {
    return Intl.message(
      'No result Found',
      name: 'noResultFound',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get someThingWrong {
    return Intl.message(
      'Something went wrong',
      name: 'someThingWrong',
      desc: '',
      args: [],
    );
  }

  /// `'The application has encountered an unknown error.\n'\n 'Please try again later.'`
  String get applicationError {
    return Intl.message(
      '\'The application has encountered an unknown error.\n\'\n \'Please try again later.\'',
      name: 'applicationError',
      desc: '',
      args: [],
    );
  }

  /// `Password mustn't contain any spaces`
  String get passwordSpaceError {
    return Intl.message(
      'Password mustn\'t contain any spaces',
      name: 'passwordSpaceError',
      desc: '',
      args: [],
    );
  }

  /// `EGPِ`
  String get egpPrice {
    return Intl.message(
      'EGPِ',
      name: 'egpPrice',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Add new address`
  String get addNewAddress {
    return Intl.message(
      'Add new address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address name`
  String get addressName {
    return Intl.message(
      'Address name',
      name: 'addressName',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get addressCity {
    return Intl.message(
      'City',
      name: 'addressCity',
      desc: '',
      args: [],
    );
  }

  /// `Address street`
  String get addressStreet {
    return Intl.message(
      'Address street',
      name: 'addressStreet',
      desc: '',
      args: [],
    );
  }

  /// `Building number`
  String get addressBuildingNumber {
    return Intl.message(
      'Building number',
      name: 'addressBuildingNumber',
      desc: '',
      args: [],
    );
  }

  /// `Floor number`
  String get AddressFloorNumber {
    return Intl.message(
      'Floor number',
      name: 'AddressFloorNumber',
      desc: '',
      args: [],
    );
  }

  /// `Apartment number`
  String get apartmentNumber {
    return Intl.message(
      'Apartment number',
      name: 'apartmentNumber',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Saved places`
  String get savedPlaces {
    return Intl.message(
      'Saved places',
      name: 'savedPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Choose date`
  String get chooseDate {
    return Intl.message(
      'Choose date',
      name: 'chooseDate',
      desc: '',
      args: [],
    );
  }

  /// `Pay on Delivery`
  String get payOnDelivery {
    return Intl.message(
      'Pay on Delivery',
      name: 'payOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `No saved places`
  String get noSavedPlaces {
    return Intl.message(
      'No saved places',
      name: 'noSavedPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Create request`
  String get createRequest {
    return Intl.message(
      'Create request',
      name: 'createRequest',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Choose visiting date`
  String get chooseCheckDate {
    return Intl.message(
      'Choose visiting date',
      name: 'chooseCheckDate',
      desc: '',
      args: [],
    );
  }

  /// `Address submitted Successfully`
  String get addressCreatedSuccessfully {
    return Intl.message(
      'Address submitted Successfully',
      name: 'addressCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Address updated Successfully`
  String get addressUpdatedSuccessfully {
    return Intl.message(
      'Address updated Successfully',
      name: 'addressUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please add address in order to submit request`
  String get pleaseAddAddress {
    return Intl.message(
      'Please add address in order to submit request',
      name: 'pleaseAddAddress',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `you order has been sent !`
  String get transactionSubmitted {
    return Intl.message(
      'you order has been sent !',
      name: 'transactionSubmitted',
      desc: '',
      args: [],
    );
  }

  /// `You will receive a call from our representatives to confirm your appointment  You can track your order from`
  String get transactionSubmittedDesc {
    return Intl.message(
      'You will receive a call from our representatives to confirm your appointment  You can track your order from',
      name: 'transactionSubmittedDesc',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed`
  String get confirmed {
    return Intl.message(
      'Confirmed',
      name: 'confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `OnGoing`
  String get onGoing {
    return Intl.message(
      'OnGoing',
      name: 'onGoing',
      desc: '',
      args: [],
    );
  }

  /// `delivered`
  String get delivered {
    return Intl.message(
      'delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get main {
    return Intl.message(
      'Home',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `My addresses`
  String get myAddresses {
    return Intl.message(
      'My addresses',
      name: 'myAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Personal info`
  String get personalInfo {
    return Intl.message(
      'Personal info',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get oldPassword {
    return Intl.message(
      'Old password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `password not matched`
  String get passwordNotMatched {
    return Intl.message(
      'password not matched',
      name: 'passwordNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `Change name`
  String get changeName {
    return Intl.message(
      'Change name',
      name: 'changeName',
      desc: '',
      args: [],
    );
  }

  /// `Choose new profile Photo`
  String get chooseNewProfilePhoto {
    return Intl.message(
      'Choose new profile Photo',
      name: 'chooseNewProfilePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Choose from Gallery`
  String get choosePhoto {
    return Intl.message(
      'Choose from Gallery',
      name: 'choosePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Capture photo`
  String get CapturePhoto {
    return Intl.message(
      'Capture photo',
      name: 'CapturePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Delete photo`
  String get deletePhoto {
    return Intl.message(
      'Delete photo',
      name: 'deletePhoto',
      desc: '',
      args: [],
    );
  }

  /// `done`
  String get updated {
    return Intl.message(
      'done',
      name: 'updated',
      desc: '',
      args: [],
    );
  }

  /// `Add new phone`
  String get addNewPhone {
    return Intl.message(
      'Add new phone',
      name: 'addNewPhone',
      desc: '',
      args: [],
    );
  }

  /// `Edit phoneِ`
  String get editPhone {
    return Intl.message(
      'Edit phoneِ',
      name: 'editPhone',
      desc: '',
      args: [],
    );
  }

  /// `Add new Service`
  String get addNewService {
    return Intl.message(
      'Add new Service',
      name: 'addNewService',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `You can cancel the application file within two hours`
  String get cancelOrderNote {
    return Intl.message(
      'You can cancel the application file within two hours',
      name: 'cancelOrderNote',
      desc: '',
      args: [],
    );
  }

  /// `services`
  String get services {
    return Intl.message(
      'services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `5th settlements`
  String get fixedAddressOne {
    return Intl.message(
      '5th settlements',
      name: 'fixedAddressOne',
      desc: '',
      args: [],
    );
  }

  /// `Delivering to`
  String get deliveringTo {
    return Intl.message(
      'Delivering to',
      name: 'deliveringTo',
      desc: '',
      args: [],
    );
  }

  /// `Request the services you want to reach your home in the fastest time`
  String get homeTitleDesc {
    return Intl.message(
      'Request the services you want to reach your home in the fastest time',
      name: 'homeTitleDesc',
      desc: '',
      args: [],
    );
  }

  /// `Please complete registration form`
  String get pleaseCompeteRegistrationForm {
    return Intl.message(
      'Please complete registration form',
      name: 'pleaseCompeteRegistrationForm',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Start Request`
  String get startRequest {
    return Intl.message(
      'Start Request',
      name: 'startRequest',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Request`
  String get cancelRequest {
    return Intl.message(
      'Cancel Request',
      name: 'cancelRequest',
      desc: '',
      args: [],
    );
  }

  /// `Connect Operator`
  String get connectOperator {
    return Intl.message(
      'Connect Operator',
      name: 'connectOperator',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `accept`
  String get accept {
    return Intl.message(
      'accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Decline`
  String get decline {
    return Intl.message(
      'Decline',
      name: 'decline',
      desc: '',
      args: [],
    );
  }

  /// `success`
  String get success {
    return Intl.message(
      'success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Rejection Reason`
  String get rejectionReason {
    return Intl.message(
      'Rejection Reason',
      name: 'rejectionReason',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `End Request`
  String get endRequest {
    return Intl.message(
      'End Request',
      name: 'endRequest',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get events {
    return Intl.message(
      'Events',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `SUBMIT ORDER`
  String get submitOrder {
    return Intl.message(
      'SUBMIT ORDER',
      name: 'submitOrder',
      desc: '',
      args: [],
    );
  }

  /// `Write you rejection reason`
  String get writeYourRejectionReason {
    return Intl.message(
      'Write you rejection reason',
      name: 'writeYourRejectionReason',
      desc: '',
      args: [],
    );
  }

  /// `Please select Decline Reason`
  String get pleaseSelectDeclineReason {
    return Intl.message(
      'Please select Decline Reason',
      name: 'pleaseSelectDeclineReason',
      desc: '',
      args: [],
    );
  }

  /// `Customer wasnt at home`
  String get customerWasntAthome {
    return Intl.message(
      'Customer wasnt at home',
      name: 'customerWasntAthome',
      desc: '',
      args: [],
    );
  }

  /// `Customer didnt answer my calls`
  String get customerDidntAnswer {
    return Intl.message(
      'Customer didnt answer my calls',
      name: 'customerDidntAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Customer asked me to cancel`
  String get customerAskedToCancel {
    return Intl.message(
      'Customer asked me to cancel',
      name: 'customerAskedToCancel',
      desc: '',
      args: [],
    );
  }

  /// `Customer is rude`
  String get customerIsRude {
    return Intl.message(
      'Customer is rude',
      name: 'customerIsRude',
      desc: '',
      args: [],
    );
  }

  /// `Others and i need one of operations to contact me`
  String get othersAndIneedOneofOperationstoContactMe {
    return Intl.message(
      'Others and i need one of operations to contact me',
      name: 'othersAndIneedOneofOperationstoContactMe',
      desc: '',
      args: [],
    );
  }

  /// `please select reason`
  String get pleaseSelectReason {
    return Intl.message(
      'please select reason',
      name: 'pleaseSelectReason',
      desc: '',
      args: [],
    );
  }

  /// `CANCELLATION REASON`
  String get cancellationReason {
    return Intl.message(
      'CANCELLATION REASON',
      name: 'cancellationReason',
      desc: '',
      args: [],
    );
  }

  /// `Order has \n completed successfully`
  String get OrderHasCompletedSuccessfully {
    return Intl.message(
      'Order has \n completed successfully',
      name: 'OrderHasCompletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `ORDER \n SUBMISSION`
  String get orderSubmission {
    return Intl.message(
      'ORDER \n SUBMISSION',
      name: 'orderSubmission',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Request time`
  String get requestTime {
    return Intl.message(
      'Request time',
      name: 'requestTime',
      desc: '',
      args: [],
    );
  }

  /// `M`
  String get minutes {
    return Intl.message(
      'M',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `H`
  String get hour {
    return Intl.message(
      'H',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `CANCELLATION REASON`
  String get cancelReason {
    return Intl.message(
      'CANCELLATION REASON',
      name: 'cancelReason',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Payment`
  String get confirmPayment {
    return Intl.message(
      'Confirm Payment',
      name: 'confirmPayment',
      desc: '',
      args: [],
    );
  }

  /// `Having a problem getting money? CONTACT OPERATOR`
  String get havingProblemText_1 {
    return Intl.message(
      'Having a problem getting money? CONTACT OPERATOR',
      name: 'havingProblemText_1',
      desc: '',
      args: [],
    );
  }

  /// `of`
  String get ofText {
    return Intl.message(
      'of',
      name: 'ofText',
      desc: '',
      args: [],
    );
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
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}