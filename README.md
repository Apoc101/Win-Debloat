
# Win-Debloater

Script to remove some telemetry and other data collection options in Windows 10/11, for privacy control or setting up a fresh Windows install.

Its focus is being lightweight and non-overwhelming.

## Features

- Cortana toggle
- Compatibility Telemetry toggle
- Activity history toggle
- Location services toggle
- Storage Sense toggle
- Enhance Pointer Precision toggle
- Hybernation toggle


## Acknowledgements

 - Always make a [restore point](https://answers.microsoft.com/en-us/windows/forum/all/discussion-how-to-create-a-system-restore-point/91aada34-ae98-4007-a19b-15ce6edb41bd) before running software like this
 - I do *NOT* take responsibility for what could happen to your Windows install, run at your own risk!
 - I strongly recommend researching what each toggle/function does before using the script, although none will significantly impact your PC (except for hybernation on laptops)


## How to run

There are 2 different methods of running this script, listed here:

#### Method #1

 1. Download the release on the right side on the Repository
 2. Extract the .zip in your desired location
 3. Open a Command Prompt window as Administrator
 4. Navigate to the directory where the extracted files are - e.g. `cd C:\Users\your-user\Downloads\Win-Debloater`
 5. When you're in the correct directory, simply type `debloater.cmd` to run the script


#### Method #2

 1. Download the release on the right side of the Repository
 2. Extract the .zip in your desired location
 3. Right-click `debloater.cmd` and press "Run as Administrator"


## FAQ

#### Why does the script need Administrative rights to run?

Because of the way the script is written, it directly makes edits to the Registry so that Microsoft can't revert the changes through a Windows Update; the only way this can be done is with Administrative priviledges.

If you're uncomfortable with this, feel free to look within the [source code](https://github.com/Apoc101/Win-Debloater/blob/main/debloater.cmd) and change the Registry values under your own supervision.

#### Why can Compatibility Telemetry only be enabled partially?

While deleting the Telemetry, some services that are in charge of delivering the Telemetry to Microsoft are deleted to ensure full privacy; this makes it so that fully re-enabling these services is virtually impossible without a fresh Windows install.

#### Why is disabling Hybernation not recommended for Laptop users?

Hybernation is critical to maintaining a laptop's battery charge by automatically "putting it to sleep" after a certain amount of time that it's inactive. Disabling this will drastically reduce the usable charge on a laptop.

#### What do I do if I found a bug or have a question?

Open a case [here](https://github.com/Apoc101/Win-Debloater/issues)!
