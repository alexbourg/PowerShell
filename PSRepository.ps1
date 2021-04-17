$parameters = @{
  Name               = "PSGallery1"
  SourceLocation     = "https://www.powershellgallery.com/api/v23"
  InstallationPolicy = 'Untrusted'
}
Register-PSRepository @parameters
Get-PSRepository