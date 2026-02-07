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
| LaTeX Workshop Extension | ✅ | Icon appears in VS Code (though not necessarily) |

> **💡 Already have GitHub, Git, and VS Code?** Quickly verify by opening **PowerShell** and running:
> ```
> git --version
> code --version
> ```
> If both commands show a version and you can log in at [github.com](https://github.com), skip directly to **[Step 4: MiKTeX](#step-4-miktex-15-20-min)**!

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
| **Choosing the default editor** | Select "Use Visual Studio Code as Git's default editor" *(we'll install it in Step 3, but the option is saved for later)* |
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
2. **A message about updates may or may not appear**:
   - If it appears, click **"Yes"** (or "Check"), and then **install** the updates it offers
   - If it doesn't appear, don't worry — continue to the next point
3. **Either way** (whether the message appeared or not), click **"Updates"** on the left panel
4. Click **"Check for updates"**
5. If packages appear listed below, click **"Update now"** to install all updates

![MiKTeX Console showing available updates](miktex.png)

### Verify Installation

**⚠️ Close and reopen PowerShell** (so it picks up the new PATH), then run:
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
2. Click the **Extensions icon** in the left sidebar (the icon with 3 squares and a diamond, or press `Ctrl+Shift+X`)
3. In the search box, type: **"LaTeX Workshop"**
4. Find the extension by **James Yu** (should be the first result)
5. Click **Install**

### Verify Installation

Let's create a simple LaTeX file to check that everything works.

#### 1. Create the workshop folder

1. Open **File Explorer** (the folder icon on the taskbar, or press `Win + E`)
2. Navigate to your **Documents** folder, or to wherever you'd like to save this course
3. Right-click on an empty space → **New** → **Folder**
4. Name the folder **`curso_latex_github`**

> 💡 This folder will be your workspace throughout the entire workshop.

#### 2. Open the folder in VS Code

1. Open **Visual Studio Code**
2. Go to menu **File** → **Open Folder...**
3. Find and select the **`curso_latex_github`** folder you just created
4. Click **Select Folder**
   - If VS Code asks whether you trust the authors of the folder, click **"Yes, I trust the authors"**

#### 3. Create a test file

1. In the **left sidebar** of VS Code you'll see your folder name (`CURSO_LATEX_GITHUB`)
2. Hover your mouse over the folder name — small icons will appear
3. Click the **file icon with a "+"** (New File)
4. Type the name **`test.tex`** and press Enter
   - ⚠️ Make sure the name ends in `.tex`

#### 4. Write and compile

1. The file `test.tex` will open in the editor. Copy and paste the following content:

```latex
\documentclass{article}
\begin{document}
Hello, \LaTeX!

This is a test document for the workshop.
\end{document}
```

2. Press `Ctrl+S` to save
3. **Build**: Press `Ctrl+Alt+B`
   - ⚠️ **The first time** you compile a LaTeX file, you must use `Ctrl+Alt+B`. After this first build, the document will recompile **automatically** every time you save with `Ctrl+S`.
   - In the **bottom bar** of VS Code (the blue bar at the bottom) you'll see a spinning icon — this means LaTeX is building your document. **Wait a few seconds** until it finishes before continuing.
4. **View the PDF**: Once the bottom bar stops showing activity, press `Ctrl+Alt+V` or click the **magnifying glass icon** in the top right

#### 5. Hide auxiliary files (optional but recommended)

When compiling, LaTeX generates several auxiliary files (`.aux`, `.log`, `.fls`, etc.) that will clutter your file explorer in VS Code. To hide them **across all your LaTeX projects** (not just this folder):

1. In VS Code, go to the menu **Terminal** → **New Terminal** — a terminal will open at the bottom of VS Code
2. Copy and paste the following command and press **Enter**:

```powershell
$p="$env:APPDATA\Code\User\settings.json"; $s=Get-Content $p -Raw|ConvertFrom-Json; if(-not $s.'files.exclude'){$s|Add-Member -NotePropertyName 'files.exclude' -NotePropertyValue ([PSCustomObject]@{})}; @('**/*.aux','**/*.log','**/*.out','**/*.toc','**/*.synctex.gz','**/*.fls','**/*.fdb_latexmk','**/*.bbl','**/*.blg')|ForEach-Object{$s.'files.exclude'|Add-Member -NotePropertyName $_ -NotePropertyValue $true -Force}; $s|ConvertTo-Json -Depth 4|Set-Content -Encoding UTF8 $p; Write-Host "Done - auxiliary files hidden in VS Code"
```

> 💡 This command modifies your **global VS Code settings**, so it works for any folder you open in the future — you don't need to run it again.
>
> If the command doesn't work or you prefer another way, you can copy this prompt into **ChatGPT** or any AI assistant:
>
> *"I need to hide LaTeX auxiliary files (.aux, .log, .out, .toc, .synctex.gz, .fls, .fdb_latexmk, .bbl, .blg) from VS Code's file explorer on Windows. Give me the steps to do it from VS Code settings."*

### Expected Result

A PDF should appear with:
```
Hello, LATEX!
This is a test document for the workshop.
```

If you see this, **everything is ready!** 🎉

> If it didn't work, don't worry — there's a step-by-step troubleshooting guide right below.

> **If the document doesn't compile** after 1-3 minutes:
> 1. Verify that the **LaTeX Workshop** extension by James Yu is installed in VS Code
> 2. Verify that **MiKTeX Console** has no pending updates
> 3. Restart VS Code and try again
> 4. Install the additional extensions shown in the screenshot below from the Extensions panel (the 3-squares-and-a-diamond icon in the left sidebar, or `Ctrl+Shift+X`). Then try compiling again with `Ctrl+Alt+B` and viewing the PDF with `Ctrl+Alt+V`:
>
> ![Recommended extensions for LaTeX in VS Code](image.png)
>
> After following these steps, **everything is ready!** 🎉

> 📖 Official source: [LaTeX Workshop - Marketplace](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)

---

## Official References

| Resource | URL |
|----------|-----|
| Git Download | [git-scm.com/download/win](https://git-scm.com/download/win) |
| Git Installation Guide | [git-scm.com/book/en/v2/Getting-Started-Installing-Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) |
| VS Code Setup | [code.visualstudio.com/docs/setup/setup-overview](https://code.visualstudio.com/docs/setup/setup-overview) |
| MiKTeX Installation | [miktex.org/howto/install-miktex](https://miktex.org/howto/install-miktex) |
| Strawberry Perl | [strawberryperl.com](https://strawberryperl.com/) |
| LaTeX Workshop | [marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) |
