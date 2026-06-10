// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Agroecology Map AI';

  @override
  String get betaLabel => 'BETA';

  @override
  String get signIn => 'Se Connecter';

  @override
  String get signInWelcome => 'Bienvenue sur Agroecology Map AI';

  @override
  String get signInButton => 'Se Connecter';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'votre@email.com';

  @override
  String get emailRequired => 'L\'email est requis';

  @override
  String get passwordLabel => 'Mot de passe';

  @override
  String get passwordHint => 'Votre mot de passe';

  @override
  String get passwordRequired => 'Le mot de passe est requis';

  @override
  String get passwordMinLength =>
      'Le mot de passe doit contenir au moins 8 caractères';

  @override
  String get newPasswordLabel => 'Nouveau Mot de Passe';

  @override
  String get newPasswordHint => 'Au moins 8 caractères';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get noAccount => 'Pas de compte ? ';

  @override
  String get register => 'S\'inscrire';

  @override
  String get createAccount => 'Créer un Compte';

  @override
  String get createAccountSubtitle =>
      'Rejoignez la communauté Agroecology Map AI';

  @override
  String get fullNameLabel => 'Nom Complet';

  @override
  String get fullNameHint => 'Votre nom';

  @override
  String get fullNameRequired => 'Le nom complet est requis';

  @override
  String get fullNameMaxLength => 'Le nom doit avoir moins de 200 caractères';

  @override
  String get answerLabel => 'Réponse';

  @override
  String get answerHint => 'Votre réponse à la question ci-dessus';

  @override
  String get answerRequired => 'La réponse est requise';

  @override
  String get hasAccount => 'Vous avez déjà un compte ? ';

  @override
  String get resetPassword => 'Réinitialiser le Mot de Passe';

  @override
  String get resetLinkSent =>
      'Si l\'email existe, un lien de réinitialisation a été envoyé.';

  @override
  String get resetLinkInstruction =>
      'Entrez votre email et nous vous enverrons un lien de réinitialisation.';

  @override
  String get sendResetLink => 'Envoyer le Lien';

  @override
  String get backToSignIn => 'Retour à la Connexion';

  @override
  String get newPassword => 'Nouveau Mot de Passe';

  @override
  String get passwordResetSuccess => 'Mot de passe réinitialisé avec succès.';

  @override
  String get goToSignIn => 'Aller à la Connexion';

  @override
  String get resetTokenInstruction =>
      'Entrez le jeton de réinitialisation de votre email et votre nouveau mot de passe.';

  @override
  String get resetTokenLabel => 'Jeton de Réinitialisation';

  @override
  String get resetTokenHint => 'Collez le jeton de votre email';

  @override
  String get tokenRequired => 'Le jeton est requis';

  @override
  String get resetPasswordButton => 'Réinitialiser le Mot de Passe';

  @override
  String get resetFailed => 'Échec de la réinitialisation du mot de passe.';

  @override
  String get restoringSession => 'Restauration de la session...';

  @override
  String get loginFailed => 'Échec de connexion. Veuillez réessayer.';

  @override
  String get registrationSuccess =>
      'Inscription réussie. Vérifiez votre email pour confirmer votre compte.';

  @override
  String get registrationFailed =>
      'Échec de l\'inscription. Veuillez réessayer.';

  @override
  String get connectionError => 'Erreur de connexion. Vérifiez votre réseau.';

  @override
  String get drawerChat => 'Chat';

  @override
  String get drawerCommunity => 'Communauté';

  @override
  String get drawerProfile => 'Profil';

  @override
  String get drawerAbout => 'À Propos';

  @override
  String get drawerDonate => 'Faire un Don';

  @override
  String get drawerLogout => 'Déconnexion';

  @override
  String get localePt => 'Português';

  @override
  String get localeEn => 'English';

  @override
  String get localeEs => 'Español';

  @override
  String get localeFr => 'Français';

  @override
  String get chatTitle => 'Chat Agroécologique';

  @override
  String get chatSubtitle => 'Posez des questions sur l\'agroécologie';

  @override
  String get newChat => 'Nouvelle conversation';

  @override
  String get askPlaceholder => 'Posez une question...';

  @override
  String get thinking => 'Réflexion...';

  @override
  String get sources => 'Sources';

  @override
  String get sourceFallback => 'Source';

  @override
  String get requestTimeout => 'Délai d\'attente dépassé. Veuillez réessayer.';

  @override
  String get chatEmptyTitle => 'Posez une question sur l\'agroécologie';

  @override
  String get chatEmptySubtitle =>
      'L\'IA répond à partir de la base de connaissances,\nen gardant les sources traçables.';

  @override
  String get chatError => 'Une erreur est survenue';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileNotAuth => 'Non authentifié';

  @override
  String get profileNotAuthSub => 'Connectez-vous pour voir votre profil.';

  @override
  String get editProfile => 'Modifier le Profil';

  @override
  String get joined => 'Inscrit le';

  @override
  String get lastLogin => 'Dernière connexion';

  @override
  String get about => 'À Propos';

  @override
  String get linkLabel => 'Lien';

  @override
  String get openLink => 'Ouvrir le lien';

  @override
  String get save => 'Enregistrer';

  @override
  String get nameRequired => 'Le nom est requis';

  @override
  String aboutMaxLength(int count) {
    return 'À propos doit avoir moins de $count caractères';
  }

  @override
  String get linkValidation => 'Le lien doit commencer par http:// ou https://';

  @override
  String get linkHint => 'https://exemple.com';

  @override
  String get aboutHint => 'Parlez de vous à la communauté';

  @override
  String imageTooLarge(int mb) {
    return 'L\'image doit faire moins de $mb Mo';
  }

  @override
  String get uploadAvatarFailed => 'Échec du téléchargement de l\'avatar.';

  @override
  String get saveProfileFailed => 'Échec de l\'enregistrement du profil.';

  @override
  String get communityTitle => 'Communauté';

  @override
  String get communityEmpty => 'Aucun membre dans la communauté';

  @override
  String get communityEmptySub => 'Soyez le premier à rejoindre !';

  @override
  String get approvedSuggestions => 'Suggestions Approuvées';

  @override
  String get aboutPageTitle => 'À Propos';

  @override
  String get aboutText1 =>
      'Agroecology Map AI est un outil logiciel libre qui rend la connaissance agroécologique plus facile à trouver, comprendre et partager.';

  @override
  String get aboutText2 =>
      'L\'IA répond à partir des documents de la base de connaissances, en gardant les sources traçables plutôt que d\'agir comme un chatbot générique.';

  @override
  String get aboutText3 =>
      'Le projet fait partie de l\'écosystème Agroecology Map, une initiative de science citoyenne, données ouvertes et logiciel libre qui cartographie les expériences agroécologiques et connecte les communautés.';

  @override
  String get aboutText4 =>
      'La proposition est de soutenir les agriculteurs, chercheurs, vulgarisateurs, éducateurs, étudiants, communautés et mouvements sociaux.';

  @override
  String get donateTitle => 'Faire un Don';

  @override
  String get donateText1 =>
      'Agroecology Map AI est maintenu par du travail bénévole et des logiciels libres.';

  @override
  String get donateText2 =>
      'Les dons aident à maintenir et étendre l\'infrastructure, le traitement, le stockage, l\'indexation des documents et les expériences avec des modèles locaux.';

  @override
  String get donateText3 =>
      'Le soutien renforce une plateforme ouverte, sans paywall, dédiée aux communautés, chercheurs et agriculteurs.';

  @override
  String get donateButton => 'Faire un don via Ko-fi';

  @override
  String get donateError => 'Impossible d\'ouvrir la page de don.';

  @override
  String get retry => 'Réessayer';
}
