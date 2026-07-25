@echo off
chcp 65001 >nul
echo.
echo ========================================
echo  CSGN — Deploy no servidor (HostGator)
echo ========================================
echo.
echo Este script abre o terminal do cPanel para voce rodar 2 comandos no servidor.
echo.
echo Copie e cole cada linha abaixo no terminal do cPanel:
echo.
echo   git -C /home2/elgor248/csgn-deploy pull origin main
echo.
echo   rsync -a --exclude='.git' /home2/elgor248/csgn-deploy/ /home2/elgor248/csgestaoenegocios.com.br/
echo.
echo Abrindo o cPanel agora...
echo.
start "" "https://br542.hostgator.com.br:2083"
pause
