# macOS GitIgnore

A comprehensive `.gitignore` file for macOS projects, designed to exclude common macOS-specific files and directories from your Git repositories.

## Overview

This project provides a curated `.gitignore` template that prevents macOS system files, caches, and temporary files from being committed to version control. These files are typically user-specific or system-generated and should not be tracked in your repositories.

## Features

- **System Files**: Excludes macOS metadata files like `.DS_Store`, `.AppleDouble`, `.LSOverride`
- **Thumbnail Cache**: Ignores thumbnail files (`._*`)
- **Volume Metadata**: Excludes volume-level files like `.DocumentRevisions-V100`, `.fseventsd`, `.Spotlight-V100`
- **Remote Share Artifacts**: Prevents AFP share directories from being tracked
- **Swift Build Artifacts**: Excludes `.swiftpm/`, `.build/`, and `Packages/` directories for Swift projects
- **Smart Installation**: The `install.sh` script intelligently merges rules with existing `.gitignore` files, preserving your custom rules

## Installation

### Quick Install

Run the following command in your terminal to add the macOS gitignore rules to your project's `.gitignore` file:

```bash
curl -fsSL https://raw.githubusercontent.com/marcgeld/macos.gitignore/refs/heads/main/install.sh | sh
```

This will:
1. Download the latest `.gitignore` rules from this repository
2. Create a `.gitignore` file if one doesn't exist
3. Append the rules to your existing `.gitignore` while:
   - Preserving your existing rules
   - Avoiding duplicate entries
   - Adding a comment to track the source

### Custom Target File

To install the rules into a custom filename (instead of `.gitignore`):

```bash
curl -fsSL https://raw.githubusercontent.com/marcgeld/macos.gitignore/refs/heads/main/install.sh | sh -s custom-gitignore.txt
```

### Requirements

- `curl` must be installed on your system (standard on macOS)
- `bash` or compatible shell

## What's Ignored

### macOS System Files
```
.DS_Store
.AppleDouble
.LSOverride
Icon
```

### Thumbnails
```
._*
```

### Volume-Level Files
```
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns
.com.apple.timemachine.donotpresent
```

### Network/Remote Share Files
```
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk
```

### Swift Package Manager
```
.swiftpm/
.build/
Packages/
```

## Usage

### For New Projects

1. Navigate to your project directory
2. Run the installation command above
3. Start your Git repository with `git init`

### For Existing Projects

1. Navigate to your project directory
2. Run the installation command
3. If rules were added, you may want to clean up previously tracked files:
   ```bash
   git rm -r --cached .
   git add .
   git commit -m "Apply macOS gitignore rules"
   ```

## Contributing

Contributions are welcome! If you find macOS-specific files that should be ignored but are missing from this list, please:

1. Fork this repository
2. Create a feature branch
3. Add the appropriate patterns to the `.gitignore` file
4. Update this README if necessary
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits

Created and maintained by [Marcus Gelderman](https://github.com/marcgeld).

## Related Projects

- [GitHub's official gitignore templates](https://github.com/github/gitignore)
- [gitignore.io](https://www.toptal.com/developers/gitignore) - Generate gitignore files for various platforms

---

*Inspired by the need for a clean, focused macOS-specific gitignore file that works seamlessly alongside project-specific rules.*
