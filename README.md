# netmass

## .NET mass installer

This repository now includes a one-click Windows installer that installs every stable .NET channel it can discover from Microsoft's release metadata.

### Files
- `install-all-dotnet.bat` - Double-click entrypoint for Windows users.
- `install-all-dotnet.ps1` - Main installer logic.

### How it works
1. Downloads `dotnet-install.ps1` from Microsoft if it is not already present.
2. Pulls the release index from Microsoft.
3. Installs the latest SDK for each stable channel.
4. Also installs the ASP.NET Core runtime and .NET runtime for each channel.

### Usage
- Double-click `install-all-dotnet.bat`
- Or run in Command Prompt:

```bat
install-all-dotnet.bat
```

### Optional PowerShell flags
If you run `install-all-dotnet.ps1` directly, these options are available:
- `-IncludePreviewChannels` include preview channels
- `-SkipSdk` skip SDK installation
- `-InstallAspNetRuntime` install ASP.NET runtime
- `-InstallDotnetRuntime` install .NET runtime
- `-Quiet` reduce output
