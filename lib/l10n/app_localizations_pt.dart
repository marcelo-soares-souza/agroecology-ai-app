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
  String get drawerHome => 'Início';

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
  String get homeIntro =>
      'Consulte conhecimentos agroecológicos, explore documentos e acompanhe a comunidade em uma plataforma livre com IA.';

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
      'O Agroecology Map AI ajuda pessoas a explorar conhecimentos agroecológicos por meio de um assistente de software livre baseado em documentos curados e no contexto das comunidades.';

  @override
  String get aboutText2 =>
      'As respostas são geradas a partir da base de conhecimento e mantêm as fontes rastreáveis, funcionando como uma ferramenta guiada de pesquisa, não como um chatbot genérico.';

  @override
  String get aboutText3 =>
      'O projeto faz parte do ecossistema Agroecology Map, uma iniciativa de dados abertos e ciência cidadã que mapeia experiências, documenta práticas e conecta territórios.';

  @override
  String get aboutText4 =>
      'Ele é feito para agricultores, educadores, pesquisadores, extensionistas, estudantes, comunidades e movimentos sociais que precisam de referências agroecológicas práticas.';

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
  String get donateButton => 'Abrir página de doação';

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
  String get suggestionCountLabel => 'sugestões';

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
  String get statusPending => 'pendente';

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
  String get downloadError => 'Erro ao baixar o documento';

  @override
  String get downloadSuccess => 'Documento salvo com sucesso';

  @override
  String get fileType => 'Tipo de Arquivo';

  @override
  String get fileSize => 'Tamanho';

  @override
  String get ingested => 'Indexado';

  @override
  String get notIngested => 'Não indexado';

  @override
  String get drawerPrivacy => 'Política de Privacidade';

  @override
  String get drawerTerms => 'Termos de Serviço';

  @override
  String get privacyPolicyTitle => 'Política de Privacidade';

  @override
  String get privacyPolicyLastUpdated =>
      'Última atualização: 11 de junho de 2026';

  @override
  String get privacyPolicyContent =>
      'O Agroecology Map AI é uma plataforma de software livre para consultar conhecimento agroecológico com IA.\n\nDados que Coletamos:\n- Nome completo, email e senha hash para acesso à conta\n- Idioma/localidade de preferência\n- Dados opcionais de perfil: sobre, link externo e avatar\n- Comentários e arquivos de sugestões de documentos, quando você decide enviá-los\n- Endereço IP em logs transitórios de requisição para segurança e depuração\n\nArmazenamento Local:\nO app pode armazenar dados de sessão, escolha de consentimento, idioma e histórico recente do chat no seu dispositivo.\n\nProcessamento Local de IA:\nModelos de IA e embeddings rodam localmente ou em infraestrutura controlada pelo projeto. Perguntas, histórico do chat, embeddings e documentos não são enviados para APIs externas de IA.\n\nNÃO coletamos IDs de publicidade, histórico de navegação, localização em segundo plano, contatos ou dados pessoais sensíveis.\n\nCompartilhamento:\nNão vendemos, alugamos, negociamos ou compartilhamos seus dados pessoais com anunciantes, corretores de dados, serviços externos de analytics ou provedores externos de IA. Links de doação podem abrir Ko-fi ou Patreon, que usam suas próprias políticas.\n\nSeus Direitos:\nVocê pode exportar seus dados, editar seu perfil, excluir sua conta, solicitar portabilidade e revogar consentimento parando de usar ou excluindo a conta.\n\nExclusão de Conta:\nUse \'Excluir Minha Conta\' no perfil. Um email de confirmação é enviado. Após confirmação, os dados pessoais são anonimizados permanentemente e as sessões são encerradas.\n\nPrivacidade Mobile:\nO app não solicita câmera, microfone, contatos ou localização. O acesso à galeria/fotos pode ser solicitado apenas quando você escolhe um avatar; somente a imagem selecionada é enviada. O app não usa SDKs de analytics de terceiros e usa HTTPS.\n\nContato e DPO: contact@agroecologymap.org\nLicença: GPLv3 (Software Livre)';

  @override
  String get termsOfServiceTitle => 'Termos de Serviço';

  @override
  String get termsOfServiceLastUpdated =>
      'Última atualização: 11 de junho de 2026';

  @override
  String get termsOfServiceContent =>
      '1. Aceitação dos Termos\nAo criar uma conta e usar o Agroecology Map AI, você concorda com estes Termos de Serviço.\n\n2. Descrição do Serviço\nO Agroecology Map AI é uma plataforma de chat com IA para consulta de conhecimento agroecológico. Modelos de IA e embeddings rodam localmente ou em infraestrutura controlada pelo projeto, sem APIs externas de IA.\n\n3. Contas de Usuário\nVocê é responsável por suas credenciais. Forneça informações precisas. Idade mínima: 16 anos.\n\n4. Uso Aceitável\nNão use a plataforma para fins ilegais, envie conteúdo prejudicial, tente interromper o serviço ou deturpe sua identidade.\n\n5. Conteúdo do Usuário\nAo enviar conteúdo, você concede licença não exclusiva para exibição dentro da plataforma. Você mantém a propriedade.\n\n6. Propriedade Intelectual\nO software é licenciado GPLv3. Conteúdo de documentos mantém suas licenças originais.\n\n7. Isenção de Garantias\nA plataforma é fornecida \'COMO ESTÁ\'. Respostas da IA podem não ser precisas. Sempre verifique as fontes primárias.\n\n8. Limitação de Responsabilidade\nNa medida permitida por lei, o projeto e voluntários não são responsáveis por danos decorrentes do uso.\n\n9. Encerramento de Conta\nContas que violarem estes termos podem ser suspensas. Usuários podem excluir contas a qualquer momento.\n\n10. Modificações\nTermos podem ser atualizados. Alterações significativas comunicadas por email.\n\n11. Lei Aplicável\nRegido pelas leis do Brasil.\n\n12. Contato\ncontact@agroecologymap.org';

  @override
  String get acceptPrivacyPrefix => 'Aceito a ';

  @override
  String get acceptPrivacyLink => 'Política de Privacidade';

  @override
  String get acceptTosPrefix => 'Aceito os ';

  @override
  String get acceptTosLink => 'Termos de Serviço';

  @override
  String get dataAndPrivacy => 'Dados e Privacidade';

  @override
  String get exportMyData => 'Exportar Meus Dados';

  @override
  String get exportSuccess => 'Dados exportados com sucesso';

  @override
  String get exportFailed => 'Falha ao exportar dados';

  @override
  String get deleteMyAccount => 'Excluir Minha Conta';

  @override
  String get deleteAccountConfirmTitle => 'Excluir Conta';

  @override
  String get deleteAccountConfirmBody =>
      'Tem certeza? Um email de confirmação será enviado. Após confirmado, seus dados pessoais serão anonimizados permanentemente.';

  @override
  String get deleteAccountConfirmButton => 'Excluir';

  @override
  String get deleteAccountFailed => 'Falha ao solicitar exclusão da conta';

  @override
  String get consentMessage =>
      'Este aplicativo não utiliza cookies de publicidade ou rastreadores de terceiros. Usamos armazenamento local para sessão, idioma, escolha de consentimento e histórico de chat neste dispositivo. Ao continuar, você reconhece nossa';

  @override
  String get consentAnd => 'e nossos';

  @override
  String get consentAccept => 'Aceitar';

  @override
  String get consentDecline => 'Recusar';

  @override
  String get statusActive => 'ativo';

  @override
  String get statusSuspended => 'suspenso';

  @override
  String get statusDeleted => 'excluído';

  @override
  String get roleAdmin => 'admin';

  @override
  String get roleUser => 'usuário';
}
