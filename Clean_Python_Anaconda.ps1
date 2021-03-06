$cleanpython = $true
$cleanpythonVariables = $true

# Custom function to clean python & anaconda variables
if ($cleanpythonVariables) {
    $allenv = (Get-ChildItem -Path Env:).name
    foreach ($item in $allenv) {
        if ($item -like "*Python*") {
            Write-Output '*****************************'
            $item
            [Environment]::SetEnvironmentVariable($item, $null, "Machine")
            [Environment]::SetEnvironmentVariable($item, $null, "User")
            Write-Output '*****************************'
            Write-Output ''
        }
    }
}

# Custom function to clean python & anaconda from the "Path" variable and remove dulpication
$profiles = ("User", "Machine")
foreach ($profile in $profiles) {
    $old_env = [Environment]::GetEnvironmentVariable("PATH", $profile)
    if ($old_env -eq $null) {
        Write-Output '*****************************'
        Write-Output "$profile ENVIRONMENT IS NULL"
        Write-Output '*****************************'
        Write-Output ''
    }
    else {
        $old_env = [System.Collections.ArrayList]$old_env.split(';')
        $old_env_count1 = $old_env.Count
        $old_env = $old_env | select -Unique
        $new_env = New-Object System.Collections.ArrayList
        $profilex = $profile.Trim('"')


        foreach ($item in $old_env) {
            if ($cleanpython) {
                if ($item -like "*Python*") {
                    #            $new_env = $new_env + $item
                }
                else {
                    $new_env = $new_env + $item
                }
            }
            else {
                $new_env = $new_env + $item
            }
        }


        if ($new_env.count -eq $old_env.Count) {
            Write-Output '*****************************'
            Write-Output "PROFILE: $profile"
            $old_env_count2 = $old_env.Count
            $old_env = $old_env -join ';'
            [System.Environment]::SetEnvironmentVariable('Path', $old_env, [System.EnvironmentVariableTarget]::$profilex)
            Write-Output 'Changes: Duplicates checked'
            Write-Output "TOTAL NUMBER BEFORE CLEANING: $old_env_count1"
            Write-Output "TOTAL NUMBER AFTER CLEANING: $old_env_count2"
            Write-Output '*****************************'
            Write-Output ''
        }
        else {
            $new_env_count = $new_env.Count
            $new_env = $new_env -join ';'
            Write-Output '*****************************'
            Write-Output "PROFILE: $profile"
            [System.Environment]::SetEnvironmentVariable('Path', $new_env, [System.EnvironmentVariableTarget]::$profilex)
            Write-Output 'Changes: Duplicates checked + removed old Python and Anaconda from the Path variable'
            Write-Output "TOTAL NUMBER BEFORE CLEANING: $old_env_count1"
            Write-Output "TOTAL NUMBER AFTER CLEANING: $new_env_count"
            Write-Output '*****************************'
            Write-Output ''
        }
    }
}