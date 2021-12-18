---
title: "Hugo on Windows"
date: 2021-12-12
draft: false
tags: ["markdown", "GitHub", "website"]
categories: ["hugo", "base16"]
---

<h1> Installing Hugo on Windows.. </h1> 

This tutorial aims to be a complete guide to installing Hugo on your Windows computer.


We’ll call your website example.com for the purpose of this tutorial. You will use C:\Hugo\Sites as the starting point for your site. You will use C:\Hugo\bin to store executable files.

Setup Your Directories
- You’ll need a place to store the Hugo executable, your content (the files that you build), and the generated files (the HTML that Hugo builds for you).

Open Windows Explorer.
- Create a new folder: C:\Hugo (assuming you want Hugo on your C drive – it can go anywhere.)
- Create a subfolder in the Hugo folder: C:\Hugo\bin.
- Create another subfolder in Hugo: C:\Hugo\Sites.

Technical users
- Download the latest zipped Hugo executable from the Hugo Releases page.
- Extract all contents to your ..\Hugo\bin folder.
- The hugo executable will be named as hugo_hugo-version_platform_arch.exe. Rename that executable to hugo.exe for ease of use.
- In PowerShell or your preferred CLI, add the hugo.exe executable to your PATH by navigating to C:\Hugo\bin (or the location of your hugo.exe file) and use the command set PATH=%PATH%;C:\Hugo\bin. If the hugo command does not work after a reboot, you may have to run the command prompt as administrator.

Now add Hugo to your Windows PATH settings:

For Windows 10 users:
- Right click on the Start button.
- Click on System.
- Click on Advanced System Settings on the left.
- Click on the Environment Variables… button on the bottom.
- In the User variables section, find the row that starts with PATH (PATH will be all caps).
- Double-click on PATH.
- Click the New… button.
- Type in the folder where hugo.exe was extracted, which is C:\Hugo\bin if you went by the instructions above. The PATH entry should be the folder where Hugo lives, not the binary. Press Enter when you’re done typing.
- Click OK at every window to exit.

