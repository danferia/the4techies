---
title: "Amazon Point Domain"
date: 2021-12-10
draft: false
tags: ["markdown", "GitHub", "website"]
categories: ["hugo", "base16"]
---
<h1> How to link Domain to Amazon Web Services.. </h1>

Amazon Web Services (AWS) is a cloud computing platform that provides customers with a wide array of cloud services. It offers computing power, database storage, content delivery, and other functionalities.

This will show you how to point your Namecheap domain name to AWS.

First, you will need to point nameservers in your AWS account and create a hosted zone for your Namecheap domain. Once you’ve finished, follow these steps:

1. Sign in to your Namecheap account.

2. Find Domain List from the left sidebar and click on the Manage button next to your domain name:

  ![D4](https://github.com/danferia/the4techies/blob/main/D4.PNG?raw=true "D4")
  
3. Select the Custom DNS option from the drop-down for Nameservers and enter your 4 Custom nameservers (from your AWS account) into the fields given. Once entered, make sure you click on the green checkmark to save the changes:

![D5](https://github.com/danferia/the4techies/blob/main/D5.PNG?raw=true "D5")

<h2> NOTE: You should enter each server on its own line. If you run out of lines, click Add Nameserver at the bottom of the list. </h2>

Allow 24-48 hours for DNS propagation to take effect.