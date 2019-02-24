$path=Read-Host "Enter an absolute path to the .pro file you want to statically copmile"
#Write-Host $path
#this gets us the path that the user specified, up to the final forward slash
$parentDir=Split-Path -Path $path
cd $parentDir
#this gets us the leaf name with no extension. if the input is "Z:\ChumStreamer\chumstreamer.pro", the output is "chumstreamer"
#this method doesn't work on 2012r2 for some reason
$projectNameLeaf=Split-Path -Leaf $path
$pos=$projectNameLeaf.IndexOf(".")
$projectName=$projectNameLeaf.Substring(0,$pos)
Write-Host "Changing directories to " + $parentDir + "..."
Write-Host "Running qmake.exe..."
C:\Qt\Static\5.5.0\bin\qmake.exe $projectNameLeaf -r -spec win32-g++ -o qtbuild-makefile
Write-Host "Setting up environment for Qt usage..."
#this is cmd.exe specific so we can't do it
#set PATH=C:\Qt\Qt5.5.0\5.5\mingw492_32\bin;C:\Qt\Qt5.5.0\Tools\mingw492_32\bin;%PATH%
$Env:path="C:\Qt\Qt5.5.0\5.5\mingw492_32\bin;C:\Qt\Qt5.5.0\Tools\mingw492_32\bin;%PATH%"

Write-Host "Compiling..."
C:\Qt\Qt5.5.0\Tools\mingw492_32\bin\mingw32-make -f qtbuild-makefile.Release
Write-Host "Packing..."
$string=$parentDir + "\release\" + $projectName + ".exe"
$outputFileName="C:\Users\Administrator\Desktop\" + $projectName + "-qtbuild.exe"
C:\Users\Administrator\Desktop\upx.exe $string -9 -o $outputFileName
Write-Host "Done! Wrote to $outputFileName"
