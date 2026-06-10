; Script para clicar rapidamente nas teclas W (andar para frente) e S (andar para trás) enquanto pressionadas
; Botão lateral do mouse para pausar/iniciar o script

#MaxThreadsPerHotkey 2

Toggle := false ; Variável para controlar o estado de ativação do script

; Botão lateral do mouse (XButton1 ou XButton2) para iniciar/pausar
XButton1::
    Toggle := !Toggle  ; Alterna entre ativar/desativar o script
    if (Toggle) {
        Tooltip, Script Iniciado ; Exibe uma mensagem indicando que o script foi ativado
    } else {
        Tooltip, Script Pausado  ; Exibe uma mensagem indicando que o script foi pausado
    }
    SetTimer, RemoveTooltip, 1000  ; Remove a mensagem após 1 segundo
return

; Ação para a tecla W
~w::
    If (Toggle)  ; Verifica se o script está ativado
    {
        While GetKeyState("w", "P")  ; Verifica enquanto a tecla W estiver pressionada
        {
            Send, {w down}  ; Pressiona a tecla W
            Sleep, 0  ; Tempo entre os cliques, ajustável para rapidez
            Send, {w up}  ; Solta a tecla W
            Sleep, 0  ; Espera entre os cliques, ajustável para rapidez
        }
    }
return

; Ação para a tecla S
~s::
    If (Toggle)  ; Verifica se o script está ativado
    {
        While GetKeyState("s", "P")  ; Verifica enquanto a tecla S estiver pressionada
        {
            Send, {s down}  ; Pressiona a tecla S
            Sleep, 0  ; Tempo entre os cliques, ajustável para rapidez
            Send, {s up}  ; Solta a tecla S
            Sleep, 0  ; Espera entre os cliques, ajustável para rapidez
        }
    }
return

RemoveTooltip:
    Tooltip  ; Remove a mensagem de tooltip após 1 segundo
return