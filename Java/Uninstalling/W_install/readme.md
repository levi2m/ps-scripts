# :computer: Java Version Management Script :coffee:

This is a PowerShell script for managing Java Runtime Environment (JRE) versions on Windows computers. It can be used to ensure that only the latest version of JRE is installed, and older versions are uninstalled.

## :gear: Features

- Automatically installs JRE 8 Update 361 if no JRE is detected on the system.
- Uninstalls all older JRE versions, keeping only the newest version.
- Verifies that the newest version of JRE is correctly installed.
- Returns an exit code to Intune, allowing it to track the success or failure of the script.
- Runs silently, without showing any prompts or notifications to the user.
- Creates a log file if the JRE 8 Update 361 installation fails.
- Uses plenty of emojis to make it more fun! :partying_face:

## :rocket: Getting Started

1. Download the script and save it as a .ps1 file.
2. Upload the script to your Intune portal.
3. Create a new Intune policy to run the script on your Windows devices.
4. Configure the policy to run the script silently, without user interaction.
5. Enjoy the benefits of automatically managing your JRE versions! :sunglasses:

## :warning: Notes

- This script is designed for use on Windows computers only.
- The script requires administrative privileges to install and uninstall JRE versions.
- The script will download and install JRE 8 Update 361 if no JRE versions are detected on the system. If you prefer a different version, you can modify the script to download and install a different version.
- If the JRE 8 Update 361 installation fails, the script will create a log file in the system's temp folder. The log file can be used to diagnose the issue.
- The script does not check for or manage Java Development Kit (JDK) versions.

## :handshake: Contributing

If you find a bug or have a suggestion for improving the script, please feel free to create an issue or pull request on GitHub. We welcome contributions from the community! :muscle:

## :memo: License

This script is released under the MIT license. See the LICENSE file for more details.

---

Thanks for using our Java Version Management Script! :pray: If you have any questions or feedback, don't hesitate to contact us. Happy scripting! :tada:
