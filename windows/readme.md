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

## IA

Configuração para desabilitar por completo as funções de IA no sistema:

1. `super+r` -> "regedit"
1. _Computador\HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows_
1. _botão direito_ -> Nova -> Chave -> "WindowsCopilot"
1. _botão direito_ -> Nova -> Valor DWORD -> "TurnOffWindowsCopilot"
1. _botão direito_ -> Modificar -> "1"

## Misc

Certificado digital:

- <https://manuais.soluti.com.br/certificado-a1-pj/instalando-o-certificado-digital/instalacao-windows>
- <https://youtu.be/aWqYiTAoDzw>
