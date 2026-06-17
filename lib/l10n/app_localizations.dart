import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('pt'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Agroecology Map AI'**
  String get appName;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signInWelcome.
  ///
  /// In en, this message translates to:
  /// **'Sign in to ask sourced questions, continue your history, and contribute to the agroecology knowledge base.'**
  String get signInWelcome;

  /// No description provided for @signInButton.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInButton;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'your@email.com'**
  String get emailHint;

  /// No description provided for @emailHelper.
  ///
  /// In en, this message translates to:
  /// **'Use your account email to receive confirmations and important notices.'**
  String get emailHelper;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Your password'**
  String get passwordHint;

  /// No description provided for @passwordHelper.
  ///
  /// In en, this message translates to:
  /// **'Your password protects access to your history and profile.'**
  String get passwordHelper;

  /// No description provided for @passwordVisibilityTooltip.
  ///
  /// In en, this message translates to:
  /// **'Show or hide the typed password.'**
  String get passwordVisibilityTooltip;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordMinLength;

  /// No description provided for @newPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPasswordLabel;

  /// No description provided for @newPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get newPasswordHint;

  /// No description provided for @newPasswordHelper.
  ///
  /// In en, this message translates to:
  /// **'Use a unique password with at least 8 characters.'**
  String get newPasswordHelper;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get noAccount;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @createAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create an account to suggest documents, keep a public profile, and strengthen an open knowledge base.'**
  String get createAccountSubtitle;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullNameLabel;

  /// No description provided for @fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get fullNameHint;

  /// No description provided for @fullNameHelper.
  ///
  /// In en, this message translates to:
  /// **'This name appears on your profile and helps the community recognize your contributions.'**
  String get fullNameHelper;

  /// No description provided for @fullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name is required'**
  String get fullNameRequired;

  /// No description provided for @fullNameMaxLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be less than 200 characters'**
  String get fullNameMaxLength;

  /// No description provided for @answerLabel.
  ///
  /// In en, this message translates to:
  /// **'Answer'**
  String get answerLabel;

  /// No description provided for @answerHint.
  ///
  /// In en, this message translates to:
  /// **'Your answer to the question above'**
  String get answerHint;

  /// No description provided for @answerHelper.
  ///
  /// In en, this message translates to:
  /// **'This simple step helps protect the community from automated signups.'**
  String get answerHelper;

  /// No description provided for @answerRequired.
  ///
  /// In en, this message translates to:
  /// **'Answer is required'**
  String get answerRequired;

  /// No description provided for @hasAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get hasAccount;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @resetLinkSent.
  ///
  /// In en, this message translates to:
  /// **'If the email exists, a reset link has been sent.'**
  String get resetLinkSent;

  /// No description provided for @resetLinkInstruction.
  ///
  /// In en, this message translates to:
  /// **'Enter your account email to receive a secure reset link.'**
  String get resetLinkInstruction;

  /// No description provided for @resetEmailHelper.
  ///
  /// In en, this message translates to:
  /// **'We send the link only if the email is registered.'**
  String get resetEmailHelper;

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get sendResetLink;

  /// No description provided for @backToSignIn.
  ///
  /// In en, this message translates to:
  /// **'Back to Sign In'**
  String get backToSignIn;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @passwordResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully.'**
  String get passwordResetSuccess;

  /// No description provided for @goToSignIn.
  ///
  /// In en, this message translates to:
  /// **'Go to Sign In'**
  String get goToSignIn;

  /// No description provided for @resetTokenInstruction.
  ///
  /// In en, this message translates to:
  /// **'Enter the reset token from your email and your new password.'**
  String get resetTokenInstruction;

  /// No description provided for @resetTokenLabel.
  ///
  /// In en, this message translates to:
  /// **'Reset Token'**
  String get resetTokenLabel;

  /// No description provided for @resetTokenHint.
  ///
  /// In en, this message translates to:
  /// **'Paste the token from your email'**
  String get resetTokenHint;

  /// No description provided for @resetTokenHelper.
  ///
  /// In en, this message translates to:
  /// **'Use the exact token received by email before setting the new password.'**
  String get resetTokenHelper;

  /// No description provided for @tokenRequired.
  ///
  /// In en, this message translates to:
  /// **'Token is required'**
  String get tokenRequired;

  /// No description provided for @resetPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordButton;

  /// No description provided for @resetFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to reset password.'**
  String get resetFailed;

  /// No description provided for @restoringSession.
  ///
  /// In en, this message translates to:
  /// **'Restoring session...'**
  String get restoringSession;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please try again.'**
  String get loginFailed;

  /// No description provided for @registrationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Registration successful. Check your email to confirm your account.'**
  String get registrationSuccess;

  /// No description provided for @registrationFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed. Please try again.'**
  String get registrationFailed;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'Connection error. Please check your network.'**
  String get connectionError;

  /// No description provided for @drawerHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get drawerHome;

  /// No description provided for @drawerChat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get drawerChat;

  /// No description provided for @drawerCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get drawerCommunity;

  /// No description provided for @drawerProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get drawerProfile;

  /// No description provided for @drawerAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get drawerAbout;

  /// No description provided for @drawerLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get drawerLogout;

  /// No description provided for @homeIntro.
  ///
  /// In en, this message translates to:
  /// **'Ask questions with traceable sources, explore curated documents, and help the community grow an open agroecology knowledge base.'**
  String get homeIntro;

  /// No description provided for @localePt.
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get localePt;

  /// No description provided for @localeEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get localeEn;

  /// No description provided for @localeEs.
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get localeEs;

  /// No description provided for @localeFr.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get localeFr;

  /// No description provided for @chatTitle.
  ///
  /// In en, this message translates to:
  /// **'Agroecology Chat'**
  String get chatTitle;

  /// No description provided for @chatSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Ask in natural language and get answers grounded in curated documents, with sources you can verify.'**
  String get chatSubtitle;

  /// No description provided for @newChat.
  ///
  /// In en, this message translates to:
  /// **'New chat'**
  String get newChat;

  /// No description provided for @newChatTooltip.
  ///
  /// In en, this message translates to:
  /// **'Clears the current conversation and starts a new question from scratch.'**
  String get newChatTooltip;

  /// No description provided for @askPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Ask a question...'**
  String get askPlaceholder;

  /// No description provided for @sendQuestionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Send your question to the knowledge base.'**
  String get sendQuestionTooltip;

  /// No description provided for @chatGuidanceTitle.
  ///
  /// In en, this message translates to:
  /// **'For better answers'**
  String get chatGuidanceTitle;

  /// No description provided for @chatGuidanceBody.
  ///
  /// In en, this message translates to:
  /// **'Include context, territory, crop, observed issue, or goal. The AI searches relevant passages and shows sources when available.'**
  String get chatGuidanceBody;

  /// No description provided for @chatSourcesTooltip.
  ///
  /// In en, this message translates to:
  /// **'Answers prioritize indexed knowledge-base documents. Always check the sources before making technical decisions.'**
  String get chatSourcesTooltip;

  /// No description provided for @thinking.
  ///
  /// In en, this message translates to:
  /// **'Thinking...'**
  String get thinking;

  /// No description provided for @sources.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get sources;

  /// No description provided for @sourceFallback.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get sourceFallback;

  /// No description provided for @requestTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request timed out. Please try again.'**
  String get requestTimeout;

  /// No description provided for @chatEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Ask a question about agroecology'**
  String get chatEmptyTitle;

  /// No description provided for @chatEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try asking about management, soil, seeds, agroforestry, public policy, or community practices.'**
  String get chatEmptySubtitle;

  /// No description provided for @chatError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get chatError;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Show who you are, connect your contributions, and keep control of your data.'**
  String get profileSubtitle;

  /// No description provided for @profileNotAuth.
  ///
  /// In en, this message translates to:
  /// **'Not authenticated'**
  String get profileNotAuth;

  /// No description provided for @profileNotAuthSub.
  ///
  /// In en, this message translates to:
  /// **'Sign in to view your profile.'**
  String get profileNotAuthSub;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @editProfileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Update the information that helps others understand your connection with agroecology.'**
  String get editProfileSubtitle;

  /// No description provided for @profileVisibilityTooltip.
  ///
  /// In en, this message translates to:
  /// **'Active profiles may appear in the community. Edit only information you want to make public.'**
  String get profileVisibilityTooltip;

  /// No description provided for @joined.
  ///
  /// In en, this message translates to:
  /// **'Joined'**
  String get joined;

  /// No description provided for @lastLogin.
  ///
  /// In en, this message translates to:
  /// **'Last login'**
  String get lastLogin;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @linkLabel.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get linkLabel;

  /// No description provided for @openLink.
  ///
  /// In en, this message translates to:
  /// **'Open link'**
  String get openLink;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// No description provided for @aboutMaxLength.
  ///
  /// In en, this message translates to:
  /// **'About must be less than {count} characters'**
  String aboutMaxLength(int count);

  /// No description provided for @linkValidation.
  ///
  /// In en, this message translates to:
  /// **'Link must start with http:// or https://'**
  String get linkValidation;

  /// No description provided for @linkHint.
  ///
  /// In en, this message translates to:
  /// **'https://example.com'**
  String get linkHint;

  /// No description provided for @aboutHint.
  ///
  /// In en, this message translates to:
  /// **'Share your work, territory, research, organization, or agroecological practice'**
  String get aboutHint;

  /// No description provided for @aboutHelper.
  ///
  /// In en, this message translates to:
  /// **'A clear summary helps others understand your context and contributions.'**
  String get aboutHelper;

  /// No description provided for @linkHelper.
  ///
  /// In en, this message translates to:
  /// **'Add a website, institutional profile, project, or public reference related to your work.'**
  String get linkHelper;

  /// No description provided for @avatarTooltip.
  ///
  /// In en, this message translates to:
  /// **'Select a profile image. Only the chosen image will be uploaded.'**
  String get avatarTooltip;

  /// No description provided for @imageTooLarge.
  ///
  /// In en, this message translates to:
  /// **'Image must be less than {mb} MB'**
  String imageTooLarge(int mb);

  /// No description provided for @uploadAvatarFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload avatar.'**
  String get uploadAvatarFailed;

  /// No description provided for @saveProfileFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save profile.'**
  String get saveProfileFailed;

  /// No description provided for @communityTitle.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get communityTitle;

  /// No description provided for @communitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find people and organizations contributing documents, practices, and agroecological knowledge.'**
  String get communitySubtitle;

  /// No description provided for @communityEmpty.
  ///
  /// In en, this message translates to:
  /// **'No community members yet'**
  String get communityEmpty;

  /// No description provided for @communityEmptySub.
  ///
  /// In en, this message translates to:
  /// **'Create a profile and suggest documents to start building the network.'**
  String get communityEmptySub;

  /// No description provided for @searchCommunityTooltip.
  ///
  /// In en, this message translates to:
  /// **'Search by name or public identifier.'**
  String get searchCommunityTooltip;

  /// No description provided for @approvedSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Approved Suggestions'**
  String get approvedSuggestions;

  /// No description provided for @approvedSuggestionsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Number of documents suggested by this person that were approved for the knowledge base.'**
  String get approvedSuggestionsTooltip;

  /// No description provided for @aboutPageTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutPageTitle;

  /// No description provided for @aboutPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A free software tool to research, verify, and strengthen agroecological knowledge.'**
  String get aboutPageSubtitle;

  /// No description provided for @aboutValueTitle.
  ///
  /// In en, this message translates to:
  /// **'Core value'**
  String get aboutValueTitle;

  /// No description provided for @aboutValueBody.
  ///
  /// In en, this message translates to:
  /// **'The platform combines AI, curated documents, and community participation to make agroecological references easier to find and verify.'**
  String get aboutValueBody;

  /// No description provided for @aboutText1.
  ///
  /// In en, this message translates to:
  /// **'Agroecology Map AI helps people explore agroecological knowledge through a free software assistant grounded in curated documents and community context.'**
  String get aboutText1;

  /// No description provided for @aboutText2.
  ///
  /// In en, this message translates to:
  /// **'Answers are generated from the knowledge base and keep sources traceable, so the app works as a guided research tool instead of a generic chatbot.'**
  String get aboutText2;

  /// No description provided for @aboutText3.
  ///
  /// In en, this message translates to:
  /// **'The project belongs to the Agroecology Map ecosystem, an open data and citizen science initiative that maps experiences, documents practices, and connects territories.'**
  String get aboutText3;

  /// No description provided for @aboutText4.
  ///
  /// In en, this message translates to:
  /// **'It is built for farmers, educators, researchers, extension workers, students, communities, and social movements that need practical agroecological references.'**
  String get aboutText4;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @mySuggestions.
  ///
  /// In en, this message translates to:
  /// **'My Suggestions'**
  String get mySuggestions;

  /// No description provided for @suggestionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track submitted documents, review status, and materials that may enter the public knowledge base.'**
  String get suggestionsSubtitle;

  /// No description provided for @knowledgeBase.
  ///
  /// In en, this message translates to:
  /// **'Knowledge Base'**
  String get knowledgeBase;

  /// No description provided for @kbSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Browse the documents that ground AI answers and see which ones are already indexed for search.'**
  String get kbSubtitle;

  /// No description provided for @suggestDocument.
  ///
  /// In en, this message translates to:
  /// **'Suggest Document'**
  String get suggestDocument;

  /// No description provided for @suggestionCountLabel.
  ///
  /// In en, this message translates to:
  /// **'suggestions'**
  String get suggestionCountLabel;

  /// No description provided for @newSuggestion.
  ///
  /// In en, this message translates to:
  /// **'New Suggestion'**
  String get newSuggestion;

  /// No description provided for @newSuggestionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Send relevant materials to expand the coverage of the knowledge base.'**
  String get newSuggestionSubtitle;

  /// No description provided for @suggestionReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'How review works'**
  String get suggestionReviewTitle;

  /// No description provided for @suggestionReviewBody.
  ///
  /// In en, this message translates to:
  /// **'The team checks relevance, quality, and fit before approving a document for public consultation.'**
  String get suggestionReviewBody;

  /// No description provided for @selectPdf.
  ///
  /// In en, this message translates to:
  /// **'Select PDF file'**
  String get selectPdf;

  /// No description provided for @pdfUploadTooltip.
  ///
  /// In en, this message translates to:
  /// **'Upload a readable PDF, preferably with title, authorship, and useful content for consultation.'**
  String get pdfUploadTooltip;

  /// No description provided for @pdfOnly.
  ///
  /// In en, this message translates to:
  /// **'Only PDF files are accepted'**
  String get pdfOnly;

  /// No description provided for @fileRequired.
  ///
  /// In en, this message translates to:
  /// **'A PDF file is required'**
  String get fileRequired;

  /// No description provided for @fileTooLarge.
  ///
  /// In en, this message translates to:
  /// **'File must be less than {size} MB'**
  String fileTooLarge(int size);

  /// No description provided for @commentLabel.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get commentLabel;

  /// No description provided for @commentHint.
  ///
  /// In en, this message translates to:
  /// **'Explain why this document matters for agroecology'**
  String get commentHint;

  /// No description provided for @commentHelper.
  ///
  /// In en, this message translates to:
  /// **'Say where the material comes from, who it helps, and why it should enter the base.'**
  String get commentHelper;

  /// No description provided for @commentRequired.
  ///
  /// In en, this message translates to:
  /// **'A comment is required'**
  String get commentRequired;

  /// No description provided for @submitSuggestion.
  ///
  /// In en, this message translates to:
  /// **'Submit Suggestion'**
  String get submitSuggestion;

  /// No description provided for @suggestionCreated.
  ///
  /// In en, this message translates to:
  /// **'Suggestion submitted successfully.'**
  String get suggestionCreated;

  /// No description provided for @deleteSuggestion.
  ///
  /// In en, this message translates to:
  /// **'Delete Suggestion'**
  String get deleteSuggestion;

  /// No description provided for @deleteSuggestionConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this suggestion?'**
  String get deleteSuggestionConfirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @noSuggestions.
  ///
  /// In en, this message translates to:
  /// **'No suggestions yet'**
  String get noSuggestions;

  /// No description provided for @noSuggestionsSub.
  ///
  /// In en, this message translates to:
  /// **'Suggest a document to help grow the knowledge base.'**
  String get noSuggestionsSub;

  /// No description provided for @suggestionStatusTooltip.
  ///
  /// In en, this message translates to:
  /// **'Pending waits for review; approved enters the knowledge-base flow; rejected needs changes or does not fit.'**
  String get suggestionStatusTooltip;

  /// No description provided for @allStatus.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allStatus;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'pending'**
  String get statusPending;

  /// No description provided for @statusApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get statusApproved;

  /// No description provided for @statusRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusRejected;

  /// No description provided for @untitled.
  ///
  /// In en, this message translates to:
  /// **'Untitled'**
  String get untitled;

  /// No description provided for @filename.
  ///
  /// In en, this message translates to:
  /// **'Filename'**
  String get filename;

  /// No description provided for @suggestionDetail.
  ///
  /// In en, this message translates to:
  /// **'Suggestion Detail'**
  String get suggestionDetail;

  /// No description provided for @adminComment.
  ///
  /// In en, this message translates to:
  /// **'Admin Comment'**
  String get adminComment;

  /// No description provided for @resultingDocument.
  ///
  /// In en, this message translates to:
  /// **'Resulting Document'**
  String get resultingDocument;

  /// No description provided for @viewDocument.
  ///
  /// In en, this message translates to:
  /// **'View Document'**
  String get viewDocument;

  /// No description provided for @kbTitle.
  ///
  /// In en, this message translates to:
  /// **'Knowledge Base'**
  String get kbTitle;

  /// No description provided for @kbEmpty.
  ///
  /// In en, this message translates to:
  /// **'No documents in the knowledge base yet.'**
  String get kbEmpty;

  /// No description provided for @searchDocuments.
  ///
  /// In en, this message translates to:
  /// **'Search documents...'**
  String get searchDocuments;

  /// No description provided for @searchDocumentsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Search by title, authorship, or filename.'**
  String get searchDocumentsTooltip;

  /// No description provided for @indexedCount.
  ///
  /// In en, this message translates to:
  /// **'{indexed} of {total} indexed'**
  String indexedCount(int indexed, int total);

  /// No description provided for @allIndexed.
  ///
  /// In en, this message translates to:
  /// **'All files indexed'**
  String get allIndexed;

  /// No description provided for @indexedDocsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} indexed documents'**
  String indexedDocsCount(int count);

  /// No description provided for @kbIndexedTooltip.
  ///
  /// In en, this message translates to:
  /// **'Indexed documents can already be found by chat. Non-indexed files can still be read manually.'**
  String get kbIndexedTooltip;

  /// No description provided for @documentDetail.
  ///
  /// In en, this message translates to:
  /// **'Document Detail'**
  String get documentDetail;

  /// No description provided for @documentIndexedTitle.
  ///
  /// In en, this message translates to:
  /// **'Available to AI'**
  String get documentIndexedTitle;

  /// No description provided for @documentIndexedBody.
  ///
  /// In en, this message translates to:
  /// **'This document has been indexed and may be used to ground chat answers.'**
  String get documentIndexedBody;

  /// No description provided for @documentNotIndexedTitle.
  ///
  /// In en, this message translates to:
  /// **'Not indexed yet'**
  String get documentNotIndexedTitle;

  /// No description provided for @documentNotIndexedBody.
  ///
  /// In en, this message translates to:
  /// **'The file is available for reading, but it is not yet used in AI answers.'**
  String get documentNotIndexedBody;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @downloadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to download document'**
  String get downloadError;

  /// No description provided for @downloadSuccess.
  ///
  /// In en, this message translates to:
  /// **'Document saved successfully'**
  String get downloadSuccess;

  /// No description provided for @fileType.
  ///
  /// In en, this message translates to:
  /// **'File Type'**
  String get fileType;

  /// No description provided for @fileSize.
  ///
  /// In en, this message translates to:
  /// **'File Size'**
  String get fileSize;

  /// No description provided for @ingested.
  ///
  /// In en, this message translates to:
  /// **'Indexed'**
  String get ingested;

  /// No description provided for @notIngested.
  ///
  /// In en, this message translates to:
  /// **'Not indexed'**
  String get notIngested;

  /// No description provided for @drawerPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get drawerPrivacy;

  /// No description provided for @drawerTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get drawerTerms;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: June 11, 2026'**
  String get privacyPolicyLastUpdated;

  /// No description provided for @privacyPolicyContent.
  ///
  /// In en, this message translates to:
  /// **'Agroecology Map AI is a free software platform for querying agroecological knowledge with AI.\n\nData We Collect:\n- Full name, email, and hashed password for account access\n- Preferred language/locale\n- Optional profile data: bio, external link, and avatar\n- Document suggestion comments and uploaded files, when you choose to submit them\n- IP address in transient request logs for security and debugging\n\nLocal Storage:\nThe app may store session data, language preference, and recent chat history on your device.\n\nLocal AI Processing:\nAI models and embeddings run locally or on infrastructure controlled by the project. Questions, chat history, embeddings, and documents are not sent to external AI APIs.\n\nWe DO NOT collect advertising IDs, browsing history, background location, contacts, payment information, or sensitive personal data.\n\nData Sharing:\nWe do not sell, rent, trade, or share your personal data with advertisers, data brokers, external analytics services, or external AI providers.\n\nYour Rights:\nYou can export your data, edit your profile, delete your account, request portability, and withdraw consent by stopping use or deleting your account.\n\nAccount Deletion:\nUse \'Delete My Account\' in your profile. A confirmation email is sent. Once confirmed, personal data is permanently anonymized and sessions are terminated.\n\nMobile Privacy:\nThe app does not request camera, microphone, contacts, or location access. Photo library access may be requested only when you choose a profile avatar; only the selected image is uploaded. The app has no third-party analytics SDKs and uses HTTPS.\n\nContact and DPO: contact@agroecologymap.org\nLicense: GPLv3 (Free Software)\nRepository: https://codeberg.org/agroecologymap'**
  String get privacyPolicyContent;

  /// No description provided for @termsOfServiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfServiceTitle;

  /// No description provided for @termsOfServiceLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: June 11, 2026'**
  String get termsOfServiceLastUpdated;

  /// No description provided for @termsOfServiceContent.
  ///
  /// In en, this message translates to:
  /// **'1. Acceptance of Terms\nBy creating an account and using Agroecology Map AI, you agree to these Terms of Service.\n\n2. Description of Service\nAgroecology Map AI is a free software AI chat platform for querying agroecological knowledge. AI models and embeddings run locally or on infrastructure controlled by the project, without external AI APIs.\n\n3. User Accounts\nYou are responsible for your account credentials. You must provide accurate registration information. Minimum age: 16 years.\n\n4. Acceptable Use\nDo not use the platform for illegal purposes, submit harmful content, attempt to disrupt service, use automated means without permission, or misrepresent your identity.\n\n5. User Content\nBy submitting content, you grant the platform a non-exclusive license to display it within the platform. You retain ownership.\n\n6. Intellectual Property\nThe software is GPLv3 licensed. Document content retains its original licenses.\n\n7. Disclaimer\nThe platform is provided \'AS IS\'. AI-generated answers may not be accurate. Always verify with primary sources.\n\n8. Limitation of Liability\nThe project and its volunteers are not liable for damages arising from platform use to the extent permitted by law.\n\n9. Account Termination\nAccounts violating these terms may be suspended. Users may delete accounts at any time.\n\n10. Modifications\nTerms may be updated. Material changes communicated via email.\n\n11. Governing Law\nGoverned by the laws of Brazil.\n\n12. Contact\ncontact@agroecologymap.org'**
  String get termsOfServiceContent;

  /// No description provided for @acceptPrivacyPrefix.
  ///
  /// In en, this message translates to:
  /// **'I accept the '**
  String get acceptPrivacyPrefix;

  /// No description provided for @acceptPrivacyLink.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get acceptPrivacyLink;

  /// No description provided for @acceptTosPrefix.
  ///
  /// In en, this message translates to:
  /// **'I accept the '**
  String get acceptTosPrefix;

  /// No description provided for @acceptTosLink.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get acceptTosLink;

  /// No description provided for @dataAndPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Data & Privacy'**
  String get dataAndPrivacy;

  /// No description provided for @dataAndPrivacySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Export your data when needed and request account deletion with email confirmation.'**
  String get dataAndPrivacySubtitle;

  /// No description provided for @exportMyData.
  ///
  /// In en, this message translates to:
  /// **'Export My Data'**
  String get exportMyData;

  /// No description provided for @exportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Data exported successfully'**
  String get exportSuccess;

  /// No description provided for @exportFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to export data'**
  String get exportFailed;

  /// No description provided for @deleteMyAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete My Account'**
  String get deleteMyAccount;

  /// No description provided for @deleteAccountConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccountConfirmTitle;

  /// No description provided for @deleteAccountConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure? A confirmation email will be sent. Once confirmed, your personal data will be permanently anonymized.'**
  String get deleteAccountConfirmBody;

  /// No description provided for @deleteAccountConfirmButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteAccountConfirmButton;

  /// No description provided for @deleteAccountFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to request account deletion'**
  String get deleteAccountFailed;

  /// No description provided for @statusActive.
  ///
  /// In en, this message translates to:
  /// **'active'**
  String get statusActive;

  /// No description provided for @statusSuspended.
  ///
  /// In en, this message translates to:
  /// **'suspended'**
  String get statusSuspended;

  /// No description provided for @statusDeleted.
  ///
  /// In en, this message translates to:
  /// **'deleted'**
  String get statusDeleted;

  /// No description provided for @roleAdmin.
  ///
  /// In en, this message translates to:
  /// **'admin'**
  String get roleAdmin;

  /// No description provided for @roleUser.
  ///
  /// In en, this message translates to:
  /// **'user'**
  String get roleUser;

  /// No description provided for @loggedOut.
  ///
  /// In en, this message translates to:
  /// **'You have been logged out.'**
  String get loggedOut;

  /// No description provided for @searchCommunity.
  ///
  /// In en, this message translates to:
  /// **'Search community...'**
  String get searchCommunity;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'No matching members'**
  String get searchNoResults;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'fr', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
