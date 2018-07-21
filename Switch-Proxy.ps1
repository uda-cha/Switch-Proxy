$PROXYREG = [string]"Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings"
$PROXYENABLEREG = [string]"ProxyEnable"
$CURRENTPROXYSTATUS = [int]( Get-ItemProperty -Path ${PROXYREG} ).${PROXYENABLEREG}

if ( ${CURRENTPROXYSTATUS} -eq 0 )
  {
  Set-ItemProperty ${PROXYREG} -name ${PROXYENABLEREG} -value 1
  if ( $? )
    {
    Write-Output "Proxy��L���ɂ��܂����B�u���E�U�̍ċN�����K�v�ł��B"
    } else {
    Write-Output "Proxy�̗L�����Ɏ��s���܂����B"
    }
  } else {
  Set-ItemProperty ${PROXYREG} -name ${PROXYENABLEREG} -value 0
  if ( $? )
    {
    Write-Output "Proxy�𖳌��ɂ��܂����B�u���E�U�̍ċN�����K�v�ł��B"
    } else {
    Write-Output "Proxy�̖������Ɏ��s���܂����B"
    }
  }
Read-Host "Prease Press the Enter key..."