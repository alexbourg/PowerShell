# Tutorial - Environment variables:
#### This will help you to **add, append, or delete** environment variables using **PowerShell**. Admin rights is not required.
<br>

### To create a new variable:
```
[Environment]::SetEnvironmentVariable('JAVA_HOME', 'C:\Program Files\AdoptOpenJDK\jdk-8.0.282.8-hotspot', 'User')`
```

<br>
<br>

### To read an existing variable
```
[Environment]::GetEnvironmentVariable('Path', 'User')
```

<br>
<br>

### To append an existing variable:
```
$existing_variable = [Environment]::GetEnvironmentVariable('Path', 'User')
[Environment]::SetEnvironmentVariable('Path', $existing_variable + ';%JAVA_HOME%\bin', 'User')
```

<br>
<br>

### To delete an existing variable:
```
[Environment]::SetEnvironmentVariable('JAVA_HOME', $null, "User")
```
