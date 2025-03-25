# Dotfiles

Welcome to my dotfiles repository! This repository contains my personal configuration files for setting up a development environment. It includes configurations for bash and other tools to enhance productivity and streamline workflows.

## Table of Contents

- [Dotfiles](#dotfiles)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Setup Instructions](#setup-instructions)
    - [Step 1: Clone the Repository](#step-1-clone-the-repository)
    - [Step 2: Create a Symlink](#step-2-create-a-symlink)
    - [Step 3: Customize and Commit Changes (Optional)](#step-3-customize-and-commit-changes-optional)
    - [Step 4: Pull Updates from Remote Repository (Optional)](#step-4-pull-updates-from-remote-repository-optional)
  - [Features](#features)
  - [Contributing](#contributing)
  - [License](#license)

## Introduction

Dotfiles are plain text configuration files on Unix-y systems for customizing the system's behavior. This repository contains my personal dotfiles, including configurations for bash and other tools. By version-controlling these files, I can easily set up a new system with my preferred settings and share them with others.

## Setup Instructions

### Step 1: Clone the Repository

To get started, clone this repository to your home directory:

```bash
git clone https://github.com/ibrahimmansur4/dotfiles.git ~/dotfiles
```

### Step 2: Create a Symlink

Next, create a symlink to the version-controlled `.bashrc` file and reload the configuration:

```bash
# Backup existing .bashrc
mv ~/.bashrc ~/.bashrc.backup

# Create symlink to version-controlled file
ln -s ~/dotfiles/bashrc ~/.bashrc

# Reload configuration
source ~/.bashrc
```

### Step 3: Customize and Commit Changes (Optional)

Feel free to customize the configurations to suit your needs. After making changes, you can commit and push them to the remote repository:

```bash
# Make changes to your bashrc or other dotfiles
nano ~/dotfiles/bashrc

# Commit and push changes
cd ~/dotfiles
git add bashrc
git commit -m "Updated bash configuration"
git push origin main
```

### Step 4: Pull Updates from Remote Repository (Optional)

To keep your local dotfiles up to date with the remote repository, pull the latest changes:

```bash
cd ~/dotfiles
git pull origin main

# Reload configuration if there are updates
source ~/.bashrc
```

## Features

- **Bash Configuration**: Custom `.bashrc` with useful aliases, functions, and prompt settings.
- **Git Aliases**: Shortcuts for common git commands to improve workflow.
- **Color Support**: Enhanced color support for various commands to improve readability.
- **History Management**: Improved history settings for better command recall.

## Contributing

Contributions are welcome! If you have any improvements or suggestions, feel free to open an issue or submit a pull request.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
