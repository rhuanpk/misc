# Windows Notes

Notas gerais a respeito do Windows.

## Otimização

Lista de coisas a se fazer para otimizar o Windows (num pós-install por exemplo):

- Atualizar drivers da placa mãe
- Atualizar drivers da placa de vídeo
- Atualizar o sistema (Windows update)
- Menu -> "aplicativos em segundo plano" -> _desabilite os apps desejados_
- Menu -> "cmd" -> Executar como administrador -> "powercfg /h off"
- Painel de controle -> Hardware e sons -> Opções de energia -> Melhor desempenho
- Configurações -> Jogos -> Modo de jogo -> Desativar
- Configurações -> Jogos -> Modo de jogo -> Elementos gráficos -> _adicione os apps desejados_
- Configurações -> Personalização -> ...
- Windows update -> Opções avançadas -> Otimização de entrega -> Permitir downloads de outros computadores -> Desativado
- `super+r` -> "sysdm.cpl" -> Avançado -> Configurações (desempenho) -> Melhor desempenho
- `ctrl+shift+esc` -> Inicialização -> _desabilite os apps desejados_
- `super+r` -> "taskschd.msc" -> _biblioteca/microsoft/windows/maintenance/_ -> WinSAT -> _botão direito_ -> Desabilitar
- `super+r` -> "msconfig" -> Serviços -> Ocultar serviços microsoft -> _desabilite os serviços desejados_
- `super+r` -> "taskschd.msc" -> _biblioteca/_ -> _desabilite os serviços desejados_
- _**botão direito do mouse** no **menu iniciar**_ -> Gerenciador de dispositivos -> Dispositivos de sistema -> Timer de eventos de alta precisão -> _botão direito_ -> Desabilitar dispositivo
