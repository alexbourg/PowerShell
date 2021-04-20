# Custom function to remove duplicates from the "Path" variable

$profiles = ("User", "Machine")
foreach ($profile in $profiles) {
    $old_env = [Environment]::GetEnvironmentVariable("PATH", $profile)
    if ($old_env -eq $null) {
        Write-Output "$profile ENVIRONMENT IS NULL"
        Write-Output '*****************************'
        Write-Output ''
    }
    else {
        $old_env = [System.Collections.ArrayList]$old_env.split(';')
        $old_env_count1 = $old_env.Count
        $old_env = $old_env | select -Unique
        $profilex = $profile.Trim('"')

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
}