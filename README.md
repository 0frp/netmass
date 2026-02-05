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

---

## ✅ Security & Provenance

All files in this repository have been checked with **VirusTotal**. At the time of scanning, the reports show **no detections**.

**Source:** These installers are obtained from **official Microsoft distribution endpoints (`microsoft.com`)** — no third-party hosts.

### VirusTotal reports
- https://www.virustotal.com/gui/file/a7f70f7ab5f56e6d50837be3f15d74b0266e00966be53ff775377e2e3058a43a
- https://www.virustotal.com/gui/file/ce5330422f1d3e9b3d46462a24ef7105f660ec6c67ef3f5d4ae05b7259fb4234

## 🔄 Update policy

Files are updated **per Windows feature release** (e.g., 23H2 → 24H2).  
Each “release” here corresponds to the latest finalized files available at that time.

> Note: This does **not** include ongoing Windows cumulative/security updates (monthly patches).

## 🛡️ Important note

Even with clean VirusTotal results, you should always:
- re-scan on your own system if you want extra assurance

These files are provided for convenience and are used **at your own risk**.

---
