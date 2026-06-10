// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Agroecology Map AI';

  @override
  String get betaLabel => 'BETA';

  @override
  String get signIn => 'Iniciar Sesión';

  @override
  String get signInWelcome => 'Bienvenido de vuelta a Agroecology Map AI';

  @override
  String get signInButton => 'Iniciar Sesión';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'tu@email.com';

  @override
  String get emailRequired => 'El email es obligatorio';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get passwordHint => 'Tu contraseña';

  @override
  String get passwordRequired => 'La contraseña es obligatoria';

  @override
  String get passwordMinLength =>
      'La contraseña debe tener al menos 8 caracteres';

  @override
  String get newPasswordLabel => 'Nueva Contraseña';

  @override
  String get newPasswordHint => 'Al menos 8 caracteres';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get noAccount => '¿No tienes cuenta? ';

  @override
  String get register => 'Registrarse';

  @override
  String get createAccount => 'Crear Cuenta';

  @override
  String get createAccountSubtitle => 'Únete a la comunidad Agroecology Map AI';

  @override
  String get fullNameLabel => 'Nombre Completo';

  @override
  String get fullNameHint => 'Tu nombre';

  @override
  String get fullNameRequired => 'El nombre completo es obligatorio';

  @override
  String get fullNameMaxLength =>
      'El nombre debe tener menos de 200 caracteres';

  @override
  String get answerLabel => 'Respuesta';

  @override
  String get answerHint => 'Tu respuesta a la pregunta anterior';

  @override
  String get answerRequired => 'La respuesta es obligatoria';

  @override
  String get hasAccount => '¿Ya tienes cuenta? ';

  @override
  String get resetPassword => 'Restablecer Contraseña';

  @override
  String get resetLinkSent =>
      'Si el email existe, se ha enviado un enlace de restablecimiento.';

  @override
  String get resetLinkInstruction =>
      'Ingresa tu email y te enviaremos un enlace de restablecimiento.';

  @override
  String get sendResetLink => 'Enviar Enlace';

  @override
  String get backToSignIn => 'Volver a Iniciar Sesión';

  @override
  String get newPassword => 'Nueva Contraseña';

  @override
  String get passwordResetSuccess => 'Contraseña restablecida con éxito.';

  @override
  String get goToSignIn => 'Ir a Iniciar Sesión';

  @override
  String get resetTokenInstruction =>
      'Ingresa el token de restablecimiento de tu email y tu nueva contraseña.';

  @override
  String get resetTokenLabel => 'Token de Restablecimiento';

  @override
  String get resetTokenHint => 'Pega el token de tu email';

  @override
  String get tokenRequired => 'El token es obligatorio';

  @override
  String get resetPasswordButton => 'Restablecer Contraseña';

  @override
  String get resetFailed => 'Error al restablecer la contraseña.';

  @override
  String get restoringSession => 'Restaurando sesión...';

  @override
  String get loginFailed => 'Error de inicio de sesión. Intenta de nuevo.';

  @override
  String get registrationSuccess =>
      'Registro exitoso. Revisa tu email para confirmar tu cuenta.';

  @override
  String get registrationFailed => 'Error de registro. Intenta de nuevo.';

  @override
  String get connectionError => 'Error de conexión. Verifica tu red.';

  @override
  String get drawerChat => 'Chat';

  @override
  String get drawerCommunity => 'Comunidad';

  @override
  String get drawerProfile => 'Perfil';

  @override
  String get drawerAbout => 'Acerca de';

  @override
  String get drawerDonate => 'Donar';

  @override
  String get drawerLogout => 'Cerrar Sesión';

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
  String get chatSubtitle => 'Haz preguntas sobre agroecología';

  @override
  String get newChat => 'Nueva conversación';

  @override
  String get askPlaceholder => 'Haz una pregunta...';

  @override
  String get thinking => 'Pensando...';

  @override
  String get sources => 'Fuentes';

  @override
  String get sourceFallback => 'Fuente';

  @override
  String get requestTimeout => 'Tiempo de espera agotado. Intenta de nuevo.';

  @override
  String get chatEmptyTitle => 'Haz una pregunta sobre agroecología';

  @override
  String get chatEmptySubtitle =>
      'La IA responde desde la base de conocimiento,\nmanteniendo las fuentes rastreables.';

  @override
  String get chatError => 'Ocurrió un error';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileNotAuth => 'No autenticado';

  @override
  String get profileNotAuthSub => 'Inicia sesión para ver tu perfil.';

  @override
  String get editProfile => 'Editar Perfil';

  @override
  String get joined => 'Se unió en';

  @override
  String get lastLogin => 'Último inicio de sesión';

  @override
  String get about => 'Acerca de';

  @override
  String get linkLabel => 'Enlace';

  @override
  String get openLink => 'Abrir enlace';

  @override
  String get save => 'Guardar';

  @override
  String get nameRequired => 'El nombre es obligatorio';

  @override
  String aboutMaxLength(int count) {
    return 'Acerca de debe tener menos de $count caracteres';
  }

  @override
  String get linkValidation => 'El enlace debe comenzar con http:// o https://';

  @override
  String get linkHint => 'https://ejemplo.com';

  @override
  String get aboutHint => 'Cuéntale a la comunidad sobre ti';

  @override
  String imageTooLarge(int mb) {
    return 'La imagen debe tener menos de $mb MB';
  }

  @override
  String get uploadAvatarFailed => 'Error al subir el avatar.';

  @override
  String get saveProfileFailed => 'Error al guardar el perfil.';

  @override
  String get communityTitle => 'Comunidad';

  @override
  String get communityEmpty => 'Aún no hay miembros en la comunidad';

  @override
  String get communityEmptySub => '¡Sé el primero en unirte!';

  @override
  String get approvedSuggestions => 'Sugerencias Aprobadas';

  @override
  String get aboutPageTitle => 'Acerca de';

  @override
  String get aboutText1 =>
      'Agroecology Map AI es una herramienta de software libre que hace que el conocimiento agroecológico sea más fácil de encontrar, comprender y compartir.';

  @override
  String get aboutText2 =>
      'La IA responde a partir de documentos de la base de conocimiento, manteniendo fuentes rastreables en lugar de actuar como un chatbot genérico.';

  @override
  String get aboutText3 =>
      'El proyecto es parte del ecosistema Agroecology Map, una iniciativa de ciencia ciudadana, datos abiertos y software libre que mapea experiencias agroecológicas y conecta comunidades.';

  @override
  String get aboutText4 =>
      'La propuesta es apoyar a agricultores, investigadores, extensionistas, educadores, estudiantes, comunidades y movimientos sociales.';

  @override
  String get donateTitle => 'Donar';

  @override
  String get donateText1 =>
      'Agroecology Map AI se mantiene con trabajo voluntario y software libre.';

  @override
  String get donateText2 =>
      'Las donaciones ayudan a mantener y expandir la infraestructura, procesamiento, almacenamiento, indexación de documentos y experimentos con modelos locales.';

  @override
  String get donateText3 =>
      'El apoyo fortalece una plataforma abierta, sin paywall, dedicada a comunidades, investigadores y agricultores.';

  @override
  String get donateButton => 'Donar vía Ko-fi';

  @override
  String get donateError => 'No se pudo abrir la página de donación.';

  @override
  String get retry => 'Reintentar';

  @override
  String get mySuggestions => 'Mis Sugerencias';

  @override
  String get knowledgeBase => 'Base de Conocimiento';

  @override
  String get suggestDocument => 'Sugerir Documento';

  @override
  String get newSuggestion => 'Nueva Sugerencia';

  @override
  String get selectPdf => 'Seleccionar archivo PDF';

  @override
  String get pdfOnly => 'Solo se aceptan archivos PDF';

  @override
  String get fileRequired => 'Se requiere un archivo PDF';

  @override
  String fileTooLarge(int size) {
    return 'El archivo debe tener menos de $size MB';
  }

  @override
  String get commentLabel => 'Comentario';

  @override
  String get commentHint => '¿Por qué sugieres este documento?';

  @override
  String get commentRequired => 'Se requiere un comentario';

  @override
  String get submitSuggestion => 'Enviar Sugerencia';

  @override
  String get suggestionCreated => 'Sugerencia enviada con éxito.';

  @override
  String get deleteSuggestion => 'Eliminar Sugerencia';

  @override
  String get deleteSuggestionConfirm =>
      '¿Estás seguro de que deseas eliminar esta sugerencia?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get noSuggestions => 'No hay sugerencias aún';

  @override
  String get noSuggestionsSub =>
      'Sugiere un documento para ayudar a crecer la base de conocimiento.';

  @override
  String get allStatus => 'Todas';

  @override
  String get statusPending => 'Pendiente';

  @override
  String get statusApproved => 'Aprobada';

  @override
  String get statusRejected => 'Rechazada';

  @override
  String get untitled => 'Sin título';

  @override
  String get filename => 'Nombre del archivo';

  @override
  String get suggestionDetail => 'Detalle de la Sugerencia';

  @override
  String get adminComment => 'Comentario del Admin';

  @override
  String get resultingDocument => 'Documento Resultante';

  @override
  String get viewDocument => 'Ver Documento';

  @override
  String get kbTitle => 'Base de Conocimiento';

  @override
  String get kbEmpty => 'No hay documentos en la base de conocimiento aún.';

  @override
  String get searchDocuments => 'Buscar documentos...';

  @override
  String indexedCount(int indexed, int total) {
    return '$indexed de $total indexados';
  }

  @override
  String get allIndexed => 'Todos los archivos indexados';

  @override
  String get documentDetail => 'Detalle del Documento';

  @override
  String get download => 'Descargar';

  @override
  String get fileType => 'Tipo de Archivo';

  @override
  String get fileSize => 'Tamaño';

  @override
  String get ingested => 'Indexado';

  @override
  String get notIngested => 'No indexado';
}
