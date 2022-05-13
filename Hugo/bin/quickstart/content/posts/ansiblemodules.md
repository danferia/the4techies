---
title: "Team Blog 8"
date: 2022-04-01T08:47:11+01:00
draft: true
---

Today's post, will discuss the utility of Ansible and other similar tools provides developers. For this post, we'll be covering the command modules I used to create an Ansible playbook that provisions a Docker container to run a test application. We'll also add a few other modules that I find very useful for playbook writing. 

<h3>Using Proper Ansible Modules</h3>

**Note**: I'll be using a Docker container running Ubuntu 18.04 but this playbook is compatible with local systems or cloud computing instances running Ubuntu. Just ensure that localhost and any other proper ports are accessible. 

Aside from understanding the finicky nature of Ansible's syntax, you'll want to start by understanding the modules. For this example, we'll be using a module that runs the test application on localhost.

![Imgur](https://i.imgur.com/xuBKYXq.png)

In the image above, you'll notice a parameter `hosts:`. It's important to understand that when you run an Ansible playbook you must choose which managed nodes or groups you want to execute against. You can set a list of hosts in an *inventory*. The default location for inventory is in a file called `/etc/ansible/hosts` but you can pull sources of inventory from other sources whether it'd be from the cloud or a `hosts.ini` file. We won't be declaring our hosts in a `hosts.ini` file but it's good to utilize when creating a playbook that will run in multiple webservers.

Moving on, we'll set the `hosts:` parameter as `localhost` as we want our playbook to execute against localhost. We don't have to define `localhost` in our inventory, as Ansible will create an implicit one automatically. 
