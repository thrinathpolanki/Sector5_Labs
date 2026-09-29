<div align="center">

# 🛠️ Experiment 1(a) - Install Flutter and Dart SDK

</div>

[![](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)

# 🎯 Aim

To install and configure the Flutter SDK and Dart SDK for developing Flutter applications.

[![](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)

# 📝 Description

## 📋 Requirements

| # | Requirement |
|---|-------------|
| 1️⃣ | Computer running Windows, macOS or Linux |
| 2️⃣ | Internet connection |
| 3️⃣ | Git |
| 4️⃣ | VS Code or Android Studio |

```mermaid
flowchart LR
    A[Download Flutter SDK] --> B[Add Flutter to PATH]
    B --> C[Verify Installation]
    C --> D[Verify Dart]
    D --> E[Set Up IDE]
    E --> F[Create and Run Test Project]
```

## ⚙️ Procedure

### Step 1: Download Flutter SDK

1. Visit the official [Flutter installation page](https://docs.flutter.dev/get-started/install).
2. Select your operating system.
3. Download the latest Flutter SDK.
4. Extract the downloaded ZIP file to a suitable location, for example:

```text
C:\src\flutter
```

### Step 2: Add Flutter to PATH

On Windows, add the Flutter `bin` directory to the system PATH:

```text
C:\src\flutter\bin
```

This allows Flutter commands to be executed from the terminal.

### Step 3: Verify Flutter Installation

Open Command Prompt or PowerShell and run:

```bash
flutter --version
```

Then run:

```bash
flutter doctor
```

`flutter doctor` checks whether Flutter and its required development tools are correctly installed.

### Step 4: Install Dart

Dart is included with the Flutter SDK, so a separate Dart SDK installation is normally not required for Flutter development. Verify Dart using:

```bash
dart --version
```

### Step 5: Set Up an IDE

Install Visual Studio Code or Android Studio, then install the Flutter and Dart extensions/plugins.

### Step 6: Create a Test Project

```bash
flutter create my_app
cd my_app
flutter run
```

If the application launches successfully, Flutter and Dart have been installed correctly.

## ✅ Result

Flutter and Dart SDK were successfully installed and configured, and a sample Flutter application was created and executed successfully.

[![](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)

# 📤 Output

> ⚠️ **IMPORTANT:** No output file was supplied for this experiment. Add the screenshot(s) of `flutter --version`, `flutter doctor` and the running test app here.

![Output](output.png)

[![](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)
