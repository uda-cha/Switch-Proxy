$PROXYREG = [string]"Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings"
$PROXYENABLEREG = [string]"ProxyEnable"
$CURRENTPROXYSTATUS = [int]( Get-ItemProperty -Path ${PROXYREG} ).${PROXYENABLEREG}

if ( ${CURRENTPROXYSTATUS} -eq 0 )
  {
  Set-ItemProperty ${PROXYREG} -name ${PROXYENABLEREG} -value 1
  if ( $? )
    {
    Write-Output "Proxyを有効にしました。ブラウザの再起動が必要です。"
    } else {
    Write-Output "Proxyの有効化に失敗しました。"
    }
  } else {
  Set-ItemProperty ${PROXYREG} -name ${PROXYENABLEREG} -value 0
  if ( $? )
    {
    Write-Output "Proxyを無効にしました。ブラウザの再起動が必要です。"
    } else {
    Write-Output "Proxyの無効化に失敗しました。"
    }
  }
Read-Host "Prease Press the Enter key..."