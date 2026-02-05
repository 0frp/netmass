````md
# netmass 🧰⚡
<!-- ✅ 0frp/netmass -->

[![Release](https://img.shields.io/github/v/release/0frp/netmass?display_name=tag&sort=semver)](https://github.com/0frp/netmass/releases)
[![Downloads](https://img.shields.io/github/downloads/0frp/netmass/total)](https://github.com/0frp/netmass/releases)
[![CI](https://img.shields.io/github/actions/workflow/status/0frp/netmass/ci.yml?label=ci)](https://github.com/0frp/netmass/actions)
[![License](https://img.shields.io/github/license/0frp/netmass)](./LICENSE)
[![Stars](https://img.shields.io/github/stars/0frp/netmass?style=flat)](https://github.com/0frp/netmass/stargazers)

## ✅ .NET mass installer (Windows)

`netmass` is a one-click Windows installer that installs the **latest patch of every stable .NET channel** it can discover from Microsoft’s official **release metadata**.

It can also install the matching **.NET Runtime** and **ASP.NET Core Runtime** per channel.

> ⚠️ Heads up: installing many channels can consume **multiple GB** of disk space and take a while.

---

## ✨ Features

- 🧠 Automatically discovers channels from Microsoft release metadata (`releases-index.json`)
- 🧩 Installs the **latest stable SDK** for each channel
- 🌐 Optional installation of **ASP.NET Core Runtime** + **.NET Runtime**
- 🔁 Supports preview channels (optional)
- 🤫 Quiet mode for CI / scripting

---

## 📦 Repository files

- **`install-all-dotnet.bat`** — double-click entrypoint for Windows users
- **`install-all-dotnet.ps1`** — main installer logic (PowerShell)

---

## 🧾 Minimum requirements (specs)

### ✅ Supported environment
- **OS:** Windows **with support for the .NET channels you install** (newer channels require newer Windows).  
- **PowerShell:** **Windows PowerShell 5.1+** *or* **PowerShell 7+** (recommended)
- **Architecture:** x64 recommended (Arm64 should work if the channel supports it)
- **Network:** Internet access to Microsoft endpoints
- **Permissions:** **No admin required** for default (per-user) installs

### ⚠️ Notes on install method
This project uses Microsoft’s `dotnet-install.ps1`, which is primarily intended for CI-style installs (non-admin, no registry writes).  
For a full dev machine install, Microsoft generally recommends using official installers.

---

## 🚀 Quick start

### ✅ One-click (recommended)
1. Download the repo as a ZIP (or clone it)
2. Double-click: **`install-all-dotnet.bat`**

### 🖥️ Command Prompt
```bat
install-all-dotnet.bat
````

### 🟦 PowerShell (advanced)

```powershell
.\install-all-dotnet.ps1
```

---

## ⚙️ Optional PowerShell flags

When running `install-all-dotnet.ps1` directly:

* `-IncludePreviewChannels` ➜ include preview/RC channels
* `-SkipSdk` ➜ skip SDK installation
* `-InstallAspNetRuntime` ➜ install ASP.NET Core runtime
* `-InstallDotnetRuntime` ➜ install .NET runtime
* `-Quiet` ➜ reduce output

Example:

```powershell
.\install-all-dotnet.ps1 -InstallAspNetRuntime -InstallDotnetRuntime -Quiet
```

---

## 🧠 How it works

1. Downloads Microsoft’s official `dotnet-install.ps1` if it isn’t already present.
2. Pulls the .NET release index from Microsoft release metadata.
3. Finds the latest stable version per channel.
4. Installs:

   * ✅ SDK (default), plus optionally
   * 🌐 ASP.NET Core runtime
   * 🧱 .NET runtime

---

## 📍 Where does it install?

Because this uses `dotnet-install.ps1`, installs are typically **per-user**:

* **Default install directory (Windows):**
  `%LocalAppData%\Microsoft\dotnet`

### PATH behavior (important)

`dotnet-install.ps1` can add the install folder to the **current session PATH**, but it does **not** permanently update your user/system PATH.

✅ Recommended: add to User PATH yourself (once):

* Add this folder:
  `%LocalAppData%\Microsoft\dotnet`

---

## ✅ Verify installation

List installed SDKs:

```powershell
dotnet --list-sdks
```

List installed runtimes:

```powershell
dotnet --list-runtimes
```

See environment details:

```powershell
dotnet --info
```

Check if any versions are out-of-support (SDK 6+):

```powershell
dotnet sdk check
```

---

## 🧹 Uninstall / cleanup

Because installs are file-based (not MSI registry installs), cleanup is straightforward:

1. Delete the install directory:

   * `%LocalAppData%\Microsoft\dotnet`
2. Remove that folder from your **User PATH** (if you added it)
3. Open a new terminal and confirm:

```powershell
where dotnet
dotnet --info
```

---

## 🛠️ Troubleshooting

### “dotnet is not recognized…”

* Add `%LocalAppData%\Microsoft\dotnet` to your User PATH and restart the terminal.

### Multiple dotnet.exe found

```powershell
where.exe dotnet
```

If you have both system-wide and per-user installs, PATH order matters.

### Proxy environments

Microsoft’s install script supports proxy flags (like `-ProxyAddress`).
If you're behind a corporate proxy, you may need to run with the appropriate proxy settings.

---

## 🧪 Telemetry

.NET may collect telemetry by default. You can opt out by setting:

* `DOTNET_CLI_TELEMETRY_OPTOUT=1`

---

## ✅ Security & provenance

### 🔎 VirusTotal reports (point-in-time)

At the time of scanning, these reports show **no detections**:

* [https://www.virustotal.com/gui/file/a7f70f7ab5f56e6d50837be3f15d74b0266e00966be53ff775377e2e3058a43a](https://www.virustotal.com/gui/file/a7f70f7ab5f56e6d50837be3f15d74b0266e00966be53ff775377e2e3058a43a)
* [https://www.virustotal.com/gui/file/ce5330422f1d3e9b3d46462a24ef7105f660ec6c67ef3f5d4ae05b7259fb4234](https://www.virustotal.com/gui/file/ce5330422f1d3e9b3d46462a24ef7105f660ec6c67ef3f5d4ae05b7259fb4234)

### 🏷️ Origin of downloads

Install payloads are retrieved from **Microsoft-owned distribution endpoints** (Microsoft infrastructure, not third-party file hosts).


You can verify file hashes:

```powershell
Get-FileHash .\install-all-dotnet.ps1 -Algorithm SHA256
```

If you download any standalone Microsoft installers separately, you can also check signatures:

```powershell
Get-AuthenticodeSignature .\SomeMicrosoftInstaller.exe
```

> ⚠️ Important: Security scans are not a guarantee. Always re-scan if you want maximum assurance.

---

## 🔄 Update policy

* Updated when Microsoft release metadata / tooling behavior changes
* Not tied to Windows monthly cumulative/security updates

---


---

## 🤝 Contributing

PRs welcome:

* bug fixes 🐛
* better channel filtering 🧠
* improved logging / progress output 📈
* documentation improvements 📝

---



---

## ⚠️ Disclaimer

This project is provided “as-is”, without warranty of any kind.
It is **not affiliated with or endorsed by Microsoft**. Use at your own risk.

```


```
