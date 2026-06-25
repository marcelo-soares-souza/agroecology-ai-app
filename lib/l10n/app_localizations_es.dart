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
  String get signIn => 'Iniciar Sesión';

  @override
  String get signInWelcome =>
      'Inicia sesión para consultar respuestas con fuentes, continuar tu historial y contribuir a la base agroecológica.';

  @override
  String get signInButton => 'Iniciar Sesión';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'tu@email.com';

  @override
  String get emailHelper =>
      'Usa el email de tu cuenta para recibir confirmaciones y avisos importantes.';

  @override
  String get emailRequired => 'El email es obligatorio';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get passwordHint => 'Tu contraseña';

  @override
  String get passwordHelper =>
      'Tu contraseña protege el acceso a tu historial y perfil.';

  @override
  String get passwordVisibilityTooltip =>
      'Mostrar u ocultar la contraseña escrita.';

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
  String get newPasswordHelper =>
      'Usa una contraseña única con al menos 8 caracteres.';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get noAccount => '¿No tienes cuenta? ';

  @override
  String get register => 'Registrarse';

  @override
  String get createAccount => 'Crear Cuenta';

  @override
  String get createAccountSubtitle =>
      'Crea una cuenta para sugerir documentos, mantener un perfil público y fortalecer una base abierta de conocimiento.';

  @override
  String get fullNameLabel => 'Nombre Completo';

  @override
  String get fullNameHint => 'Tu nombre';

  @override
  String get fullNameHelper =>
      'Este nombre aparece en tu perfil y ayuda a la comunidad a reconocer tus contribuciones.';

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
  String get answerHelper =>
      'Este paso simple ayuda a proteger la comunidad contra registros automatizados.';

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
      'Ingresa el email de tu cuenta para recibir un enlace seguro de restablecimiento.';

  @override
  String get resetEmailHelper =>
      'Enviaremos el enlace solo si el email está registrado.';

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
  String get confirmingEmail => 'Confirmando tu email...';

  @override
  String get emailConfirmationTitle => 'Confirmación de Email';

  @override
  String get emailConfirmedTitle => 'Email Confirmado';

  @override
  String get emailConfirmationFailed => 'No se pudo confirmar el email.';

  @override
  String get missingToken => 'Falta el token de confirmación.';

  @override
  String get resendConfirmationTitle => 'Reenviar Confirmación';

  @override
  String get resendConfirmationInstruction =>
      'Ingresa el email de tu cuenta para recibir un nuevo enlace de confirmación.';

  @override
  String get resendConfirmationButton => 'Reenviar Confirmación';

  @override
  String get resendConfirmationSentTitle => 'Confirmación Enviada';

  @override
  String get resendConfirmationSentBody =>
      'Si el email existe y aún necesita confirmación, se envió un nuevo enlace.';

  @override
  String get resendConfirmationFailed => 'No se pudo reenviar la confirmación.';

  @override
  String get deleteAccountConfirming =>
      'Confirmando eliminación de la cuenta...';

  @override
  String get accountDeletedTitle => 'Cuenta Eliminada';

  @override
  String get resetTokenInstruction =>
      'Ingresa el token de restablecimiento de tu email y tu nueva contraseña.';

  @override
  String get resetTokenLabel => 'Token de Restablecimiento';

  @override
  String get resetTokenHint => 'Pega el token de tu email';

  @override
  String get resetTokenHelper =>
      'Usa exactamente el token recibido por email antes de definir la nueva contraseña.';

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
  String get authRateLimited =>
      'Demasiados intentos fallaron. Espera antes de intentarlo de nuevo.';

  @override
  String get authRateLimitTitle => 'Acceso bloqueado temporalmente';

  @override
  String get authRateLimitDescription =>
      'Demasiados intentos fallaron. Espera el tiempo indicado antes de intentarlo de nuevo.';

  @override
  String authRateLimitRetryIn(String time) {
    return 'Inténtalo de nuevo en $time.';
  }

  @override
  String get authRateLimitRetryAvailable => 'Ya puedes intentarlo de nuevo.';

  @override
  String get authRateLimitTryAgain => 'Intentar de nuevo';

  @override
  String get connectionError => 'Error de conexión. Verifica tu red.';

  @override
  String get drawerHome => 'Inicio';

  @override
  String get drawerChat => 'Chat';

  @override
  String get drawerCommunity => 'Comunidad';

  @override
  String get drawerProfile => 'Perfil';

  @override
  String get drawerAbout => 'Acerca de';

  @override
  String get drawerLogout => 'Cerrar Sesión';

  @override
  String get homeIntro =>
      'Haz preguntas con fuentes rastreables, explora documentos curados y ayuda a la comunidad a ampliar una base agroecológica abierta.';

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
  String get chatSubtitle =>
      'Pregunta en lenguaje natural y recibe respuestas basadas en documentos curados, con fuentes para verificar.';

  @override
  String get newChat => 'Nueva conversación';

  @override
  String get newChatTooltip =>
      'Limpia la conversación actual e inicia una nueva pregunta desde cero.';

  @override
  String get askPlaceholder => 'Haz una pregunta...';

  @override
  String get sendQuestionTooltip =>
      'Enviar la pregunta a la base de conocimiento.';

  @override
  String get chatGuidanceTitle => 'Para mejores respuestas';

  @override
  String get chatGuidanceBody =>
      'Incluye contexto, territorio, cultivo, problema observado u objetivo. La IA busca fragmentos relevantes y muestra fuentes cuando están disponibles.';

  @override
  String get chatSourcesTooltip =>
      'Las respuestas priorizan documentos indexados en la base. Verifica siempre las fuentes antes de tomar decisiones técnicas.';

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
      'Prueba preguntar sobre manejo, suelo, semillas, agroforestería, políticas públicas o prácticas comunitarias.';

  @override
  String get chatError => 'Ocurrió un error';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileSubtitle =>
      'Muestra quién eres, conecta tus contribuciones y mantén el control de tus datos.';

  @override
  String get profileNotAuth => 'No autenticado';

  @override
  String get profileNotAuthSub => 'Inicia sesión para ver tu perfil.';

  @override
  String get editProfile => 'Editar Perfil';

  @override
  String get editProfileSubtitle =>
      'Actualiza la información que ayuda a otras personas a entender tu vínculo con la agroecología.';

  @override
  String get profileVisibilityTooltip =>
      'Los perfiles activos pueden aparecer en la comunidad. Edita solo información que quieras hacer pública.';

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
  String get aboutHint =>
      'Cuenta sobre tu trabajo, territorio, investigación, organización o práctica agroecológica';

  @override
  String get aboutHelper =>
      'Un resumen claro ayuda a otras personas a entender tu contexto y tus contribuciones.';

  @override
  String get linkHelper =>
      'Agrega un sitio, perfil institucional, proyecto o referencia pública relacionada con tu trabajo.';

  @override
  String get avatarTooltip =>
      'Seleccionar una imagen de perfil. Solo se enviará la imagen elegida.';

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
  String get communitySubtitle =>
      'Encuentra personas y organizaciones que aportan documentos, prácticas y conocimiento agroecológico.';

  @override
  String get communityEmpty => 'Aún no hay miembros en la comunidad';

  @override
  String get communityEmptySub =>
      'Crea un perfil y sugiere documentos para empezar a construir la red.';

  @override
  String get searchCommunityTooltip =>
      'Busca por nombre o identificador público.';

  @override
  String get approvedSuggestions => 'Sugerencias Aprobadas';

  @override
  String get approvedSuggestionsTooltip =>
      'Número de documentos sugeridos por esta persona que fueron aprobados para la base.';

  @override
  String get aboutPageTitle => 'Acerca de';

  @override
  String get aboutPageSubtitle =>
      'Una herramienta de software libre para investigar, verificar y fortalecer conocimiento agroecológico.';

  @override
  String get aboutValueTitle => 'Valor principal';

  @override
  String get aboutValueBody =>
      'La plataforma combina IA, documentos curados y participación comunitaria para que las referencias agroecológicas sean más fáciles de encontrar y verificar.';

  @override
  String get aboutText1 =>
      'Agroecology Map AI ayuda a explorar conocimientos agroecológicos mediante un asistente de software libre basado en documentos curados y contexto comunitario.';

  @override
  String get aboutText2 =>
      'Las respuestas se generan desde la base de conocimiento y mantienen fuentes rastreables, por lo que la app funciona como una herramienta guiada de investigación y no como un chatbot genérico.';

  @override
  String get aboutText3 =>
      'El proyecto forma parte del ecosistema Agroecology Map, una iniciativa de datos abiertos y ciencia ciudadana que mapea experiencias, documenta prácticas y conecta territorios.';

  @override
  String get aboutText4 =>
      'Está pensado para agricultores, educadores, investigadores, extensionistas, estudiantes, comunidades y movimientos sociales que necesitan referencias agroecológicas prácticas.';

  @override
  String get retry => 'Reintentar';

  @override
  String get mySuggestions => 'Mis Sugerencias';

  @override
  String get suggestionsSubtitle =>
      'Acompaña documentos enviados, estado de revisión y materiales que pueden entrar en la base pública.';

  @override
  String get knowledgeBase => 'Base de Conocimiento';

  @override
  String get kbSubtitle =>
      'Consulta los documentos que fundamentan las respuestas de la IA y mira cuáles ya están indexados para búsqueda.';

  @override
  String get suggestDocument => 'Sugerir Documento';

  @override
  String get suggestionCountLabel => 'sugerencias';

  @override
  String get newSuggestion => 'Nueva Sugerencia';

  @override
  String get newSuggestionSubtitle =>
      'Envía materiales relevantes para ampliar la cobertura de la base de conocimiento.';

  @override
  String get editSuggestion => 'Editar Sugerencia';

  @override
  String get editSuggestionSubtitle =>
      'Las sugerencias pendientes pueden ajustarse antes de la revisión.';

  @override
  String get suggestionTitleLabel => 'Título';

  @override
  String get suggestionTitleHint => 'Título del documento';

  @override
  String get suggestionTitleHelper =>
      'Opcional, pero ayuda a identificar el material.';

  @override
  String get suggestionAuthorsLabel => 'Autores';

  @override
  String get suggestionAuthorsHint => 'Autores u organización';

  @override
  String get suggestionAuthorsHelper =>
      'Autoría, institución, colectivo o editorial, si corresponde.';

  @override
  String get suggestionUrlLabel => 'URL de referencia';

  @override
  String get suggestionUrlHelper =>
      'Fuente opcional, página de publicación, DOI o enlace institucional.';

  @override
  String get suggestionReviewTitle => 'Cómo funciona la revisión';

  @override
  String get suggestionReviewBody =>
      'El equipo evalúa relevancia, calidad y adecuación antes de aprobar el documento para consulta pública.';

  @override
  String get selectPdf => 'Seleccionar archivo PDF';

  @override
  String get pdfUploadTooltip =>
      'Envía un PDF legible, preferiblemente con título, autoría y contenido útil para consulta.';

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
  String get commentHint =>
      'Explica la relevancia del documento para la agroecología';

  @override
  String get commentHelper =>
      'Di de dónde viene el material, para quién es útil y por qué debería entrar en la base.';

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
  String get suggestionStatusTooltip =>
      'Pendiente espera revisión; aprobada entra en el flujo de la base; rechazada necesita ajustes o no encaja.';

  @override
  String get allStatus => 'Todas';

  @override
  String get statusPending => 'pendiente';

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
  String get suggestionNotFound => 'Sugerencia no encontrada.';

  @override
  String get suggestionNotEditable =>
      'Solo las sugerencias pendientes pueden editarse.';

  @override
  String get currentFile => 'Archivo actual';

  @override
  String get replacePdf => 'Reemplazar PDF';

  @override
  String get noFileSelected => 'Ningún archivo seleccionado';

  @override
  String get attachedPdf => 'PDF adjunto';

  @override
  String get reviewComment => 'Comentario de revisión';

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
  String get searchDocumentsTooltip =>
      'Busca por título, autoría o nombre del archivo.';

  @override
  String indexedCount(int indexed, int total) {
    return '$indexed de $total indexados';
  }

  @override
  String get allIndexed => 'Todos los archivos indexados';

  @override
  String indexedDocsCount(int count) {
    return '$count documentos indexados';
  }

  @override
  String get kbIndexedTooltip =>
      'Los documentos indexados ya pueden encontrarse en el chat. Los archivos no indexados aún pueden leerse manualmente.';

  @override
  String documentPageSummary(int loaded, int total, int indexed) {
    return '$loaded de $total cargados · $indexed indexados';
  }

  @override
  String get loadMore => 'Cargar más';

  @override
  String get documentDetail => 'Detalle del Documento';

  @override
  String get documentIndexedTitle => 'Disponible para la IA';

  @override
  String get documentIndexedBody =>
      'Este documento ya fue indexado y puede usarse para fundamentar respuestas en el chat.';

  @override
  String get documentNotIndexedTitle => 'Aún no indexado';

  @override
  String get documentNotIndexedBody =>
      'El archivo está disponible para lectura, pero aún no participa en respuestas de IA.';

  @override
  String get download => 'Descargar';

  @override
  String get downloadError => 'Error al descargar el documento';

  @override
  String get downloadSuccess => 'Documento guardado correctamente';

  @override
  String get fileType => 'Tipo de Archivo';

  @override
  String get fileSize => 'Tamaño';

  @override
  String get ingested => 'Indexado';

  @override
  String get notIngested => 'No indexado';

  @override
  String get documentAccessRestrictedTitle => 'PDF completo restringido';

  @override
  String get documentAccessRestrictedBody =>
      'Los metadatos de licencia restringen el acceso al PDF completo, por lo que descarga y vista previa no están disponibles.';

  @override
  String get academicMetadataTitle => 'Metadatos Académicos';

  @override
  String get doiField => 'DOI';

  @override
  String get publicationYear => 'Año de publicación';

  @override
  String get citations => 'Citas';

  @override
  String get references => 'Referencias';

  @override
  String get venue => 'Revista o evento';

  @override
  String get publisher => 'Editorial';

  @override
  String get matchConfidence => 'Confianza de coincidencia';

  @override
  String get sourceUrl => 'Fuente';

  @override
  String get openAccessUrl => 'Acceso abierto';

  @override
  String get abstract => 'Resumen';

  @override
  String get topics => 'Temas';

  @override
  String get keywords => 'Palabras clave';

  @override
  String get license => 'Licencia';

  @override
  String get funder => 'Financiador';

  @override
  String get drawerPrivacy => 'Política de Privacidad';

  @override
  String get drawerTerms => 'Términos de Servicio';

  @override
  String get privacyPolicyTitle => 'Política de Privacidad';

  @override
  String get privacyPolicyLastUpdated =>
      'Última actualización: 11 de junio de 2026';

  @override
  String get privacyPolicyContent =>
      'Agroecology Map AI es una plataforma de software libre para consultar conocimiento agroecológico con IA.\n\nDatos que recopilamos:\n- Nombre completo, email y contraseña con hash para acceso a la cuenta\n- Idioma o configuración regional preferida\n- Datos opcionales de perfil: bio, enlace externo y avatar\n- Comentarios y archivos de sugerencias de documentos, cuando decides enviarlos\n- Dirección IP en logs transitorios para seguridad y depuración\n\nAlmacenamiento local:\nLa app puede almacenar datos de sesión, idioma e historial reciente del chat en tu dispositivo.\n\nProcesamiento local de IA:\nLos modelos de IA y embeddings se ejecutan localmente o en infraestructura controlada por el proyecto. Las preguntas, el historial del chat, los embeddings y los documentos no se envían a APIs externas de IA.\n\nNO recopilamos IDs publicitarios, historial de navegación, ubicación en segundo plano, contactos, información de pago ni datos personales sensibles.\n\nCompartición:\nNo vendemos, alquilamos, negociamos ni compartimos tus datos personales con anunciantes, corredores de datos, servicios externos de analytics o proveedores externos de IA.\n\nTus derechos:\nPuedes exportar tus datos, editar tu perfil, eliminar tu cuenta, solicitar portabilidad y retirar el consentimiento dejando de usar o eliminando la cuenta.\n\nEliminación de cuenta:\nUsa \'Eliminar Mi Cuenta\' en el perfil. Se envía un email de confirmación. Después de confirmar, los datos personales se anonimizan permanentemente y las sesiones se terminan.\n\nPrivacidad móvil:\nLa app no solicita cámara, micrófono, contactos o ubicación. El acceso a la galería puede solicitarse solo cuando eliges un avatar; solo se envía la imagen seleccionada. La app no usa SDKs externos de analytics y usa HTTPS.\n\nContacto y DPO: contact@agroecologymap.org\nLicencia: GPLv3 (software libre)';

  @override
  String get termsOfServiceTitle => 'Términos de Servicio';

  @override
  String get termsOfServiceLastUpdated =>
      'Última actualización: 11 de junio de 2026';

  @override
  String get termsOfServiceContent =>
      '1. Aceptación de los términos\nAl crear una cuenta y usar Agroecology Map AI, aceptas estos Términos de Servicio.\n\n2. Descripción del servicio\nAgroecology Map AI es una plataforma de chat con IA para consultar conocimiento agroecológico. Los modelos de IA y embeddings se ejecutan localmente o en infraestructura controlada por el proyecto, sin APIs externas de IA.\n\n3. Cuentas de usuario\nEres responsable de tus credenciales. Proporciona información precisa. Edad mínima: 16 años.\n\n4. Uso aceptable\nNo uses la plataforma para fines ilegales, no envíes contenido perjudicial, no intentes interrumpir el servicio y no falsees tu identidad.\n\n5. Contenido del usuario\nAl enviar contenido, otorgas una licencia no exclusiva para mostrarlo dentro de la plataforma. Conservas la propiedad.\n\n6. Propiedad intelectual\nEl software está licenciado bajo GPLv3. Los documentos conservan sus licencias originales.\n\n7. Sin garantías\nLa plataforma se ofrece tal cual. Las respuestas de IA pueden no ser precisas. Verifica siempre las fuentes primarias.\n\n8. Limitación de responsabilidad\nEn la medida permitida por la ley, el proyecto y sus voluntarios no son responsables por daños derivados del uso.\n\n9. Terminación de cuenta\nLas cuentas que violen estos términos pueden ser suspendidas. Los usuarios pueden eliminar cuentas en cualquier momento.\n\n10. Modificaciones\nLos términos pueden actualizarse. Los cambios importantes se comunicarán por email.\n\n11. Ley aplicable\nRegido por las leyes de Brasil.\n\n12. Contacto\ncontact@agroecologymap.org';

  @override
  String get acceptPrivacyPrefix => 'Acepto la ';

  @override
  String get acceptPrivacyLink => 'Política de Privacidad';

  @override
  String get acceptTosPrefix => 'Acepto los ';

  @override
  String get acceptTosLink => 'Términos de Servicio';

  @override
  String get dataAndPrivacy => 'Datos y Privacidad';

  @override
  String get dataAndPrivacySubtitle =>
      'Exporta tus datos cuando lo necesites y solicita la eliminación con confirmación por email.';

  @override
  String get exportMyData => 'Exportar Mis Datos';

  @override
  String get exportSuccess => 'Datos exportados exitosamente';

  @override
  String get exportFailed => 'Error al exportar datos';

  @override
  String get deleteMyAccount => 'Eliminar Mi Cuenta';

  @override
  String get deleteAccountConfirmTitle => 'Eliminar Cuenta';

  @override
  String get deleteAccountConfirmBody =>
      '¿Estás seguro? Se enviará un correo de confirmación.';

  @override
  String get deleteAccountConfirmButton => 'Eliminar';

  @override
  String get deleteAccountFailed => 'Error al solicitar eliminación';

  @override
  String get statusActive => 'activo';

  @override
  String get statusSuspended => 'suspendido';

  @override
  String get statusDeleted => 'eliminado';

  @override
  String get roleUser => 'usuario';

  @override
  String get loggedOut => 'Has cerrado sesión.';

  @override
  String get searchCommunity => 'Buscar comunidad...';

  @override
  String get searchNoResults => 'Ningún miembro coincidente';
}
