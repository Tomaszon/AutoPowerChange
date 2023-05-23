echo %1
echo %2
echo %3

powershell start-process powershell -verb runas '%1'.Replace('apc://', '').Replace('{1}', '-guid %2').Replace('{2}', '-planName %3'.Trim('/'))