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
  String get signIn => 'Entrar';

  @override
  String get signInWelcome =>
      'Entre para consultar respostas com fontes, continuar seu histórico e contribuir com a base agroecológica.';

  @override
  String get signInButton => 'Entrar';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'seu@email.com';

  @override
  String get emailHelper =>
      'Use o email da sua conta para receber confirmações e avisos importantes.';

  @override
  String get emailRequired => 'Email é obrigatório';

  @override
  String get passwordLabel => 'Senha';

  @override
  String get passwordHint => 'Sua senha';

  @override
  String get passwordHelper =>
      'Sua senha protege o acesso ao seu histórico e perfil.';

  @override
  String get passwordVisibilityTooltip =>
      'Mostrar ou ocultar a senha digitada.';

  @override
  String get passwordRequired => 'Senha é obrigatória';

  @override
  String get passwordMinLength => 'A senha deve ter pelo menos 8 caracteres';

  @override
  String get newPasswordLabel => 'Nova Senha';

  @override
  String get newPasswordHint => 'Pelo menos 8 caracteres';

  @override
  String get newPasswordHelper =>
      'Use uma senha única, com pelo menos 8 caracteres.';

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
      'Crie uma conta para sugerir documentos, manter um perfil público e fortalecer uma base de conhecimento aberta.';

  @override
  String get fullNameLabel => 'Nome Completo';

  @override
  String get fullNameHint => 'Seu nome';

  @override
  String get fullNameHelper =>
      'Este nome aparece no seu perfil e ajuda a comunidade reconhecer suas contribuições.';

  @override
  String get fullNameRequired => 'Nome completo é obrigatório';

  @override
  String get fullNameMaxLength => 'Nome deve ter menos de 200 caracteres';

  @override
  String get answerLabel => 'Resposta';

  @override
  String get answerHint => 'Sua resposta à pergunta acima';

  @override
  String get answerHelper =>
      'Esta etapa simples ajuda a proteger a comunidade contra cadastros automatizados.';

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
      'Digite o email da sua conta para receber um link seguro de redefinição.';

  @override
  String get resetEmailHelper =>
      'Enviaremos o link somente se o email estiver cadastrado.';

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
  String get confirmingEmail => 'Confirmando seu email...';

  @override
  String get emailConfirmationTitle => 'Confirmação de Email';

  @override
  String get emailConfirmedTitle => 'Email Confirmado';

  @override
  String get emailConfirmationFailed => 'Falha ao confirmar email.';

  @override
  String get missingToken => 'O token de confirmação está ausente.';

  @override
  String get resendConfirmationTitle => 'Reenviar Confirmação';

  @override
  String get resendConfirmationInstruction =>
      'Digite o email da sua conta para receber um novo link de confirmação.';

  @override
  String get resendConfirmationButton => 'Reenviar Confirmação';

  @override
  String get resendConfirmationSentTitle => 'Confirmação Enviada';

  @override
  String get resendConfirmationSentBody =>
      'Se o email existir e ainda precisar de confirmação, um novo link foi enviado.';

  @override
  String get resendConfirmationFailed => 'Falha ao reenviar confirmação.';

  @override
  String get deleteAccountConfirming => 'Confirmando exclusão da conta...';

  @override
  String get accountDeletedTitle => 'Conta Excluída';

  @override
  String get resetTokenInstruction =>
      'Digite o token de redefinição do seu email e sua nova senha.';

  @override
  String get resetTokenLabel => 'Token de Redefinição';

  @override
  String get resetTokenHint => 'Cole o token do seu email';

  @override
  String get resetTokenHelper =>
      'Use exatamente o token recebido por email antes de definir a nova senha.';

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
  String get authRateLimited =>
      'Muitas tentativas falharam. Aguarde antes de tentar novamente.';

  @override
  String get authRateLimitTitle => 'Acesso temporariamente bloqueado';

  @override
  String get authRateLimitDescription =>
      'Muitas tentativas falharam. Aguarde o tempo indicado antes de tentar novamente.';

  @override
  String authRateLimitRetryIn(String time) {
    return 'Tente novamente em $time.';
  }

  @override
  String get authRateLimitRetryAvailable => 'Você já pode tentar novamente.';

  @override
  String get authRateLimitTryAgain => 'Tentar novamente';

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
  String get drawerLogout => 'Sair';

  @override
  String get homeIntro =>
      'Faça perguntas com fontes rastreáveis, explore documentos curados e ajude a comunidade a ampliar uma base agroecológica aberta.';

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
      'Pergunte em linguagem natural e receba respostas baseadas em documentos curados, com fontes para verificar.';

  @override
  String get newChat => 'Nova conversa';

  @override
  String get newChatTooltip => 'Cria uma nova conversa salva.';

  @override
  String get chatConversations => 'Conversas';

  @override
  String get noChatConversations => 'Nenhuma conversa salva ainda.';

  @override
  String get deleteChatConversation => 'Excluir conversa';

  @override
  String get deleteChatConversationConfirm =>
      'Excluir esta conversa e todas as mensagens dela?';

  @override
  String get chatConversationLimitReached =>
      'Você atingiu o limite de 10 conversas salvas. Exclua uma conversa para iniciar outra.';

  @override
  String get askPlaceholder => 'Faça uma pergunta...';

  @override
  String get sendQuestionTooltip =>
      'Enviar pergunta para a base de conhecimento.';

  @override
  String get chatGuidanceTitle => 'Para respostas melhores';

  @override
  String get chatGuidanceBody =>
      'Inclua contexto, território, cultivo, problema observado ou objetivo. A IA busca trechos relevantes e mostra as fontes quando disponíveis.';

  @override
  String get chatSourcesTooltip =>
      'As respostas priorizam documentos indexados na base. Sempre confira as fontes antes de tomar decisões técnicas.';

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
      'Experimente perguntar sobre manejo, solo, sementes, agroflorestas, políticas públicas ou práticas comunitárias.';

  @override
  String get chatError => 'Ocorreu um erro';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileSubtitle =>
      'Mostre quem você é, conecte suas contribuições e mantenha seus dados sob controle.';

  @override
  String get profileNotAuth => 'Não autenticado';

  @override
  String get profileNotAuthSub => 'Faça login para ver seu perfil.';

  @override
  String get editProfile => 'Editar Perfil';

  @override
  String get editProfileSubtitle =>
      'Atualize as informações que ajudam outras pessoas a entender seu vínculo com a agroecologia.';

  @override
  String get profileVisibilityTooltip =>
      'Perfis ativos podem aparecer na comunidade. Edite apenas informações que você deseja tornar públicas.';

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
  String get aboutHint =>
      'Conte sobre sua atuação, território, pesquisa, organização ou prática agroecológica';

  @override
  String get aboutHelper =>
      'Um resumo claro ajuda outras pessoas a entenderem seu contexto e suas contribuições.';

  @override
  String get linkHelper =>
      'Adicione um site, perfil institucional, projeto ou referência pública relacionada ao seu trabalho.';

  @override
  String get avatarTooltip =>
      'Selecionar uma imagem de perfil. Apenas a imagem escolhida será enviada.';

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
  String get communitySubtitle =>
      'Encontre pessoas e organizações que contribuem com documentos, práticas e conhecimento agroecológico.';

  @override
  String get communityEmpty => 'Nenhum membro na comunidade ainda';

  @override
  String get communityEmptySub =>
      'Crie um perfil e sugira documentos para começar a construir a rede.';

  @override
  String get searchCommunityTooltip =>
      'Busque por nome ou identificador público.';

  @override
  String get approvedSuggestions => 'Sugestões Aprovadas';

  @override
  String get approvedSuggestionsTooltip =>
      'Número de documentos sugeridos por esta pessoa que foram aprovados para a base.';

  @override
  String get aboutPageTitle => 'Sobre';

  @override
  String get aboutPageSubtitle =>
      'Uma ferramenta livre para pesquisar, verificar e fortalecer conhecimento agroecológico.';

  @override
  String get aboutValueTitle => 'Valor principal';

  @override
  String get aboutValueBody =>
      'A plataforma combina IA, documentos curados e participação comunitária para tornar referências agroecológicas mais fáceis de encontrar e verificar.';

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
  String get retry => 'Tentar novamente';

  @override
  String get mySuggestions => 'Minhas Sugestões';

  @override
  String get suggestionsSubtitle =>
      'Acompanhe documentos enviados, status de revisão e materiais que podem entrar na base pública.';

  @override
  String get knowledgeBase => 'Base de Conhecimento';

  @override
  String get kbSubtitle =>
      'Consulte os documentos que fundamentam as respostas da IA e veja quais já estão indexados para busca.';

  @override
  String get suggestDocument => 'Sugerir Documento';

  @override
  String get suggestionCountLabel => 'sugestões';

  @override
  String get newSuggestion => 'Nova Sugestão';

  @override
  String get newSuggestionSubtitle =>
      'Envie materiais relevantes para ampliar a cobertura da base de conhecimento.';

  @override
  String get editSuggestion => 'Editar Sugestão';

  @override
  String get editSuggestionSubtitle =>
      'Sugestões pendentes podem ser ajustadas antes da revisão.';

  @override
  String get suggestionTitleLabel => 'Título';

  @override
  String get suggestionTitleHint => 'Título do documento';

  @override
  String get suggestionTitleHelper =>
      'Opcional, mas ajuda a revisão a identificar o material.';

  @override
  String get suggestionAuthorsLabel => 'Autores';

  @override
  String get suggestionAuthorsHint => 'Autores ou organização';

  @override
  String get suggestionAuthorsHelper =>
      'Autoria, instituição, coletivo ou editora, se houver.';

  @override
  String get suggestionUrlLabel => 'URL de referência';

  @override
  String get suggestionUrlHelper =>
      'Fonte opcional, página da publicação, DOI ou link institucional.';

  @override
  String get suggestionReviewTitle => 'Como a revisão funciona';

  @override
  String get suggestionReviewBody =>
      'A equipe avalia relevância, qualidade e adequação antes de aprovar o documento para consulta pública.';

  @override
  String get selectPdf => 'Selecionar arquivo PDF';

  @override
  String get pdfUploadTooltip =>
      'Envie um PDF legível, preferencialmente com título, autoria e conteúdo útil para consulta.';

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
  String get commentHint =>
      'Explique a relevância do documento para a agroecologia';

  @override
  String get commentHelper =>
      'Diga de onde vem o material, para quem ele é útil e por que deveria entrar na base.';

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
  String get suggestionStatusTooltip =>
      'Pendente aguarda revisão; aprovada entra no fluxo da base; rejeitada precisa de ajustes ou não se encaixa.';

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
  String get suggestionNotFound => 'Sugestão não encontrada.';

  @override
  String get suggestionNotEditable =>
      'Somente sugestões pendentes podem ser editadas.';

  @override
  String get currentFile => 'Arquivo atual';

  @override
  String get replacePdf => 'Substituir PDF';

  @override
  String get noFileSelected => 'Nenhum arquivo selecionado';

  @override
  String get attachedPdf => 'PDF anexado';

  @override
  String get reviewComment => 'Comentário de revisão';

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
  String get searchDocumentsTooltip =>
      'Busque por título, autoria ou nome do arquivo.';

  @override
  String indexedCount(int indexed, int total) {
    return '$indexed de $total indexados';
  }

  @override
  String get allIndexed => 'Todos os arquivos indexados';

  @override
  String indexedDocsCount(int count) {
    return '$count documentos indexados';
  }

  @override
  String get kbIndexedTooltip =>
      'Documentos indexados já podem ser encontrados pelo chat. Arquivos não indexados ainda podem ser lidos manualmente.';

  @override
  String documentPageSummary(int loaded, int total, int indexed) {
    return '$loaded de $total carregados · $indexed indexados';
  }

  @override
  String get loadMore => 'Carregar mais';

  @override
  String get documentDetail => 'Detalhe do Documento';

  @override
  String get documentIndexedTitle => 'Disponível para a IA';

  @override
  String get documentIndexedBody =>
      'Este documento já foi indexado e pode ser usado para fundamentar respostas no chat.';

  @override
  String get documentNotIndexedTitle => 'Ainda não indexado';

  @override
  String get documentNotIndexedBody =>
      'O arquivo está disponível para consulta, mas ainda não participa das respostas da IA.';

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
  String get documentAccessRestrictedTitle => 'PDF completo restrito';

  @override
  String get documentAccessRestrictedBody =>
      'Os metadados de licença restringem o acesso ao PDF completo, então download e preview não estão disponíveis.';

  @override
  String get academicMetadataTitle => 'Metadados Acadêmicos';

  @override
  String get doiField => 'DOI';

  @override
  String get publicationYear => 'Ano de publicação';

  @override
  String get citations => 'Citações';

  @override
  String get references => 'Referências';

  @override
  String get venue => 'Periódico ou evento';

  @override
  String get publisher => 'Editora';

  @override
  String get matchConfidence => 'Confiança da correspondência';

  @override
  String get sourceUrl => 'Fonte';

  @override
  String get openAccessUrl => 'Acesso aberto';

  @override
  String get abstract => 'Resumo';

  @override
  String get topics => 'Tópicos';

  @override
  String get keywords => 'Palavras-chave';

  @override
  String get license => 'Licença';

  @override
  String get funder => 'Financiador';

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
      'O Agroecology Map AI é uma plataforma de software livre para consultar conhecimento agroecológico com IA.\n\nDados que Coletamos:\n- Nome completo, email e senha hash para acesso à conta\n- Idioma/localidade de preferência\n- Dados opcionais de perfil: sobre, link externo e avatar\n- Comentários e arquivos de sugestões de documentos, quando você decide enviá-los\n- Conversas do chat, mensagens e fontes recuperadas para permitir continuar a pesquisa depois\n- Endereço IP em logs transitórios de requisição para segurança e depuração\n\nArmazenamento Local:\nO app pode armazenar dados de sessão e idioma no seu dispositivo.\n\nProcessamento de IA:\nModelos de IA e embeddings rodam localmente ou em infraestrutura controlada pelo projeto. Provedores externos de IA ficam desativados por padrão e só podem ser habilitados por um deployment com termos de privacidade documentados. Perguntas, histórico do chat, embeddings e documentos não são enviados para APIs externas de IA salvo quando esse deployment habilita e divulga explicitamente um provedor externo.\n\nNÃO coletamos IDs de publicidade, histórico de navegação, localização em segundo plano, contatos, informações de pagamento ou dados pessoais sensíveis.\n\nCompartilhamento:\nNão vendemos, alugamos, negociamos ou compartilhamos seus dados pessoais com anunciantes, corretores de dados, serviços externos de analytics ou provedores externos de IA não documentados.\n\nSeus Direitos:\nVocê pode exportar seus dados, editar seu perfil, excluir sua conta, solicitar portabilidade e revogar consentimento parando de usar ou excluindo a conta.\n\nExclusão de Conta:\nUse \'Excluir Minha Conta\' no perfil. Um email de confirmação é enviado. Após confirmação, os dados pessoais são anonimizados permanentemente, conversas salvas do chat são excluídas e as sessões são encerradas.\n\nPrivacidade Mobile:\nO app não solicita câmera, microfone, contatos ou localização. O acesso à galeria/fotos pode ser solicitado apenas quando você escolhe um avatar; somente a imagem selecionada é enviada. O app não usa SDKs de analytics de terceiros e usa HTTPS.\n\nContato e DPO: contact@agroecologymap.org\nLicença: GPLv3 (Software Livre)';

  @override
  String get termsOfServiceTitle => 'Termos de Serviço';

  @override
  String get termsOfServiceLastUpdated =>
      'Última atualização: 11 de junho de 2026';

  @override
  String get termsOfServiceContent =>
      '1. Aceitação dos Termos\nAo criar uma conta e usar o Agroecology Map AI, você concorda com estes Termos de Serviço.\n\n2. Descrição do Serviço\nO Agroecology Map AI é uma plataforma de chat com IA para consulta de conhecimento agroecológico. Modelos de IA e embeddings rodam localmente ou em infraestrutura controlada pelo projeto. Provedores externos de IA ficam desativados por padrão e só podem ser habilitados por um deployment com termos de privacidade documentados.\n\n3. Contas de Usuário\nVocê é responsável por suas credenciais. Forneça informações precisas. Idade mínima: 16 anos.\n\n4. Uso Aceitável\nNão use a plataforma para fins ilegais, envie conteúdo prejudicial, tente interromper o serviço ou deturpe sua identidade.\n\n5. Conteúdo do Usuário\nAo enviar conteúdo, você concede licença não exclusiva para exibição dentro da plataforma. Você mantém a propriedade.\n\n6. Propriedade Intelectual\nO software é licenciado GPLv3. Conteúdo de documentos mantém suas licenças originais.\n\n7. Isenção de Garantias\nA plataforma é fornecida \'COMO ESTÁ\'. Respostas da IA podem não ser precisas. Sempre verifique as fontes primárias.\n\n8. Limitação de Responsabilidade\nNa medida permitida por lei, o projeto e voluntários não são responsáveis por danos decorrentes do uso.\n\n9. Encerramento de Conta\nContas que violarem estes termos podem ser suspensas. Usuários podem excluir contas a qualquer momento.\n\n10. Modificações\nTermos podem ser atualizados. Alterações significativas comunicadas por email.\n\n11. Lei Aplicável\nRegido pelas leis do Brasil.\n\n12. Contato\ncontact@agroecologymap.org';

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
  String get dataAndPrivacySubtitle =>
      'Exporte seus dados quando precisar e solicite exclusão com confirmação por email.';

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
  String get statusActive => 'ativo';

  @override
  String get statusSuspended => 'suspenso';

  @override
  String get statusDeleted => 'excluído';

  @override
  String get roleUser => 'usuário';

  @override
  String get loggedOut => 'Você saiu da sua conta.';

  @override
  String get searchCommunity => 'Buscar comunidade...';

  @override
  String get searchNoResults => 'Nenhum membro correspondente';
}
