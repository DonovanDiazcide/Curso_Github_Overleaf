# Installation Guide
## Windows (English)

> **For**: Mauricio (and anyone with Windows in English)

> **Estimated time**: 45-60 minutes  
> **Your role**: Project Owner (Overleaf Premium)

---

## Checklist Summary

| Tool | Required | Verification |
|------|----------|--------------|
| GitHub Account | ✅ | Login at github.com |
| Git | ✅ | `git --version` |
| Visual Studio Code | ✅ | Opens from Start Menu |
| MiKTeX | ✅ | `pdflatex --version` |
| Strawberry Perl | ✅ | `perl --version` |
| LaTeX Workshop Extension | ✅ | Icon appears in VS Code |

---

## Step 1: GitHub Account (2 min)

1. Go to [github.com](https://github.com)
2. Click **"Sign up"** (top right)
3. Follow the registration process
4. **Important**: Remember your email — you'll need it for Git configuration

> 📖 Official source: [GitHub Docs - Creating an account](https://docs.github.com/en/get-started/signing-up-for-github/signing-up-for-a-new-github-account)

---

## Step 2: Git (10 min)

### Download and Install

1. Go to [git-scm.com/download/win](https://git-scm.com/download/win)
2. Download will start automatically
3. Run the installer (`Git-2.x.x-64-bit.exe`)

### Installation Options (Important!)

During installation, you'll see several screens. Here are the key options:

| Screen | Option to Select |
|--------|------------------|
| **Select Components** | Leave defaults |
| **Choosing the default editor** | Select "Use Visual Studio Code as Git's default editor" |
| **Adjusting your PATH** | ⚠️ Select **"Git from the command line and also from 3rd-party software"** |
| **Choosing SSH executable** | "Use bundled OpenSSH" |
| **Choosing HTTPS transport backend** | "Use the OpenSSL library" |
| **Configuring line ending conversions** | "Checkout Windows-style, commit Unix-style line endings" |
| **Configuring terminal emulator** | "Use MinTTY" |
| **Default behavior of git pull** | "Default (fast-forward or merge)" |
| **Choose a credential helper** | "Git Credential Manager" |
| **Extra options** | Leave defaults |

4. Click **Install** and wait for completion

### Verify Installation

Open **PowerShell** or **Command Prompt** (search "PowerShell" in Start Menu):

```
git --version
```

Expected output: `git version 2.43.0.windows.1` (or similar)

### Configure Git (Essential!)

Run these commands in PowerShell (replace with your info):

```bash
git config --global user.name "Mauricio"
git config --global user.email "your.email@example.com"
```

⚠️ **Use the same email as your GitHub account!**

Verify configuration:
```bash
git config --list
```

> 📖 Official source: [Git Book - Installing Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

---

## Step 3: Visual Studio Code (5 min)

### Download and Install

1. Go to [code.visualstudio.com](https://code.visualstudio.com/)
2. Click **"Download for Windows"**
3. Run the installer (`VSCodeUserSetup-x64-1.x.x.exe`)

### Installation Options

| Screen | Option to Select |
|--------|------------------|
| **License Agreement** | Accept |
| **Select Destination Location** | Leave default |
| **Select Start Menu Folder** | Leave default |
| **Select Additional Tasks** | ✅ Check **"Add to PATH"** |
| | ✅ Check "Add 'Open with Code' action to Windows Explorer file context menu" |
| | ✅ Check "Add 'Open with Code' action to Windows Explorer directory context menu" |

4. Click **Install**

### Verify Installation

**Option A - From Start Menu (graphical):**
- Click Start Menu → Type "Visual Studio Code" → Click the icon

**Option B - From terminal:**
- Open PowerShell and type:
```
code --version
```

> 📖 Official source: [VS Code Docs - Setup](https://code.visualstudio.com/docs/setup/setup-overview)

---

## Step 4: MiKTeX (15-20 min)

### Download and Install

1. Go to [miktex.org/download](https://miktex.org/download)
2. Click **"Download"** button for Windows
3. Run the installer (`basic-miktex-x.x.x-x64.exe`)

### Installation Options

| Screen | Option to Select |
|--------|------------------|
| **Copying conditions** | Accept |
| **Installation scope** | ⚠️ Select **"Install MiKTeX only for me"** |
| **Installation folder** | Leave default |
| **Settings** | ⚠️ Select **"Yes"** for "Install missing packages on-the-fly" |

4. Click **Start** and wait for installation

### Post-Installation Update (Important!)

1. Open **Start Menu** → Search **"MiKTeX Console"** → Open it
2. If prompted about updates, click **"Check for updates"**
3. Click **"Update now"** to install all updates

### Verify Installation

Open PowerShell:
```
pdflatex --version
```

Expected output: `MiKTeX-pdfTeX 4.x (MiKTeX 23.x)` (or similar)

> 📖 Official source: [MiKTeX Manual - Installation](https://miktex.org/howto/install-miktex)

---

## Step 5: Strawberry Perl (5 min)

### Why is this needed?

MiKTeX doesn't include Perl, but `latexmk` (used by LaTeX Workshop in VS Code) requires it.

> 📖 From LaTeX Workshop Wiki: *"MiKTeX is another lightweight distribution with a convenient automatic on-demand package install. Note, however, that for MiKTeX to work correctly with LaTeX Workshop, you need to install Perl."*

### Download and Install

1. Go to [strawberryperl.com](https://strawberryperl.com/)
2. Click the **"recommended version"** download link (64-bit)
3. Run the installer (`strawberry-perl-5.x.x.x-64bit.msi`)
4. Follow default options → Click **Install**

### Verify Installation

**⚠️ Close and reopen PowerShell**, then run:
```
perl --version
```

Expected output: `This is perl 5, version 38...` (or similar)

> 📖 Official source: [Strawberry Perl - About](https://strawberryperl.com/)

---

## Step 6: LaTeX Workshop Extension (2 min)

1. Open **Visual Studio Code**
2. Click the **Extensions icon** in the left sidebar (or press `Ctrl+Shift+X`)
3. In the search box, type: **"LaTeX Workshop"**
4. Find the extension by **James Yu** (should be the first result)
5. Click **Install**

### Verify Installation

- A **TeX icon** (looks like "TEX") should appear in the left sidebar
- When you open a `.tex` file, you'll see LaTeX-specific options

> 📖 Official source: [LaTeX Workshop - Marketplace](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)

---

## Final Verification Test (5 min)

### Create a test file

1. Open **Visual Studio Code**
2. Press `Ctrl+N` to create a new file
3. Press `Ctrl+S` to save, name it `test.tex`
4. Paste this content:

```latex
\documentclass{article}
\begin{document}
Hello, \LaTeX!

This is a test document for the workshop.
\end{document}
```

5. Press `Ctrl+S` to save

### Compile and View

- The document should compile **automatically** when you save
- To view the PDF: Press `Ctrl+Alt+V` or click the **magnifying glass icon** in the top right

### Expected Result

A PDF should appear with:
```
Hello, LATEX!
This is a test document for the workshop.
```

If you see this, **everything is ready!** 🎉

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| `git` command not found | Restart PowerShell, or reinstall Git with "Add to PATH" option |
| `pdflatex` not found | Restart computer, or add MiKTeX to PATH manually |
| `perl` not found | Restart PowerShell after installing Strawberry Perl |
| LaTeX doesn't compile in VS Code | Check MiKTeX Console for updates, restart VS Code |
| PDF doesn't appear | Wait a few seconds, or press `Ctrl+Alt+V` |

---

## What's Next?

As the **project owner**, you will:
1. Create the Overleaf project
2. Connect it to GitHub (Menu → GitHub → Create repository)
3. Share access with José Miguel and Rodrigo
4. Sync changes between Overleaf and GitHub

See you at the workshop! 🚀
