---
layout: post
title:  "Team Blog 6"
date:   2022-03-31.
categories: jekyll update
---

For those unfamiliar with Ansible, it is a DevOps tool that automates software provisioning, configuration management, and application deployment. With the use of Ansible playbooks, you can provision instances on the cloud or test out development locally on your machine or container. I'll write a blog next week on a simple playbook that can provision a docker container to run a test application. 

**Puppet** 

I've had some experience using Puppet and all I can say is that it's just as good as any other management orchestration tool. It also assists developers in delivering software rapidly and with ease. One cool feature I found was that it was able to review and inspect packages found throughout an entire system's infrastructure. For developers on a budget, I wouldn't recommend this tool but rather will point you towards Ansible or Jenkins.

**Travis CI** 

Travis CI is a tool that I've been using for years and I continue to use as a way to unit test and push new updates for my projects. In previous experiences I've used it to test any changes that are made in both the back-end and front-end of the application. There's lots of tutorials to help you get setup and quick integration with your GitHub repository. There's support for many operating systems, just make sure to declare it in your "travis.yml" file. Although the service isn't free, make sure to checkout your GitHub student developer [pack][p-a] for free private builds on your repository while you're a student.

**Jenkins** 

Unlike some continuous integration tools, Jenkins is open source so it's free to use for any aspiring developers who are looking to get involved in the DevOps work culture. Similar to the tools mentioned above, it provides support for many operating systems and integrates well with Docker containers. Even cloud providers have their own Jenkins installation guides such as integrations with AWS CodeDeploy and CodeBuild. 

As you get started with your first CI/CD pipeline make sure you understand the deployment phases and proper syntax to avoid any errors in your build.

Check out the tools: 

[Puppet][p-u]

[Jenkins][j-e]

[Travis CI][t-ci]


[j-e]: https://www.jenkins.io/download/
[p-u]: https://puppet.com/products/puppet-enterprise/
[t-ci]: https://docs.travis-ci.com/user/for-beginners/
[p-a]: https://education.github.com/pack/offers
