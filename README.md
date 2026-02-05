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

-----

# All files included have been scanned for malware from VirusTotal. Links to each scan are below. We can 100% confirm you will not recieve a virus from downloading these files. All files are from microsoft.com, and no other third parties.
https://www.virustotal.com/gui/file/a7f70f7ab5f56e6d50837be3f15d74b0266e00966be53ff775377e2e3058a43a
https://www.virustotal.com/gui/file/ce5330422f1d3e9b3d46462a24ef7105f660ec6c67ef3f5d4ae05b7259fb4234
Files will be updated accordingly with each Windows release. Each release is final per the next windows release. **Not including Windows UPDATES**
