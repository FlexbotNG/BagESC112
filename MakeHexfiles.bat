@ECHO off
@ECHO ***** BlHeli 批处理编译 V11.2         *****
@ECHO ***** 编译输出文件 MakeHex_Result.txt *****
@ECHO ***** CTRL-C 中止操作                 *****
Break ON
REM @pause

rem ***** adapt settings to your enviroment ****
DEL Output\Hex\*.* /Q
RMDIR Output\Hex
DEL Output\*.* /Q
RMDIR Output
MKDIR Output
MKDIR Output\Hex
SET Revision=Rev11_2
SET SilabsPath=C:\SiLabs
SET RaisonancePath=C:\Raisonance

@ECHO ***** Result of Batch file for BlHeli (from 4712) v.1.1       ***** > MakeHex_Result.txt
@ECHO Revision: %Revision% >> MakeHex_Result.txt
@ECHO Path for Silabs IDE: %SilabsPath% >> MakeHex_Result.txt
@ECHO Path for Raisonance IDE: %RaisonancePath% >> MakeHex_Result.txt
@ECHO Start compile >> MakeHex_Result.txt

@ECHO Revision: %Revision%
@ECHO Path for Silabs IDE: %SilabsPath%
@ECHO Path for Raisonance IDE: %RaisonancePath%
@ECHO Start compile .....

SET BESCTYPE=Platinum_Pro_30A_MULTI
SET BESC=159
@ECHO. >> MakeHex_Result.txt
@ECHO *****************************************************  >> MakeHex_Result.txt
@ECHO %BESCTYPE%  >> MakeHex_Result.txt
@ECHO *****************************************************  >> MakeHex_Result.txt
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) >> MakeHex_Result.txt 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) >> MakeHex_Result.txt 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF" >> MakeHex_Result.txt
copy "Output\%BESCTYPE%_%Revision%.HEX" "Output\Hex\*.*" > nul
del "Output\%BESCTYPE%_%Revision%.HEX" > nul
@ECHO *****************************************************  >> MakeHex_Result.txt
@ECHO %BESCTYPE%

Start MakeHex_Result.txt