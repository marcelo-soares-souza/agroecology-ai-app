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
  String get signIn => 'Se Connecter';

  @override
  String get signInWelcome =>
      'Connectez-vous pour poser des questions sourcées, reprendre votre historique et contribuer à la base agroécologique.';

  @override
  String get signInButton => 'Se Connecter';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'votre@email.com';

  @override
  String get emailHelper =>
      'Utilisez l\'email de votre compte pour recevoir les confirmations et avis importants.';

  @override
  String get emailRequired => 'L\'email est requis';

  @override
  String get emailInvalid => 'Saisissez un email valide';

  @override
  String get passwordLabel => 'Mot de passe';

  @override
  String get passwordHint => 'Votre mot de passe';

  @override
  String get passwordHelper =>
      'Votre mot de passe protège l\'accès à votre historique et à votre profil.';

  @override
  String get passwordVisibilityTooltip =>
      'Afficher ou masquer le mot de passe saisi.';

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
  String get newPasswordHelper =>
      'Utilisez un mot de passe unique d\'au moins 8 caractères.';

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
      'Créez un compte pour suggérer des documents, garder un profil public et renforcer une base de connaissances ouverte.';

  @override
  String get fullNameLabel => 'Nom Complet';

  @override
  String get fullNameHint => 'Votre nom';

  @override
  String get fullNameHelper =>
      'Ce nom apparaît sur votre profil et aide la communauté à reconnaître vos contributions.';

  @override
  String get fullNameRequired => 'Le nom complet est requis';

  @override
  String get fullNameMaxLength => 'Le nom doit avoir moins de 200 caractères';

  @override
  String get answerLabel => 'Réponse';

  @override
  String get answerHint => 'Votre réponse à la question ci-dessus';

  @override
  String get answerHelper =>
      'Cette étape simple aide à protéger la communauté contre les inscriptions automatisées.';

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
      'Entrez l\'email de votre compte pour recevoir un lien sécurisé de réinitialisation.';

  @override
  String get resetEmailHelper =>
      'Nous envoyons le lien uniquement si l\'email est enregistré.';

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
  String get confirmingEmail => 'Confirmation de votre email...';

  @override
  String get emailConfirmationTitle => 'Confirmation d\'Email';

  @override
  String get emailConfirmedTitle => 'Email Confirmé';

  @override
  String get emailConfirmationFailed => 'Impossible de confirmer l\'email.';

  @override
  String get missingToken => 'Le jeton de confirmation est manquant.';

  @override
  String get resendConfirmationTitle => 'Renvoyer la Confirmation';

  @override
  String get resendConfirmationInstruction =>
      'Entrez l\'email de votre compte pour recevoir un nouveau lien de confirmation.';

  @override
  String get resendConfirmationButton => 'Renvoyer la Confirmation';

  @override
  String get resendConfirmationSentTitle => 'Confirmation Envoyée';

  @override
  String get resendConfirmationSentBody =>
      'Si l\'email existe et nécessite encore une confirmation, un nouveau lien a été envoyé.';

  @override
  String get resendConfirmationFailed =>
      'Impossible de renvoyer la confirmation.';

  @override
  String get deleteAccountConfirming =>
      'Confirmation de la suppression du compte...';

  @override
  String get accountDeletedTitle => 'Compte Supprimé';

  @override
  String get resetTokenInstruction =>
      'Entrez le jeton de réinitialisation de votre email et votre nouveau mot de passe.';

  @override
  String get resetTokenLabel => 'Jeton de Réinitialisation';

  @override
  String get resetTokenHint => 'Collez le jeton de votre email';

  @override
  String get resetTokenHelper =>
      'Utilisez exactement le jeton reçu par email avant de définir le nouveau mot de passe.';

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
  String get authRateLimited =>
      'Trop de tentatives ont échoué. Attendez avant de réessayer.';

  @override
  String get authRateLimitTitle => 'Accès temporairement bloqué';

  @override
  String get authRateLimitDescription =>
      'Trop de tentatives ont échoué. Attendez le délai indiqué avant de réessayer.';

  @override
  String authRateLimitRetryIn(String time) {
    return 'Réessayez dans $time.';
  }

  @override
  String get authRateLimitRetryAvailable => 'Vous pouvez réessayer maintenant.';

  @override
  String get authRateLimitTryAgain => 'Réessayer';

  @override
  String get connectionError => 'Erreur de connexion. Vérifiez votre réseau.';

  @override
  String get drawerHome => 'Accueil';

  @override
  String get drawerChat => 'Chat';

  @override
  String get drawerCommunity => 'Communauté';

  @override
  String get drawerProfile => 'Profil';

  @override
  String get drawerAbout => 'À Propos';

  @override
  String get drawerLogout => 'Déconnexion';

  @override
  String get homeIntro =>
      'Posez des questions avec des sources traçables, explorez des documents sélectionnés et aidez la communauté à élargir une base agroécologique ouverte.';

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
  String get chatSubtitle =>
      'Posez vos questions en langage naturel et recevez des réponses fondées sur des documents sélectionnés, avec des sources vérifiables.';

  @override
  String get newChat => 'Nouvelle conversation';

  @override
  String get newChatTooltip => 'Crée une nouvelle conversation enregistrée.';

  @override
  String get chatConversations => 'Conversations';

  @override
  String get noChatConversations =>
      'Aucune conversation enregistrée pour le moment.';

  @override
  String get deleteChatConversation => 'Supprimer la conversation';

  @override
  String get deleteChatConversationConfirm =>
      'Supprimer cette conversation et tous ses messages ?';

  @override
  String get chatConversationLimitReached =>
      'Vous avez atteint la limite de 10 conversations enregistrées. Supprimez une conversation pour en démarrer une autre.';

  @override
  String get askPlaceholder => 'Posez une question...';

  @override
  String get sendQuestionTooltip =>
      'Envoyer la question à la base de connaissances.';

  @override
  String get chatGuidanceTitle => 'Pour de meilleures réponses';

  @override
  String get chatGuidanceBody =>
      'Ajoutez le contexte, le territoire, la culture, le problème observé ou l\'objectif. L\'IA recherche les passages pertinents et affiche les sources disponibles.';

  @override
  String get chatSourcesTooltip =>
      'Les réponses privilégient les documents indexés de la base. Vérifiez toujours les sources avant de prendre des décisions techniques.';

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
      'Essayez une question sur la gestion, le sol, les semences, l\'agroforesterie, les politiques publiques ou les pratiques communautaires.';

  @override
  String get chatError => 'Une erreur est survenue';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileSubtitle =>
      'Présentez-vous, reliez vos contributions et gardez le contrôle de vos données.';

  @override
  String get profileNotAuth => 'Non authentifié';

  @override
  String get profileNotAuthSub => 'Connectez-vous pour voir votre profil.';

  @override
  String get editProfile => 'Modifier le Profil';

  @override
  String get editProfileSubtitle =>
      'Mettez à jour les informations qui aident les autres à comprendre votre lien avec l\'agroécologie.';

  @override
  String get profileVisibilityTooltip =>
      'Les profils actifs peuvent apparaître dans la communauté. Ne publiez que les informations que vous souhaitez rendre visibles.';

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
  String get aboutHint =>
      'Présentez votre travail, territoire, recherche, organisation ou pratique agroécologique';

  @override
  String get aboutHelper =>
      'Un résumé clair aide les autres à comprendre votre contexte et vos contributions.';

  @override
  String get linkHelper =>
      'Ajoutez un site, profil institutionnel, projet ou référence publique liée à votre travail.';

  @override
  String get avatarTooltip =>
      'Sélectionner une image de profil. Seule l\'image choisie sera envoyée.';

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
  String get communitySubtitle =>
      'Trouvez des personnes et organisations qui contribuent avec documents, pratiques et connaissances agroécologiques.';

  @override
  String get communityEmpty => 'Aucun membre dans la communauté';

  @override
  String get communityEmptySub =>
      'Créez un profil et suggérez des documents pour commencer à construire le réseau.';

  @override
  String get searchCommunityTooltip =>
      'Recherchez par nom ou identifiant public.';

  @override
  String get approvedSuggestions => 'Suggestions Approuvées';

  @override
  String get approvedSuggestionsTooltip =>
      'Nombre de documents suggérés par cette personne et approuvés pour la base.';

  @override
  String get aboutPageTitle => 'À Propos';

  @override
  String get aboutPageSubtitle =>
      'Un outil en logiciel libre pour rechercher, vérifier et renforcer les connaissances agroécologiques.';

  @override
  String get aboutValueTitle => 'Valeur principale';

  @override
  String get aboutValueBody =>
      'La plateforme combine IA, documents sélectionnés et participation communautaire pour rendre les références agroécologiques plus faciles à trouver et à vérifier.';

  @override
  String get aboutText1 =>
      'Agroecology Map AI aide à explorer les connaissances agroécologiques grâce à un assistant en logiciel libre fondé sur des documents sélectionnés et le contexte des communautés.';

  @override
  String get aboutText2 =>
      'Les réponses sont générées à partir de la base de connaissances et gardent les sources traçables, afin que l\'app fonctionne comme un outil de recherche guidée plutôt qu\'un chatbot générique.';

  @override
  String get aboutText3 =>
      'Le projet fait partie de l\'écosystème Agroecology Map, une initiative de données ouvertes et de science citoyenne qui cartographie les expériences, documente les pratiques et relie les territoires.';

  @override
  String get aboutText4 =>
      'Il est conçu pour les agriculteurs, éducateurs, chercheurs, vulgarisateurs, étudiants, communautés et mouvements sociaux qui ont besoin de références agroécologiques pratiques.';

  @override
  String get retry => 'Réessayer';

  @override
  String get mySuggestions => 'Mes Suggestions';

  @override
  String get suggestionsSubtitle =>
      'Suivez les documents envoyés, leur statut de révision et les contenus qui peuvent entrer dans la base publique.';

  @override
  String get knowledgeBase => 'Base de Connaissances';

  @override
  String get kbSubtitle =>
      'Consultez les documents qui fondent les réponses de l\'IA et voyez lesquels sont déjà indexés pour la recherche.';

  @override
  String get suggestDocument => 'Suggérer un Document';

  @override
  String get suggestionCountLabel => 'suggestions';

  @override
  String get newSuggestion => 'Nouvelle Suggestion';

  @override
  String get newSuggestionSubtitle =>
      'Envoyez des contenus pertinents pour élargir la couverture de la base de connaissances.';

  @override
  String get editSuggestion => 'Modifier la Suggestion';

  @override
  String get editSuggestionSubtitle =>
      'Les suggestions en attente peuvent être ajustées avant révision.';

  @override
  String get suggestionTitleLabel => 'Titre';

  @override
  String get suggestionTitleHint => 'Titre du document';

  @override
  String get suggestionTitleHelper =>
      'Facultatif, mais utile pour identifier le document.';

  @override
  String get suggestionAuthorsLabel => 'Auteurs';

  @override
  String get suggestionAuthorsHint => 'Auteurs ou organisation';

  @override
  String get suggestionAuthorsHelper =>
      'Auteur, institution, collectif ou éditeur, le cas échéant.';

  @override
  String get suggestionUrlLabel => 'URL de référence';

  @override
  String get suggestionUrlHelper =>
      'Source facultative, page de publication, DOI ou lien institutionnel.';

  @override
  String get suggestionReviewTitle => 'Fonctionnement de la révision';

  @override
  String get suggestionReviewBody =>
      'L\'équipe évalue la pertinence, la qualité et l\'adéquation avant d\'approuver un document pour la consultation publique.';

  @override
  String get selectPdf => 'Sélectionner un fichier PDF';

  @override
  String get pdfUploadTooltip =>
      'Envoyez un PDF lisible, de préférence avec titre, auteurs et contenu utile pour la consultation.';

  @override
  String get pdfOnly => 'Seuls les fichiers PDF sont acceptés';

  @override
  String get fileRequired => 'Un fichier PDF est requis';

  @override
  String fileTooLarge(int size) {
    return 'Le fichier doit faire moins de $size Mo';
  }

  @override
  String get commentLabel => 'Commentaire';

  @override
  String get commentHint =>
      'Expliquez la pertinence du document pour l\'agroécologie';

  @override
  String get commentHelper =>
      'Indiquez l\'origine du document, à qui il est utile et pourquoi il devrait entrer dans la base.';

  @override
  String get commentRequired => 'Un commentaire est requis';

  @override
  String get submitSuggestion => 'Envoyer la Suggestion';

  @override
  String get suggestionCreated => 'Suggestion envoyée avec succès.';

  @override
  String get deleteSuggestion => 'Supprimer la Suggestion';

  @override
  String get deleteSuggestionConfirm =>
      'Êtes-vous sûr de vouloir supprimer cette suggestion ?';

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get noSuggestions => 'Aucune suggestion pour le moment';

  @override
  String get noSuggestionsSub =>
      'Suggérez un document pour enrichir la base de connaissances.';

  @override
  String get suggestionStatusTooltip =>
      'En attente signifie révision; approuvée entre dans le flux de la base; rejetée demande des ajustements ou ne convient pas.';

  @override
  String get allStatus => 'Toutes';

  @override
  String get statusPending => 'en attente';

  @override
  String get statusApproved => 'Approuvée';

  @override
  String get statusRejected => 'Rejetée';

  @override
  String get untitled => 'Sans titre';

  @override
  String get filename => 'Nom du fichier';

  @override
  String get suggestionDetail => 'Détail de la Suggestion';

  @override
  String get suggestionNotFound => 'Suggestion introuvable.';

  @override
  String get suggestionNotEditable =>
      'Seules les suggestions en attente peuvent être modifiées.';

  @override
  String get currentFile => 'Fichier actuel';

  @override
  String get replacePdf => 'Remplacer le PDF';

  @override
  String get noFileSelected => 'Aucun fichier sélectionné';

  @override
  String get attachedPdf => 'PDF joint';

  @override
  String get reviewComment => 'Commentaire de révision';

  @override
  String get resultingDocument => 'Document Résultant';

  @override
  String get viewDocument => 'Voir le Document';

  @override
  String get kbTitle => 'Base de Connaissances';

  @override
  String get kbEmpty => 'Aucun document dans la base de connaissances.';

  @override
  String get searchDocuments => 'Rechercher des documents...';

  @override
  String get searchDocumentsTooltip =>
      'Recherchez par titre, auteur ou nom de fichier.';

  @override
  String indexedCount(int indexed, int total) {
    return '$indexed sur $total indexés';
  }

  @override
  String get allIndexed => 'Tous les fichiers indexés';

  @override
  String indexedDocsCount(int count) {
    return '$count documents indexés';
  }

  @override
  String get kbIndexedTooltip =>
      'Les documents indexés peuvent déjà être trouvés par le chat. Les fichiers non indexés restent lisibles manuellement.';

  @override
  String documentPageSummary(int loaded, int total, int indexed) {
    return '$loaded sur $total chargés · $indexed indexés';
  }

  @override
  String get loadMore => 'Charger plus';

  @override
  String get documentDetail => 'Détail du Document';

  @override
  String get documentIndexedTitle => 'Disponible pour l\'IA';

  @override
  String get documentIndexedBody =>
      'Ce document a été indexé et peut servir à fonder les réponses du chat.';

  @override
  String get documentNotIndexedTitle => 'Pas encore indexé';

  @override
  String get documentNotIndexedBody =>
      'Le fichier est disponible en lecture, mais il ne participe pas encore aux réponses de l\'IA.';

  @override
  String get download => 'Télécharger';

  @override
  String get downloadError => 'Échec du téléchargement du document';

  @override
  String get downloadSuccess => 'Document enregistré avec succès';

  @override
  String get fileType => 'Type de Fichier';

  @override
  String get fileSize => 'Taille';

  @override
  String get ingested => 'Indexé';

  @override
  String get notIngested => 'Non indexé';

  @override
  String get documentAccessRestrictedTitle => 'PDF complet restreint';

  @override
  String get documentAccessRestrictedBody =>
      'Les métadonnées de licence restreignent l\'accès au PDF complet, donc le téléchargement et l\'aperçu ne sont pas disponibles.';

  @override
  String get academicMetadataTitle => 'Métadonnées Académiques';

  @override
  String get doiField => 'DOI';

  @override
  String get publicationYear => 'Année de publication';

  @override
  String get citations => 'Citations';

  @override
  String get references => 'Références';

  @override
  String get venue => 'Revue ou événement';

  @override
  String get publisher => 'Éditeur';

  @override
  String get matchConfidence => 'Confiance de correspondance';

  @override
  String get sourceUrl => 'Source';

  @override
  String get openAccessUrl => 'Accès ouvert';

  @override
  String get abstract => 'Résumé';

  @override
  String get topics => 'Sujets';

  @override
  String get keywords => 'Mots-clés';

  @override
  String get license => 'Licence';

  @override
  String get funder => 'Financeur';

  @override
  String get drawerPrivacy => 'Politique de confidentialité';

  @override
  String get drawerTerms => 'Conditions d\'utilisation';

  @override
  String get privacyPolicyTitle => 'Politique de confidentialité';

  @override
  String get privacyPolicyLastUpdated => 'Dernière mise à jour : 11 juin 2026';

  @override
  String get privacyPolicyContent =>
      'Agroecology Map AI est une plateforme de logiciel libre pour consulter des connaissances agroécologiques avec l\'IA.\n\nDonnées collectées :\n- Nom complet, email et mot de passe hashé pour l\'accès au compte\n- Langue ou locale préférée\n- Données de profil facultatives : bio, lien externe et avatar\n- Commentaires et fichiers de suggestions de documents, lorsque vous les envoyez\n- Conversations du chat, messages et sources retrouvées pour reprendre vos recherches plus tard\n- Adresse IP dans des logs transitoires pour la sécurité et le débogage\n\nStockage local :\nL\'app peut stocker les données de session et la langue sur votre appareil.\n\nTraitement IA :\nLes modèles d\'IA et les embeddings fonctionnent localement ou sur une infrastructure contrôlée par le projet. Les fournisseurs externes d\'IA sont désactivés par défaut et ne peuvent être activés que par un déploiement avec des conditions de confidentialité documentées. Les questions, l\'historique du chat, les embeddings et les documents ne sont pas envoyés à des API externes d\'IA sauf si ce déploiement active et divulgue explicitement un fournisseur externe.\n\nNous ne collectons pas d\'identifiants publicitaires, d\'historique de navigation, de localisation en arrière-plan, de contacts, d\'informations de paiement ni de données personnelles sensibles.\n\nPartage :\nNous ne vendons, louons, échangeons ni partageons vos données personnelles avec des annonceurs, courtiers de données, services d\'analytics externes ou fournisseurs externes d\'IA non documentés.\n\nVos droits :\nVous pouvez exporter vos données, modifier votre profil, supprimer votre compte, demander la portabilité et retirer votre consentement en arrêtant l\'utilisation ou en supprimant le compte.\n\nSuppression du compte :\nUtilisez \'Supprimer Mon Compte\' dans le profil. Un email de confirmation est envoyé. Après confirmation, les données personnelles sont anonymisées définitivement, les conversations de chat enregistrées sont supprimées et les sessions sont terminées.\n\nConfidentialité mobile :\nL\'app ne demande pas la caméra, le microphone, les contacts ou la localisation. L\'accès à la galerie peut être demandé seulement si vous choisissez un avatar ; seule l\'image sélectionnée est envoyée. L\'app n\'utilise pas de SDK d\'analytics tiers et utilise HTTPS.\n\nContact et DPO : contact@agroecologymap.org\nLicence : GPLv3 (logiciel libre)';

  @override
  String get termsOfServiceTitle => 'Conditions d\'utilisation';

  @override
  String get termsOfServiceLastUpdated => 'Dernière mise à jour : 11 juin 2026';

  @override
  String get termsOfServiceContent =>
      '1. Acceptation des conditions\nEn créant un compte et en utilisant Agroecology Map AI, vous acceptez ces Conditions d\'utilisation.\n\n2. Description du service\nAgroecology Map AI est une plateforme de chat IA pour consulter des connaissances agroécologiques. Les modèles d\'IA et les embeddings fonctionnent localement ou sur une infrastructure contrôlée par le projet. Les fournisseurs externes d\'IA sont désactivés par défaut et ne peuvent être activés que par un déploiement avec des conditions de confidentialité documentées.\n\n3. Comptes utilisateur\nVous êtes responsable de vos identifiants. Fournissez des informations exactes. Âge minimum : 16 ans.\n\n4. Utilisation acceptable\nN\'utilisez pas la plateforme à des fins illégales, ne soumettez pas de contenu nuisible, ne tentez pas d\'interrompre le service et ne déformez pas votre identité.\n\n5. Contenu utilisateur\nEn envoyant du contenu, vous accordez une licence non exclusive pour l\'affichage dans la plateforme. Vous conservez la propriété.\n\n6. Propriété intellectuelle\nLe logiciel est sous licence GPLv3. Les documents conservent leurs licences d\'origine.\n\n7. Aucune garantie\nLa plateforme est fournie telle quelle. Les réponses de l\'IA peuvent être inexactes. Vérifiez toujours les sources primaires.\n\n8. Limitation de responsabilité\nDans les limites permises par la loi, le projet et ses bénévoles ne sont pas responsables des dommages liés à l\'utilisation.\n\n9. Résiliation du compte\nLes comptes qui violent ces conditions peuvent être suspendus. Les utilisateurs peuvent supprimer leur compte à tout moment.\n\n10. Modifications\nLes conditions peuvent être mises à jour. Les changements importants seront communiqués par email.\n\n11. Loi applicable\nRégie par les lois du Brésil.\n\n12. Contact\ncontact@agroecologymap.org';

  @override
  String get acceptPrivacyPrefix => 'J\'accepte la ';

  @override
  String get acceptPrivacyLink => 'Politique de confidentialité';

  @override
  String get acceptTosPrefix => 'J\'accepte les ';

  @override
  String get acceptTosLink => 'Conditions d\'utilisation';

  @override
  String get dataAndPrivacy => 'Données et confidentialité';

  @override
  String get dataAndPrivacySubtitle =>
      'Exportez vos données si nécessaire et demandez la suppression avec confirmation par email.';

  @override
  String get exportMyData => 'Exporter Mes Données';

  @override
  String get exportSuccess => 'Données exportées avec succès';

  @override
  String get exportFailed => 'Échec de l\'exportation';

  @override
  String get deleteMyAccount => 'Supprimer Mon Compte';

  @override
  String get deleteAccountConfirmTitle => 'Supprimer le compte';

  @override
  String get deleteAccountConfirmBody =>
      'Êtes-vous sûr ? Un email de confirmation sera envoyé.';

  @override
  String get deleteAccountConfirmButton => 'Supprimer';

  @override
  String get deleteAccountFailed => 'Échec de la demande de suppression';

  @override
  String get statusActive => 'actif';

  @override
  String get statusSuspended => 'suspendu';

  @override
  String get statusDeleted => 'supprimé';

  @override
  String get roleUser => 'utilisateur';

  @override
  String get loggedOut => 'Vous avez été déconnecté.';

  @override
  String get searchCommunity => 'Rechercher la communauté...';

  @override
  String get searchNoResults => 'Aucun membre correspondant';
}
