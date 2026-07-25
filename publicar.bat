@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo ========================================
echo  CSGN — Publicar alteracoes no site
echo ========================================
echo.

:: Verifica se tem arquivos alterados
git diff --quiet && git diff --cached --quiet
if %ERRORLEVEL%==0 (
    echo Nenhuma alteracao encontrada.
    echo Se quiser forcar o deploy no servidor, use: publicar-deploy.bat
    pause
    exit /b 0
)

:: Solicita mensagem de commit
set /p MSG="Descricao da alteracao (Enter para 'atualizacao'): "
if "%MSG%"=="" set MSG=atualizacao

:: Git: add, commit, push
echo.
echo [1/3] Adicionando arquivos...
git add -A

echo [2/3] Commitando: %MSG%
git commit -m "%MSG%"

echo [3/3] Enviando para o GitHub...
git push origin main

if %ERRORLEVEL%==0 (
    echo.
    echo OK — GitHub atualizado!
    echo.
    echo Agora execute o deploy no servidor:
    echo   publicar-deploy.bat
) else (
    echo.
    echo ERRO no push. Verifique sua conexao ou credenciais.
)

echo.
pause
