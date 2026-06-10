// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Agroecology Map AI';

  @override
  String get betaLabel => 'BETA';

  @override
  String get signIn => 'Entrar';

  @override
  String get signInWelcome => 'Bem-vindo de volta ao Agroecology Map AI';

  @override
  String get signInButton => 'Entrar';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'seu@email.com';

  @override
  String get emailRequired => 'Email é obrigatório';

  @override
  String get passwordLabel => 'Senha';

  @override
  String get passwordHint => 'Sua senha';

  @override
  String get passwordRequired => 'Senha é obrigatória';

  @override
  String get passwordMinLength => 'A senha deve ter pelo menos 8 caracteres';

  @override
  String get newPasswordLabel => 'Nova Senha';

  @override
  String get newPasswordHint => 'Pelo menos 8 caracteres';

  @override
  String get forgotPassword => 'Esqueceu a senha?';

  @override
  String get noAccount => 'Não tem uma conta? ';

  @override
  String get register => 'Cadastrar';

  @override
  String get createAccount => 'Criar Conta';

  @override
  String get createAccountSubtitle =>
      'Junte-se à comunidade Agroecology Map AI';

  @override
  String get fullNameLabel => 'Nome Completo';

  @override
  String get fullNameHint => 'Seu nome';

  @override
  String get fullNameRequired => 'Nome completo é obrigatório';

  @override
  String get fullNameMaxLength => 'Nome deve ter menos de 200 caracteres';

  @override
  String get answerLabel => 'Resposta';

  @override
  String get answerHint => 'Sua resposta à pergunta acima';

  @override
  String get answerRequired => 'Resposta é obrigatória';

  @override
  String get hasAccount => 'Já tem uma conta? ';

  @override
  String get resetPassword => 'Redefinir Senha';

  @override
  String get resetLinkSent =>
      'Se o email existir, um link de redefinição foi enviado.';

  @override
  String get resetLinkInstruction =>
      'Digite seu email e enviaremos um link de redefinição.';

  @override
  String get sendResetLink => 'Enviar Link';

  @override
  String get backToSignIn => 'Voltar para Entrar';

  @override
  String get newPassword => 'Nova Senha';

  @override
  String get passwordResetSuccess => 'Senha redefinida com sucesso.';

  @override
  String get goToSignIn => 'Ir para Entrar';

  @override
  String get resetTokenInstruction =>
      'Digite o token de redefinição do seu email e sua nova senha.';

  @override
  String get resetTokenLabel => 'Token de Redefinição';

  @override
  String get resetTokenHint => 'Cole o token do seu email';

  @override
  String get tokenRequired => 'Token é obrigatório';

  @override
  String get resetPasswordButton => 'Redefinir Senha';

  @override
  String get resetFailed => 'Falha ao redefinir a senha.';

  @override
  String get restoringSession => 'Restaurando sessão...';

  @override
  String get loginFailed => 'Falha no login. Tente novamente.';

  @override
  String get registrationSuccess =>
      'Cadastro realizado. Verifique seu email para confirmar sua conta.';

  @override
  String get registrationFailed => 'Falha no cadastro. Tente novamente.';

  @override
  String get connectionError => 'Erro de conexão. Verifique sua rede.';

  @override
  String get drawerChat => 'Chat';

  @override
  String get drawerCommunity => 'Comunidade';

  @override
  String get drawerProfile => 'Perfil';

  @override
  String get drawerAbout => 'Sobre';

  @override
  String get drawerDonate => 'Doar';

  @override
  String get drawerLogout => 'Sair';

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
  String get chatSubtitle => 'Faça perguntas sobre agroecologia';

  @override
  String get newChat => 'Nova conversa';

  @override
  String get askPlaceholder => 'Faça uma pergunta...';

  @override
  String get thinking => 'Pensando...';

  @override
  String get sources => 'Fontes';

  @override
  String get sourceFallback => 'Fonte';

  @override
  String get requestTimeout => 'Tempo limite excedido. Tente novamente.';

  @override
  String get chatEmptyTitle => 'Faça uma pergunta sobre agroecologia';

  @override
  String get chatEmptySubtitle =>
      'A IA responde a partir da base de conhecimento,\nmantendo as fontes rastreáveis.';

  @override
  String get chatError => 'Ocorreu um erro';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileNotAuth => 'Não autenticado';

  @override
  String get profileNotAuthSub => 'Faça login para ver seu perfil.';

  @override
  String get editProfile => 'Editar Perfil';

  @override
  String get joined => 'Entrou em';

  @override
  String get lastLogin => 'Último login';

  @override
  String get about => 'Sobre';

  @override
  String get linkLabel => 'Link';

  @override
  String get openLink => 'Abrir link';

  @override
  String get save => 'Salvar';

  @override
  String get nameRequired => 'Nome é obrigatório';

  @override
  String aboutMaxLength(int count) {
    return 'Sobre deve ter menos de $count caracteres';
  }

  @override
  String get linkValidation => 'Link deve começar com http:// ou https://';

  @override
  String get linkHint => 'https://exemplo.com';

  @override
  String get aboutHint => 'Conte sobre você para a comunidade';

  @override
  String imageTooLarge(int mb) {
    return 'Imagem deve ter menos de $mb MB';
  }

  @override
  String get uploadAvatarFailed => 'Falha ao enviar avatar.';

  @override
  String get saveProfileFailed => 'Falha ao salvar perfil.';

  @override
  String get communityTitle => 'Comunidade';

  @override
  String get communityEmpty => 'Nenhum membro na comunidade ainda';

  @override
  String get communityEmptySub => 'Seja o primeiro a participar!';

  @override
  String get approvedSuggestions => 'Sugestões Aprovadas';

  @override
  String get aboutPageTitle => 'Sobre';

  @override
  String get aboutText1 =>
      'Agroecology Map AI é uma ferramenta de software livre que torna o conhecimento agroecológico mais fácil de encontrar, compreender e compartilhar.';

  @override
  String get aboutText2 =>
      'A IA responde a partir de documentos da base de conhecimento, mantendo fontes rastreáveis em vez de atuar como chatbot genérico.';

  @override
  String get aboutText3 =>
      'O projeto faz parte do ecossistema Agroecology Map, iniciativa de ciência cidadã, dados abertos e software livre que mapeia experiências agroecológicas e conecta comunidades.';

  @override
  String get aboutText4 =>
      'A proposta é apoiar agricultores, pesquisadores, extensionistas, educadores, estudantes, comunidades e movimentos sociais.';

  @override
  String get donateTitle => 'Doar';

  @override
  String get donateText1 =>
      'Agroecology Map AI é mantido por trabalho voluntário e software livre.';

  @override
  String get donateText2 =>
      'Doações ajudam a manter e expandir a infraestrutura, processamento, armazenamento, indexação de documentos e experimentos com modelos locais.';

  @override
  String get donateText3 =>
      'O apoio fortalece uma plataforma aberta, sem paywall, voltada a comunidades, pesquisadores e agricultores.';

  @override
  String get donateButton => 'Doar via Ko-fi';

  @override
  String get donateError => 'Não foi possível abrir a página de doação.';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get mySuggestions => 'Minhas Sugestões';

  @override
  String get knowledgeBase => 'Base de Conhecimento';

  @override
  String get suggestDocument => 'Sugerir Documento';

  @override
  String get newSuggestion => 'Nova Sugestão';

  @override
  String get selectPdf => 'Selecionar arquivo PDF';

  @override
  String get pdfOnly => 'Apenas arquivos PDF são aceitos';

  @override
  String get fileRequired => 'Um arquivo PDF é obrigatório';

  @override
  String fileTooLarge(int size) {
    return 'Arquivo deve ter menos de $size MB';
  }

  @override
  String get commentLabel => 'Comentário';

  @override
  String get commentHint => 'Por que você está sugerindo este documento?';

  @override
  String get commentRequired => 'Um comentário é obrigatório';

  @override
  String get submitSuggestion => 'Enviar Sugestão';

  @override
  String get suggestionCreated => 'Sugestão enviada com sucesso.';

  @override
  String get deleteSuggestion => 'Excluir Sugestão';

  @override
  String get deleteSuggestionConfirm =>
      'Tem certeza que deseja excluir esta sugestão?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Excluir';

  @override
  String get noSuggestions => 'Nenhuma sugestão ainda';

  @override
  String get noSuggestionsSub =>
      'Sugira um documento para ajudar a expandir a base de conhecimento.';

  @override
  String get allStatus => 'Todas';

  @override
  String get statusPending => 'Pendente';

  @override
  String get statusApproved => 'Aprovada';

  @override
  String get statusRejected => 'Rejeitada';

  @override
  String get untitled => 'Sem título';

  @override
  String get filename => 'Nome do arquivo';

  @override
  String get suggestionDetail => 'Detalhe da Sugestão';

  @override
  String get adminComment => 'Comentário do Admin';

  @override
  String get resultingDocument => 'Documento Resultante';

  @override
  String get viewDocument => 'Ver Documento';

  @override
  String get kbTitle => 'Base de Conhecimento';

  @override
  String get kbEmpty => 'Nenhum documento na base de conhecimento ainda.';

  @override
  String get searchDocuments => 'Buscar documentos...';

  @override
  String indexedCount(int indexed, int total) {
    return '$indexed de $total indexados';
  }

  @override
  String get allIndexed => 'Todos os arquivos indexados';

  @override
  String get documentDetail => 'Detalhe do Documento';

  @override
  String get download => 'Baixar';

  @override
  String get fileType => 'Tipo de Arquivo';

  @override
  String get fileSize => 'Tamanho';

  @override
  String get ingested => 'Indexado';

  @override
  String get notIngested => 'Não indexado';
}
