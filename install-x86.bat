@Echo off

echo.
echo ****************************************************************************
echo * Install
echo ****************************************************************************

cd /d %BUILD_PATH%
cd ..

IF NOT EXIST .\Dist\32 (
    echo.
    echo making Dist directory
    mkdir Dist\32
)
IF NOT EXIST .\Dist\32\Python2 (
    mkdir Dist\32\Python2
)
IF NOT "%LUX_BUILD_PYTHON3%" == "" (
  IF NOT EXIST .\Dist\32\Python3 (
    mkdir Dist\32\Python3
  )
)

cd Dist\32
set INSTALL_PATH="%CD%"

echo Copying luxrender.exe
copy "%BUILD_PATH%"\Projects\luxrender\Win32\LuxRender\luxrender.exe luxrender.exe
echo Copying luxconsole.exe
copy "%BUILD_PATH%"\Projects\luxrender\Win32\Console\luxconsole.exe luxconsole.exe
echo Copying luxmerger.exe
copy "%BUILD_PATH%"\Projects\luxrender\Win32\LuxMerge\luxmerger.exe luxmerger.exe
echo Copying Python 2 pylux.pyd
copy "%BUILD_PATH%"\Projects\luxrender\Win32\Pylux2Release\python2\pylux.pyd Python2\
IF NOT "%LUX_BUILD_PYTHON3%" == "" (
  echo Copying Python 3 pylux.pyd
  copy "%BUILD_PATH%"\Projects\luxrender\Win32\Pylux3Release\python3\pylux.pyd Python3\
)
echo Copying Qt DLL's
copy "%LUX_X86_QT_ROOT%"\bin\QtCore4.dll QtCore4.dll
copy "%LUX_X86_QT_ROOT%"\bin\QtGui4.dll QtGui4.dll
:: copy "%LUX_X86_QT_ROOT%\bin\QtOpenGL4.dll" QtOpenGL4.dll
echo Copying Visual C++ CRT DLL's
copy "%VCINSTALLDIR%"\redist\x86\Microsoft.VC90.CRT\Microsoft.VC90.CRT.manifest Microsoft.VC90.CRT.manifest
copy "%VCINSTALLDIR%"\redist\x86\Microsoft.VC90.CRT\msvcm90.dll msvcm90.dll
copy "%VCINSTALLDIR%"\redist\x86\Microsoft.VC90.CRT\msvcp90.dll msvcp90.dll
copy "%VCINSTALLDIR%"\redist\x86\Microsoft.VC90.CRT\msvcr90.dll msvcr90.dll

cd /d %BUILD_PATH%

echo.
echo 32 bit binaries are availabe for use in %INSTALL_PATH%
echo.