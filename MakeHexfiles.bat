DEL BLHeli.#?		> nul
DEL Output\Hex\*.* /Q 	> nul
RMDIR Output\Hex 	> nul
DEL Output\*.* /Q 	> nul
RMDIR Output		> nul

CLS 
@ECHO off
@ECHO ***** BlHeli 批处理编译 V11.2         *****
@ECHO ***** 编译输出文件 MakeHex_Result.txt *****
@ECHO ***** CTRL-C 中止操作                 *****
Break ON
REM @pause

MKDIR Output
MKDIR Output\Hex
rem ***** adapt settings to your enviroment ****
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


SET BESCTYPE=Skywalker_20A_MULTI
SET BESC=93
@ECHO. >> MakeHex_Result.txt
@ECHO *****************************************************  >> MakeHex_Result.txt
@ECHO %BESCTYPE%  >> MakeHex_Result.txt
@ECHO *****************************************************  >> MakeHex_Result.txt
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) >> MakeHex_Result.txt 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) >> MakeHex_Result.txt 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF" >> MakeHex_Result.txt
COPY "Output\%BESCTYPE%_%Revision%.HEX" ".\*.*"  > nul
DEL "Output\%BESCTYPE%_%Revision%.HEX"           > nul
@ECHO *****************************************************  >> MakeHex_Result.txt
@ECHO %BESCTYPE%

SET BESCTYPE=Skywalker_40A_MULTI
SET BESC=96
@ECHO. >> MakeHex_Result.txt
@ECHO *****************************************************  >> MakeHex_Result.txt
@ECHO %BESCTYPE%  >> MakeHex_Result.txt
@ECHO *****************************************************  >> MakeHex_Result.txt
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) >> MakeHex_Result.txt 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) >> MakeHex_Result.txt 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF" >> MakeHex_Result.txt
COPY "Output\%BESCTYPE%_%Revision%.HEX" ".\*.*"  > nul
DEL "Output\%BESCTYPE%_%Revision%.HEX"           > nul
@ECHO *****************************************************  >> MakeHex_Result.txt
@ECHO %BESCTYPE%

SET BESCTYPE=Platinum_Pro_30A_MULTI
SET BESC=159
@ECHO. >> MakeHex_Result.txt
@ECHO *****************************************************  >> MakeHex_Result.txt
@ECHO %BESCTYPE%  >> MakeHex_Result.txt
@ECHO *****************************************************  >> MakeHex_Result.txt
%RaisonancePath%\Ride\bin\ma51.exe "BLHeli.asm" SET(BESC=%BESC%) OBJECT(Output\%BESCTYPE%_%Revision%.OBJ) DEBUG EP QUIET PIN(%SilabsPath%\MCU\Inc;%RaisonancePath%\Ride\inc;%RaisonancePath%\Ride\inc\51) >> MakeHex_Result.txt 
%RaisonancePath%\Ride\bin\lx51.exe "Output\%BESCTYPE%_%Revision%.OBJ"  TO(Output\%BESCTYPE%_%Revision%.OMF) RS(256) PL(68) PW(78) OUTPUTSUMMARY LIBPATH(%RaisonancePath%\Ride\lib\51) >> MakeHex_Result.txt 
%RaisonancePath%\Ride\bin\oh51.exe "Output\%BESCTYPE%_%Revision%.OMF" >> MakeHex_Result.txt
COPY "Output\%BESCTYPE%_%Revision%.HEX" ".\*.*"  > nul
DEL "Output\%BESCTYPE%_%Revision%.HEX"           > nul
@ECHO *****************************************************  >> MakeHex_Result.txt
@ECHO %BESCTYPE%

DEL Output\Hex\*.* /Q                            > nul
RMDIR Output\Hex                                 > nul
DEL Output\*.* /Q                                > nul
RMDIR Output                                     > nul

Start MakeHex_Result.txt