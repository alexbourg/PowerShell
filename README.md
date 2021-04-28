# Windows Environment Variables

The PS scripts will remove duplicate variables, also will clean python variables if enabled.


<br/><br/>
### To clean all python and anaconda variables, will also remove duplicates:
Run Clean_Python_Anaconda.bat

<br/><br/>

### To remove duplicate variables:
Run Remove_Duplicates_Only.bat


https://www.techthoughts.info/powershell-errors-and-exceptions-handling/



Invoke-WebRequest https://codeload.github.com/alexbourg/test/zip/refs/heads/main -Proxy ([System.Net.WebRequest]::GetSystemWebproxy()).GetProxy('https://codeload.github.com/alexbourg/test/zip/refs/heads/main') -ProxyUseDefaultCredentials -OutFile C:\Program64\Python\temp\Python_LocalPIP.zip