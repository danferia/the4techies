<h1> Installing Hugo on Windows </h1> 
This tutorial aims to be a complete guide to installing Hugo on your Windows computer.

Assumptions
We’ll call your website example.com for the purpose of this tutorial.
You will use C:\Hugo\Sites as the starting point for your site.
You will use C:\Hugo\bin to store executable files.
Setup Your Directories
You’ll need a place to store the Hugo executable, your content (the files that you build), and the generated files (the HTML that Hugo builds for you).

Open Windows Explorer.
Create a new folder: C:\Hugo (assuming you want Hugo on your C drive – it can go anywhere.)
Create a subfolder in the Hugo folder: C:\Hugo\bin.
Create another subfolder in Hugo: C:\Hugo\Sites.
Technical users
Download the latest zipped Hugo executable from the Hugo Releases page.
Extract all contents to your ..\Hugo\bin folder.
The hugo executable will be named as hugo_hugo-version_platform_arch.exe. Rename that executable to hugo.exe for ease of use.
In PowerShell or your preferred CLI, add the hugo.exe executable to your PATH by navigating to C:\Hugo\bin (or the location of your hugo.exe file) and use the command set PATH=%PATH%;C:\Hugo\bin. If the hugo command does not work after a reboot, you may have to run the command prompt as administrator.
Less technical users
Go the Hugo Releases page.
The latest release is announced on top. Scroll to the bottom of the release announcement to see the downloads. They’re all ZIP files.
Find the Windows files near the bottom (they’re in alphabetical order, so Windows is last) – download either the 32-bit or 64-bit file depending on whether you have 32-bit or 64-bit Windows. (If you don’t know, see here.)
Move the ZIP file into your C:\Hugo\bin folder.
Double-click on the ZIP file and extract its contents. Be sure to extract the contents into the same C:\Hugo\bin folder – Windows will do this by default unless you tell it to extract somewhere else.
You should now have three new files: hugo executable (example: hugo_0.18_windows_amd64.exe), license.md, and readme.md. (you can delete the ZIP download now.). Rename that hugo executable (hugo_hugo-version_platform_arch.exe) to hugo.exe for ease of use.
Now add Hugo to your Windows PATH settings:

For Windows 10 users:
Right click on the Start button.
Click on System.
Click on Advanced System Settings on the left.
Click on the Environment Variables… button on the bottom.
In the User variables section, find the row that starts with PATH (PATH will be all caps).
Double-click on PATH.
Click the New… button.
Type in the folder where hugo.exe was extracted, which is C:\Hugo\bin if you went by the instructions above. The PATH entry should be the folder where Hugo lives, not the binary. Press Enter when you’re done typing.
Click OK at every window to exit.
