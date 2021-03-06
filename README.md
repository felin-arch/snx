# snx for osx
The goal of the project is to ease the pain of using snx on OSX. It's built on top of the official executable which is installed in the Homebrew Cellar. I extracted the steps from the official installer.

## Getting started
1. Install homebrew (http://brew.sh).
2. Add my tap using `brew tap felin-arch/brew`.
3. Install using `brew install snx`.
4. During the install it'll ask for 3 things, the `server` you will use it with, the `username` you will use, the name of the `keychain item` which holds the password.
5. Once installed initiate a manual connection to verify the certificate.
6. Upon the first usage of `cpup` you will need to enable it to access the Keychain item holding the password.

## What it does
* It installs the snx executable and sets the correct privileges (4775) on it. The setuid bit is required by snx. Brew defaults to 555. The 775 is needed to keep brew quiet.
* It installs the CAverify app under /etc/snx. This is required by the snx executable to remember the CA root.
* It installs 3 apps to the users Applications folder so they can be used from Spotlight: `cpup` to connect, `cpstat` to check the status, `cpdown` to disconnect (feel free to check the source of these using OSX's Automator app).

## Setting up the OSX Keychain item
1. Launch `Keychain Access` via Spotlight.
2. Select the `login` keychain and `Passwords` category.
3. Select the small `+` button on the bottom.
4. Fill in the name of the item. **This will need to match the one given during the install process!**
5. Set an account name and password. The account name is not used by the scripts.

## Dependencies
- terminal-notifier (also available via brew)

## Troubleshooting
- Make sure you can initiate a connection from the CLI (`snx -s [SERVER] -u [USERNAME]`).
- Make sure the Keychain item is accessible by the `security` binary.
- If all else fails, try to reinstall with `brew install snx`.
