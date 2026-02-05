# Security Policy 🔐

Thanks for helping keep **netmass** safe! This document explains what versions we support and how to report security issues responsibly.

---

## ✅ Supported Versions

Security fixes are provided for the following:

| Version | Supported |
|--------|-----------|
| `main` (default branch) | ✅ |
| Latest GitHub Release | ✅ |
| Older releases | ❌ |

> Tip: If you’re on an older release, please upgrade and retest before reporting.

---

## 🚨 Reporting a Vulnerability

### ✅ Preferred method (private)
Please use **GitHub private vulnerability reporting**:

1. Go to this repository’s **Security** tab  
2. Click **Report a vulnerability**  
3. Fill out the advisory form with as much detail as possible

### If you can’t use private reporting
If private reporting is not available in your case, **do not** open a public issue with exploit details.  
Instead, open a minimal public issue that says:

> “I have a security report. How can I contact the maintainers privately?”

…and we’ll reply with a private channel.

---

## 🧾 What to include in your report

Please include:

- A clear description of the vulnerability and impact
- Steps to reproduce (or a minimal proof-of-concept)
- Affected OS/PowerShell version
- Output of:
  - `dotnet --info`
  - `dotnet --list-sdks`
  - `dotnet --list-runtimes`
- Any relevant logs (redact secrets/tokens)

If the issue is supply-chain related, include:
- The URL that was downloaded
- Hashes (`SHA256`) of any downloaded files if possible

---

## ⏱️ Response targets

- **Acknowledgement:** within **72 hours**
- **Status updates:** at least every **7 days** until resolution (or an agreed timeline)

---

## 🤝 Coordinated disclosure

Please keep reports **confidential** until we’ve shipped a fix and published an advisory.

If your report is accepted, we may:
- request an agreed **embargo window**
- publish a **GitHub Security Advisory** crediting you (if you want)

---

## 🚫 Out of scope

These reports are **out of scope** for this repository:

- Vulnerabilities in **.NET itself**, Microsoft installers, or Microsoft services  
  (please report those to Microsoft’s official security channels)
- Social engineering, phishing, or physical attacks
- Denial-of-service reports that rely on excessive traffic against third-party endpoints

---

## ✅ Safe harbor

We support good-faith security research and coordinated disclosure.
Please avoid:
- privacy-invasive testing
- destructive payloads
- interrupting service for others

Thank you for reporting responsibly 💙
