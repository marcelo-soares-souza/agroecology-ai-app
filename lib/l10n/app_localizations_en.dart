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
  String get signIn => 'Sign In';

  @override
  String get signInWelcome =>
      'Sign in to ask sourced questions, continue your history, and contribute to the agroecology knowledge base.';

  @override
  String get signInButton => 'Sign In';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'your@email.com';

  @override
  String get emailHelper =>
      'Use your account email to receive confirmations and important notices.';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Your password';

  @override
  String get passwordHelper =>
      'Your password protects access to your history and profile.';

  @override
  String get passwordVisibilityTooltip => 'Show or hide the typed password.';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMinLength => 'Password must be at least 8 characters';

  @override
  String get newPasswordLabel => 'New Password';

  @override
  String get newPasswordHint => 'At least 8 characters';

  @override
  String get newPasswordHelper =>
      'Use a unique password with at least 8 characters.';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get noAccount => 'Don\'t have an account? ';

  @override
  String get register => 'Register';

  @override
  String get createAccount => 'Create Account';

  @override
  String get createAccountSubtitle =>
      'Create an account to suggest documents, keep a public profile, and strengthen an open knowledge base.';

  @override
  String get fullNameLabel => 'Full Name';

  @override
  String get fullNameHint => 'Your name';

  @override
  String get fullNameHelper =>
      'This name appears on your profile and helps the community recognize your contributions.';

  @override
  String get fullNameRequired => 'Full name is required';

  @override
  String get fullNameMaxLength => 'Name must be less than 200 characters';

  @override
  String get answerLabel => 'Answer';

  @override
  String get answerHint => 'Your answer to the question above';

  @override
  String get answerHelper =>
      'This simple step helps protect the community from automated signups.';

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
      'Enter your account email to receive a secure reset link.';

  @override
  String get resetEmailHelper =>
      'We send the link only if the email is registered.';

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
  String get confirmingEmail => 'Confirming your email...';

  @override
  String get emailConfirmationTitle => 'Email Confirmation';

  @override
  String get emailConfirmedTitle => 'Email Confirmed';

  @override
  String get emailConfirmationFailed => 'Failed to confirm email.';

  @override
  String get missingToken => 'The confirmation token is missing.';

  @override
  String get resendConfirmationTitle => 'Resend Confirmation';

  @override
  String get resendConfirmationInstruction =>
      'Enter your account email to receive a new confirmation link.';

  @override
  String get resendConfirmationButton => 'Resend Confirmation';

  @override
  String get resendConfirmationSentTitle => 'Confirmation Sent';

  @override
  String get resendConfirmationSentBody =>
      'If the email exists and still needs confirmation, a new link was sent.';

  @override
  String get resendConfirmationFailed => 'Failed to resend confirmation.';

  @override
  String get deleteAccountConfirming => 'Confirming account deletion...';

  @override
  String get accountDeletedTitle => 'Account Deleted';

  @override
  String get resetTokenInstruction =>
      'Enter the reset token from your email and your new password.';

  @override
  String get resetTokenLabel => 'Reset Token';

  @override
  String get resetTokenHint => 'Paste the token from your email';

  @override
  String get resetTokenHelper =>
      'Use the exact token received by email before setting the new password.';

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
  String get authRateLimited =>
      'Too many attempts failed. Wait before trying again.';

  @override
  String get authRateLimitTitle => 'Access temporarily blocked';

  @override
  String get authRateLimitDescription =>
      'Too many attempts failed. Wait for the indicated time before trying again.';

  @override
  String authRateLimitRetryIn(String time) {
    return 'Try again in $time.';
  }

  @override
  String get authRateLimitRetryAvailable => 'You can try again now.';

  @override
  String get authRateLimitTryAgain => 'Try again';

  @override
  String get connectionError => 'Connection error. Please check your network.';

  @override
  String get drawerHome => 'Home';

  @override
  String get drawerChat => 'Chat';

  @override
  String get drawerCommunity => 'Community';

  @override
  String get drawerProfile => 'Profile';

  @override
  String get drawerAbout => 'About';

  @override
  String get drawerLogout => 'Logout';

  @override
  String get homeIntro =>
      'Ask questions with traceable sources, explore curated documents, and help the community grow an open agroecology knowledge base.';

  @override
  String get localePt => 'Português';

  @override
  String get localeEn => 'English';

  @override
  String get localeEs => 'Español';

  @override
  String get localeFr => 'Français';

  @override
  String get chatTitle => 'Agroecology Chat';

  @override
  String get chatSubtitle =>
      'Ask in natural language and get answers grounded in curated documents, with sources you can verify.';

  @override
  String get newChat => 'New chat';

  @override
  String get newChatTooltip => 'Creates a new saved conversation.';

  @override
  String get chatConversations => 'Conversations';

  @override
  String get noChatConversations => 'No saved conversations yet.';

  @override
  String get deleteChatConversation => 'Delete conversation';

  @override
  String get deleteChatConversationConfirm =>
      'Delete this conversation and all its messages?';

  @override
  String get chatConversationLimitReached =>
      'You have reached the limit of 10 saved conversations. Delete one to start a new chat.';

  @override
  String get askPlaceholder => 'Ask a question...';

  @override
  String get sendQuestionTooltip => 'Send your question to the knowledge base.';

  @override
  String get chatGuidanceTitle => 'For better answers';

  @override
  String get chatGuidanceBody =>
      'Include context, territory, crop, observed issue, or goal. The AI searches relevant passages and shows sources when available.';

  @override
  String get chatSourcesTooltip =>
      'Answers prioritize indexed knowledge-base documents. Always check the sources before making technical decisions.';

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
      'Try asking about management, soil, seeds, agroforestry, public policy, or community practices.';

  @override
  String get chatError => 'An error occurred';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileSubtitle =>
      'Show who you are, connect your contributions, and keep control of your data.';

  @override
  String get profileNotAuth => 'Not authenticated';

  @override
  String get profileNotAuthSub => 'Sign in to view your profile.';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get editProfileSubtitle =>
      'Update the information that helps others understand your connection with agroecology.';

  @override
  String get profileVisibilityTooltip =>
      'Active profiles may appear in the community. Edit only information you want to make public.';

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
  String get aboutHint =>
      'Share your work, territory, research, organization, or agroecological practice';

  @override
  String get aboutHelper =>
      'A clear summary helps others understand your context and contributions.';

  @override
  String get linkHelper =>
      'Add a website, institutional profile, project, or public reference related to your work.';

  @override
  String get avatarTooltip =>
      'Select a profile image. Only the chosen image will be uploaded.';

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
  String get communitySubtitle =>
      'Find people and organizations contributing documents, practices, and agroecological knowledge.';

  @override
  String get communityEmpty => 'No community members yet';

  @override
  String get communityEmptySub =>
      'Create a profile and suggest documents to start building the network.';

  @override
  String get searchCommunityTooltip => 'Search by name or public identifier.';

  @override
  String get approvedSuggestions => 'Approved Suggestions';

  @override
  String get approvedSuggestionsTooltip =>
      'Number of documents suggested by this person that were approved for the knowledge base.';

  @override
  String get aboutPageTitle => 'About';

  @override
  String get aboutPageSubtitle =>
      'A free software tool to research, verify, and strengthen agroecological knowledge.';

  @override
  String get aboutValueTitle => 'Core value';

  @override
  String get aboutValueBody =>
      'The platform combines AI, curated documents, and community participation to make agroecological references easier to find and verify.';

  @override
  String get aboutText1 =>
      'Agroecology Map AI helps people explore agroecological knowledge through a free software assistant grounded in curated documents and community context.';

  @override
  String get aboutText2 =>
      'Answers are generated from the knowledge base and keep sources traceable, so the app works as a guided research tool instead of a generic chatbot.';

  @override
  String get aboutText3 =>
      'The project belongs to the Agroecology Map ecosystem, an open data and citizen science initiative that maps experiences, documents practices, and connects territories.';

  @override
  String get aboutText4 =>
      'It is built for farmers, educators, researchers, extension workers, students, communities, and social movements that need practical agroecological references.';

  @override
  String get retry => 'Retry';

  @override
  String get mySuggestions => 'My Suggestions';

  @override
  String get suggestionsSubtitle =>
      'Track submitted documents, review status, and materials that may enter the public knowledge base.';

  @override
  String get knowledgeBase => 'Knowledge Base';

  @override
  String get kbSubtitle =>
      'Browse the documents that ground AI answers and see which ones are already indexed for search.';

  @override
  String get suggestDocument => 'Suggest Document';

  @override
  String get suggestionCountLabel => 'suggestions';

  @override
  String get newSuggestion => 'New Suggestion';

  @override
  String get newSuggestionSubtitle =>
      'Send relevant materials to expand the coverage of the knowledge base.';

  @override
  String get editSuggestion => 'Edit Suggestion';

  @override
  String get editSuggestionSubtitle =>
      'Pending suggestions can be adjusted before review.';

  @override
  String get suggestionTitleLabel => 'Title';

  @override
  String get suggestionTitleHint => 'Document title';

  @override
  String get suggestionTitleHelper =>
      'Optional, but it helps reviewers identify the material.';

  @override
  String get suggestionAuthorsLabel => 'Authors';

  @override
  String get suggestionAuthorsHint => 'Authors or organization';

  @override
  String get suggestionAuthorsHelper =>
      'Optional authorship, institution, collective, or publisher.';

  @override
  String get suggestionUrlLabel => 'Reference URL';

  @override
  String get suggestionUrlHelper =>
      'Optional source, publication page, DOI page, or institutional link.';

  @override
  String get suggestionReviewTitle => 'How review works';

  @override
  String get suggestionReviewBody =>
      'The team checks relevance, quality, and fit before approving a document for public consultation.';

  @override
  String get selectPdf => 'Select PDF file';

  @override
  String get pdfUploadTooltip =>
      'Upload a readable PDF, preferably with title, authorship, and useful content for consultation.';

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
  String get commentHint => 'Explain why this document matters for agroecology';

  @override
  String get commentHelper =>
      'Say where the material comes from, who it helps, and why it should enter the base.';

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
  String get suggestionStatusTooltip =>
      'Pending waits for review; approved enters the knowledge-base flow; rejected needs changes or does not fit.';

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
  String get suggestionNotFound => 'Suggestion not found.';

  @override
  String get suggestionNotEditable => 'Only pending suggestions can be edited.';

  @override
  String get currentFile => 'Current file';

  @override
  String get replacePdf => 'Replace PDF';

  @override
  String get noFileSelected => 'No file selected';

  @override
  String get attachedPdf => 'Attached PDF';

  @override
  String get reviewComment => 'Review Comment';

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
  String get searchDocumentsTooltip =>
      'Search by title, authorship, or filename.';

  @override
  String indexedCount(int indexed, int total) {
    return '$indexed of $total indexed';
  }

  @override
  String get allIndexed => 'All files indexed';

  @override
  String indexedDocsCount(int count) {
    return '$count indexed documents';
  }

  @override
  String get kbIndexedTooltip =>
      'Indexed documents can already be found by chat. Non-indexed files can still be read manually.';

  @override
  String documentPageSummary(int loaded, int total, int indexed) {
    return '$loaded of $total loaded · $indexed indexed';
  }

  @override
  String get loadMore => 'Load more';

  @override
  String get documentDetail => 'Document Detail';

  @override
  String get documentIndexedTitle => 'Available to AI';

  @override
  String get documentIndexedBody =>
      'This document has been indexed and may be used to ground chat answers.';

  @override
  String get documentNotIndexedTitle => 'Not indexed yet';

  @override
  String get documentNotIndexedBody =>
      'The file is available for reading, but it is not yet used in AI answers.';

  @override
  String get download => 'Download';

  @override
  String get downloadError => 'Failed to download document';

  @override
  String get downloadSuccess => 'Document saved successfully';

  @override
  String get fileType => 'File Type';

  @override
  String get fileSize => 'File Size';

  @override
  String get ingested => 'Indexed';

  @override
  String get notIngested => 'Not indexed';

  @override
  String get documentAccessRestrictedTitle => 'Full PDF restricted';

  @override
  String get documentAccessRestrictedBody =>
      'The license metadata restricts full PDF access, so download and preview are not available.';

  @override
  String get academicMetadataTitle => 'Academic Metadata';

  @override
  String get doiField => 'DOI';

  @override
  String get publicationYear => 'Publication year';

  @override
  String get citations => 'Citations';

  @override
  String get references => 'References';

  @override
  String get venue => 'Venue';

  @override
  String get publisher => 'Publisher';

  @override
  String get matchConfidence => 'Match confidence';

  @override
  String get sourceUrl => 'Source';

  @override
  String get openAccessUrl => 'Open access';

  @override
  String get abstract => 'Abstract';

  @override
  String get topics => 'Topics';

  @override
  String get keywords => 'Keywords';

  @override
  String get license => 'License';

  @override
  String get funder => 'Funder';

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
      'Agroecology Map AI is a free software platform for querying agroecological knowledge with AI.\n\nData We Collect:\n- Full name, email, and hashed password for account access\n- Preferred language/locale\n- Optional profile data: bio, external link, and avatar\n- Document suggestion comments and uploaded files, when you choose to submit them\n- Chat conversations, messages, and retrieved sources so you can continue your research later\n- IP address in transient request logs for security and debugging\n\nLocal Storage:\nThe app may store session data and language preference on your device.\n\nAI Processing:\nAI models and embeddings run locally or on infrastructure controlled by the project. External AI providers are disabled by default and may only be enabled by a deployment with documented privacy terms. Questions, chat history, embeddings, and documents are not sent to external AI APIs unless that deployment explicitly enables and discloses an external provider.\n\nWe DO NOT collect advertising IDs, browsing history, background location, contacts, payment information, or sensitive personal data.\n\nData Sharing:\nWe do not sell, rent, trade, or share your personal data with advertisers, data brokers, external analytics services, or undocumented external AI providers.\n\nYour Rights:\nYou can export your data, edit your profile, delete your account, request portability, and withdraw consent by stopping use or deleting your account.\n\nAccount Deletion:\nUse \'Delete My Account\' in your profile. A confirmation email is sent. Once confirmed, personal data is permanently anonymized, saved chat conversations are deleted, and sessions are terminated.\n\nMobile Privacy:\nThe app does not request camera, microphone, contacts, or location access. Photo library access may be requested only when you choose a profile avatar; only the selected image is uploaded. The app has no third-party analytics SDKs and uses HTTPS.\n\nContact and DPO: contact@agroecologymap.org\nLicense: GPLv3 (Free Software)\nRepository: https://codeberg.org/agroecologymap';

  @override
  String get termsOfServiceTitle => 'Terms of Service';

  @override
  String get termsOfServiceLastUpdated => 'Last updated: June 11, 2026';

  @override
  String get termsOfServiceContent =>
      '1. Acceptance of Terms\nBy creating an account and using Agroecology Map AI, you agree to these Terms of Service.\n\n2. Description of Service\nAgroecology Map AI is a free software AI chat platform for querying agroecological knowledge. AI models and embeddings run locally or on infrastructure controlled by the project. External AI providers are disabled by default and may only be enabled by a deployment with documented privacy terms.\n\n3. User Accounts\nYou are responsible for your account credentials. You must provide accurate registration information. Minimum age: 16 years.\n\n4. Acceptable Use\nDo not use the platform for illegal purposes, submit harmful content, attempt to disrupt service, use automated means without permission, or misrepresent your identity.\n\n5. User Content\nBy submitting content, you grant the platform a non-exclusive license to display it within the platform. You retain ownership.\n\n6. Intellectual Property\nThe software is GPLv3 licensed. Document content retains its original licenses.\n\n7. Disclaimer\nThe platform is provided \'AS IS\'. AI-generated answers may not be accurate. Always verify with primary sources.\n\n8. Limitation of Liability\nThe project and its volunteers are not liable for damages arising from platform use to the extent permitted by law.\n\n9. Account Termination\nAccounts violating these terms may be suspended. Users may delete accounts at any time.\n\n10. Modifications\nTerms may be updated. Material changes communicated via email.\n\n11. Governing Law\nGoverned by the laws of Brazil.\n\n12. Contact\ncontact@agroecologymap.org';

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
  String get dataAndPrivacySubtitle =>
      'Export your data when needed and request account deletion with email confirmation.';

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
  String get statusActive => 'active';

  @override
  String get statusSuspended => 'suspended';

  @override
  String get statusDeleted => 'deleted';

  @override
  String get roleUser => 'user';

  @override
  String get loggedOut => 'You have been logged out.';

  @override
  String get searchCommunity => 'Search community...';

  @override
  String get searchNoResults => 'No matching members';
}
