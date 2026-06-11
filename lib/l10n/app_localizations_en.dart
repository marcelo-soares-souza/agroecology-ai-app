// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Agroecology Map AI';

  @override
  String get betaLabel => 'BETA';

  @override
  String get signIn => 'Sign In';

  @override
  String get signInWelcome => 'Welcome back to Agroecology Map AI';

  @override
  String get signInButton => 'Sign In';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'your@email.com';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Your password';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMinLength => 'Password must be at least 8 characters';

  @override
  String get newPasswordLabel => 'New Password';

  @override
  String get newPasswordHint => 'At least 8 characters';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get noAccount => 'Don\'t have an account? ';

  @override
  String get register => 'Register';

  @override
  String get createAccount => 'Create Account';

  @override
  String get createAccountSubtitle => 'Join the Agroecology Map AI community';

  @override
  String get fullNameLabel => 'Full Name';

  @override
  String get fullNameHint => 'Your name';

  @override
  String get fullNameRequired => 'Full name is required';

  @override
  String get fullNameMaxLength => 'Name must be less than 200 characters';

  @override
  String get answerLabel => 'Answer';

  @override
  String get answerHint => 'Your answer to the question above';

  @override
  String get answerRequired => 'Answer is required';

  @override
  String get hasAccount => 'Already have an account? ';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get resetLinkSent =>
      'If the email exists, a reset link has been sent.';

  @override
  String get resetLinkInstruction =>
      'Enter your email and we\'ll send you a reset link.';

  @override
  String get sendResetLink => 'Send Reset Link';

  @override
  String get backToSignIn => 'Back to Sign In';

  @override
  String get newPassword => 'New Password';

  @override
  String get passwordResetSuccess => 'Password reset successfully.';

  @override
  String get goToSignIn => 'Go to Sign In';

  @override
  String get resetTokenInstruction =>
      'Enter the reset token from your email and your new password.';

  @override
  String get resetTokenLabel => 'Reset Token';

  @override
  String get resetTokenHint => 'Paste the token from your email';

  @override
  String get tokenRequired => 'Token is required';

  @override
  String get resetPasswordButton => 'Reset Password';

  @override
  String get resetFailed => 'Failed to reset password.';

  @override
  String get restoringSession => 'Restoring session...';

  @override
  String get loginFailed => 'Login failed. Please try again.';

  @override
  String get registrationSuccess =>
      'Registration successful. Check your email to confirm your account.';

  @override
  String get registrationFailed => 'Registration failed. Please try again.';

  @override
  String get connectionError => 'Connection error. Please check your network.';

  @override
  String get drawerChat => 'Chat';

  @override
  String get drawerCommunity => 'Community';

  @override
  String get drawerProfile => 'Profile';

  @override
  String get drawerAbout => 'About';

  @override
  String get drawerDonate => 'Donate';

  @override
  String get drawerLogout => 'Logout';

  @override
  String get localePt => 'Português';

  @override
  String get localeEn => 'English';

  @override
  String get localeEs => 'Español';

  @override
  String get localeFr => 'Français';

  @override
  String get chatTitle => 'Chat Agroecológico';

  @override
  String get chatSubtitle => 'Ask questions about agroecology';

  @override
  String get newChat => 'New chat';

  @override
  String get askPlaceholder => 'Ask a question...';

  @override
  String get thinking => 'Thinking...';

  @override
  String get sources => 'Sources';

  @override
  String get sourceFallback => 'Source';

  @override
  String get requestTimeout => 'Request timed out. Please try again.';

  @override
  String get chatEmptyTitle => 'Ask a question about agroecology';

  @override
  String get chatEmptySubtitle =>
      'The AI answers from the knowledge base,\nkeeping sources traceable.';

  @override
  String get chatError => 'An error occurred';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileNotAuth => 'Not authenticated';

  @override
  String get profileNotAuthSub => 'Sign in to view your profile.';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get joined => 'Joined';

  @override
  String get lastLogin => 'Last login';

  @override
  String get about => 'About';

  @override
  String get linkLabel => 'Link';

  @override
  String get openLink => 'Open link';

  @override
  String get save => 'Save';

  @override
  String get nameRequired => 'Name is required';

  @override
  String aboutMaxLength(int count) {
    return 'About must be less than $count characters';
  }

  @override
  String get linkValidation => 'Link must start with http:// or https://';

  @override
  String get linkHint => 'https://example.com';

  @override
  String get aboutHint => 'Tell the community about yourself';

  @override
  String imageTooLarge(int mb) {
    return 'Image must be less than $mb MB';
  }

  @override
  String get uploadAvatarFailed => 'Failed to upload avatar.';

  @override
  String get saveProfileFailed => 'Failed to save profile.';

  @override
  String get communityTitle => 'Community';

  @override
  String get communityEmpty => 'No community members yet';

  @override
  String get communityEmptySub => 'Be the first to join!';

  @override
  String get approvedSuggestions => 'Approved Suggestions';

  @override
  String get aboutPageTitle => 'About';

  @override
  String get aboutText1 =>
      'Agroecology Map AI is a free software tool that makes agroecological knowledge easier to find, understand, and share.';

  @override
  String get aboutText2 =>
      'The AI answers from the knowledge base documents, keeping sources traceable rather than acting as a generic chatbot.';

  @override
  String get aboutText3 =>
      'The project is part of the Agroecology Map ecosystem, a citizen science, open data, and free software initiative that maps agroecological experiences and connects communities.';

  @override
  String get aboutText4 =>
      'The proposal is to support farmers, researchers, extension workers, educators, students, communities, and social movements.';

  @override
  String get donateTitle => 'Donate';

  @override
  String get donateText1 =>
      'Agroecology Map AI is maintained by volunteer work and free software.';

  @override
  String get donateText2 =>
      'Donations help maintain and expand infrastructure, processing, storage, document indexing, and experiments with local models.';

  @override
  String get donateText3 =>
      'Support strengthens an open platform, without paywalls, dedicated to communities, researchers, and farmers.';

  @override
  String get donateButton => 'Donate via Ko-fi';

  @override
  String get donateError => 'Could not open the donation page.';

  @override
  String get retry => 'Retry';

  @override
  String get mySuggestions => 'My Suggestions';

  @override
  String get knowledgeBase => 'Knowledge Base';

  @override
  String get suggestDocument => 'Suggest Document';

  @override
  String get newSuggestion => 'New Suggestion';

  @override
  String get selectPdf => 'Select PDF file';

  @override
  String get pdfOnly => 'Only PDF files are accepted';

  @override
  String get fileRequired => 'A PDF file is required';

  @override
  String fileTooLarge(int size) {
    return 'File must be less than $size MB';
  }

  @override
  String get commentLabel => 'Comment';

  @override
  String get commentHint => 'Why are you suggesting this document?';

  @override
  String get commentRequired => 'A comment is required';

  @override
  String get submitSuggestion => 'Submit Suggestion';

  @override
  String get suggestionCreated => 'Suggestion submitted successfully.';

  @override
  String get deleteSuggestion => 'Delete Suggestion';

  @override
  String get deleteSuggestionConfirm =>
      'Are you sure you want to delete this suggestion?';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get noSuggestions => 'No suggestions yet';

  @override
  String get noSuggestionsSub =>
      'Suggest a document to help grow the knowledge base.';

  @override
  String get allStatus => 'All';

  @override
  String get statusPending => 'pending';

  @override
  String get statusApproved => 'Approved';

  @override
  String get statusRejected => 'Rejected';

  @override
  String get untitled => 'Untitled';

  @override
  String get filename => 'Filename';

  @override
  String get suggestionDetail => 'Suggestion Detail';

  @override
  String get adminComment => 'Admin Comment';

  @override
  String get resultingDocument => 'Resulting Document';

  @override
  String get viewDocument => 'View Document';

  @override
  String get kbTitle => 'Knowledge Base';

  @override
  String get kbEmpty => 'No documents in the knowledge base yet.';

  @override
  String get searchDocuments => 'Search documents...';

  @override
  String indexedCount(int indexed, int total) {
    return '$indexed of $total indexed';
  }

  @override
  String get allIndexed => 'All files indexed';

  @override
  String get documentDetail => 'Document Detail';

  @override
  String get download => 'Download';

  @override
  String get fileType => 'File Type';

  @override
  String get fileSize => 'File Size';

  @override
  String get ingested => 'Indexed';

  @override
  String get notIngested => 'Not indexed';

  @override
  String get drawerPrivacy => 'Privacy Policy';

  @override
  String get drawerTerms => 'Terms of Service';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get privacyPolicyLastUpdated => 'Last updated: June 11, 2026';

  @override
  String get privacyPolicyContent =>
      'Agroecology Map AI is a free software platform for querying agroecological knowledge with AI.\n\nData We Collect:\n- Full name, email, and hashed password for account access\n- Preferred language/locale\n- Optional profile data: bio, external link, and avatar\n- Document suggestion comments and uploaded files, when you choose to submit them\n- IP address in transient request logs for security and debugging\n\nLocal Storage:\nThe app may store session data, consent choice, language preference, and recent chat history on your device.\n\nLocal AI Processing:\nAI models and embeddings run locally or on infrastructure controlled by the project. Questions, chat history, embeddings, and documents are not sent to external AI APIs.\n\nWe DO NOT collect advertising IDs, browsing history, background location, contacts, or sensitive personal data.\n\nData Sharing:\nWe do not sell, rent, trade, or share your personal data with advertisers, data brokers, external analytics services, or external AI providers. Donation links may open Ko-fi or Patreon, which use their own policies.\n\nYour Rights:\nYou can export your data, edit your profile, delete your account, request portability, and withdraw consent by stopping use or deleting your account.\n\nAccount Deletion:\nUse \'Delete My Account\' in your profile. A confirmation email is sent. Once confirmed, personal data is permanently anonymized and sessions are terminated.\n\nMobile Privacy:\nThe app does not request camera, microphone, contacts, or location access. Photo library access may be requested only when you choose a profile avatar; only the selected image is uploaded. The app has no third-party analytics SDKs and uses HTTPS.\n\nContact and DPO: contact@agroecologymap.org\nLicense: GPLv3 (Free Software)\nRepository: https://codeberg.org/agroecologymap';

  @override
  String get termsOfServiceTitle => 'Terms of Service';

  @override
  String get termsOfServiceLastUpdated => 'Last updated: June 11, 2026';

  @override
  String get termsOfServiceContent =>
      '1. Acceptance of Terms\nBy creating an account and using Agroecology Map AI, you agree to these Terms of Service.\n\n2. Description of Service\nAgroecology Map AI is a free software AI chat platform for querying agroecological knowledge. AI models and embeddings run locally or on infrastructure controlled by the project, without external AI APIs.\n\n3. User Accounts\nYou are responsible for your account credentials. You must provide accurate registration information. Minimum age: 16 years.\n\n4. Acceptable Use\nDo not use the platform for illegal purposes, submit harmful content, attempt to disrupt service, use automated means without permission, or misrepresent your identity.\n\n5. User Content\nBy submitting content, you grant the platform a non-exclusive license to display it within the platform. You retain ownership.\n\n6. Intellectual Property\nThe software is GPLv3 licensed. Document content retains its original licenses.\n\n7. Disclaimer\nThe platform is provided \'AS IS\'. AI-generated answers may not be accurate. Always verify with primary sources.\n\n8. Limitation of Liability\nThe project and its volunteers are not liable for damages arising from platform use to the extent permitted by law.\n\n9. Account Termination\nAccounts violating these terms may be suspended. Users may delete accounts at any time.\n\n10. Modifications\nTerms may be updated. Material changes communicated via email.\n\n11. Governing Law\nGoverned by the laws of Brazil.\n\n12. Contact\ncontact@agroecologymap.org';

  @override
  String get acceptPrivacyPrefix => 'I accept the ';

  @override
  String get acceptPrivacyLink => 'Privacy Policy';

  @override
  String get acceptTosPrefix => 'I accept the ';

  @override
  String get acceptTosLink => 'Terms of Service';

  @override
  String get dataAndPrivacy => 'Data & Privacy';

  @override
  String get exportMyData => 'Export My Data';

  @override
  String get exportSuccess => 'Data exported successfully';

  @override
  String get exportFailed => 'Failed to export data';

  @override
  String get deleteMyAccount => 'Delete My Account';

  @override
  String get deleteAccountConfirmTitle => 'Delete Account';

  @override
  String get deleteAccountConfirmBody =>
      'Are you sure? A confirmation email will be sent. Once confirmed, your personal data will be permanently anonymized.';

  @override
  String get deleteAccountConfirmButton => 'Delete';

  @override
  String get deleteAccountFailed => 'Failed to request account deletion';

  @override
  String get consentMessage =>
      'This app does not use advertising cookies or third-party trackers. We use local storage for session, language, consent choice, and chat history on this device. By continuing, you acknowledge our';

  @override
  String get consentAnd => 'and';

  @override
  String get consentAccept => 'Accept';

  @override
  String get consentDecline => 'Decline';

  @override
  String get statusActive => 'active';

  @override
  String get statusSuspended => 'suspended';

  @override
  String get statusDeleted => 'deleted';

  @override
  String get roleAdmin => 'admin';

  @override
  String get roleUser => 'user';
}
