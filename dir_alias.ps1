$aliases = @{
  repo="C:\users\liam\source\repos";
  temp="C:\Users\liam\AppData\Local\Temp"
}

start-process explorer.exe -ArgumentList $aliases[$args[0]]
