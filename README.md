# Chrome Browser Bloatware Removal

This repository will help to get rid of the garbage installed by your school (Windows Only)

## Installation

This installation guide is **ONLY FOR WINDOWS**!

There are 2 methods:

```
Batch Script (Automatic removal and re-add)
```
```
Registry Editing Files (Manual)
```

# Check the installation
To check that the installation was correctly modified, there are two ways of testing it.

### Chrome policies
To check to see if the changes took effect, try to go to [Chrome Policies](chrome://policy) to see if it works. (Manually type in "chrome://policy" if the link didn't work)

### Test using the blocked URL
Go to this link: [TEST](https://www.qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq.com) (https://www.qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq.com)

If the site shows a Google Chrome error page, it worked! If it tried to connect, or if your schools extension showed it blocked page, the patch didn't work. 

## Usage

This section is broken down into two sections:
> Automatic

> Manual

## Changes to your system

What this program will change to your computer is that it will:

Add **registry keys** under ```HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome```
and will add / remove them based on which option is chosen. 

### Here is what is changed to your policies

[Tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo) and [Dark Reader](https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh) are forced installed, and are used to replace all the bloatware that is typically installed. 

The policy ```ForceYouTubeRestrict``` is set to '0' which disables the policy. 

The URL blocklist is modified to only block "https://www.qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq.com". (This doesn't replace the GoGuardian, iBoss, etc blockpage, only the one native to Google Chrome) The error code given to the blocked page is "ERR_BLOCKED_BY_ADMINISTRATOR". Test the URL to see if the changes were done correctly. 

Correct should look like this:
![Correct](https://raw.githubusercontent.com/SteadyStatus21/Chrome-Bloatware-Removal/main/imgs/correct.PNG)

Incorrect:
![Incorrect](https://raw.githubusercontent.com/SteadyStatus21/Chrome-Bloatware-Removal/main/imgs/incorrect.PNG)

Finally, the ```ExtensionInstallBlocklist``` is set to block the extension with the ID '0' (which doesnt exist) and you can install anything else into your browser. 

### Automatic Installation
Download the batch script created for Windows (64-bit), as Windows is phasing 32-bit out, there is no 32-bit. 

Once downloaded, run the batch script as an administrator, as if you do not, the script will attempt to itself. 

You can choose to remove the bloatware, or add it back incase something happened. 

### Manual Installation
If you do not want to use the batch script above, then you can download the registry keys appropriately named in the files of this repository. Double click and accept that the registry will be modified. If something goes wrong, create a issue and I will fix the issues that may come up. 

## Screenshots
### Batch Script
![Batch script](https://raw.githubusercontent.com/SteadyStatus21/Chrome-Bloatware-Removal/main/imgs/batch_script.PNG)

### Registry file
![Regedit File](https://raw.githubusercontent.com/SteadyStatus21/Chrome-Bloatware-Removal/main/imgs/registry.PNG)

Please make sure to update tests as appropriate.

## License
I trust you all on GitHub, if you use this and clone the repo, please **please** credit me. This took me over a hour to go through the documentation of chrome enterprise to get. Support me and the other free creators out there :)

# Contact me
Feel free to contact me if you have any issues:

[Mail](mailto:ihatejessicathedumbass@gmail.com)
