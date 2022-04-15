---
layout: post
title:  "Team Blog 9"
date:   April 14, 2022
categories: AWS Domain Hostname EC2
---

Domain names are a great way for people to uniquely identify internet services and resources. Many people assign these text-based labels as a way to easily memorize resources rather than the numerical addresses used in the Internet protocols.

This will be a guide to assist in assigning a unique domain to an EC2 instance hosting an API, personal website, etc.

**Note**: This guide will be keeping costs to a minimum so paid domains and domain registering on AWS Route 53 will not be used. Here is a [link][route-53] to getting started with Route 53, a great domain registering alternative for developers with a larger budget.

<h2>Getting a Free Domain</h2>

For those on a tight budget or just simply starting to learn about domains, there are plenty of ways to acquire a domain for free. This guide will be using [Freenom.com][free-nom], a popular free domain server. 

Once you've selected a name and went through all of checkout, view your newly acquired domain.

![Imgur](https://i.imgur.com/VnFpXix.png)

Keep this page open, it will be used in the coming steps.

<h2>Pointing Domain To AWS EC2 Instance DNS</h2>

Head over to the AWS console and navigate to the desired EC2 instance. It's very important that the instance already has a web server/LAMP stack configured before proceeding. 

Now navigate to Route 53.

As previously stated, Route 53 will not be used for its domain registering services (due to costs) but will be used to create a hosted zone for the new domain. 

1. Select ***create hosted zone*** and name it accordingly to the domain name. <br>
2. Also set the zone type as ***public hosted zone***. <br>
3. Finalize and save changes. <br>
![Imgur](https://i.imgur.com/pMxAUkW.png)

4. Once the hosted zone is created, press ***Create Record Set*** and create two A records (for www and one with an alias target of the new domain) with the IPv4 address of the EC2 instance. 

5. Navigate back to the **My Domain** section of freenom and select ***Manage Domain** <br>
6. Go to the dropdown and select: Management Tools --> Name Servers --> Use custom nameservers <br>
7. Attach the 4 nameserver values found in the recently created hosted zone and save the changes. <br>
![Imgur](https://i.imgur.com/nmsoTDk.png)
Now search the domain name on a search engine and check out the renamed site! 
![Imgur](https://i.imgur.com/Fl3iEwE.png)
[free-nom]: https://www.freenom.com/en/index.html?lang=en
[route-53]: https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/getting-started.html
