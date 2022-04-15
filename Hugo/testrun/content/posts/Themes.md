---
layout: post
title:  "Team Blog 8"
date:   April 14, 2022
categories: jekyll updates
---

Hello and thanks for checking out my blog page. For this post, I'll be covering where to find and apply Jekyll themes onto your site. Most Jekyll users will find themselves using Minima as their default theme but luckily Jekyll supports the use of custom themes. You can either create your own or go through collections of themes created by other users.

Here are some links to Jekyll theme repositories

[jamstackthemes.dev][Jam-Stack]<br>
[jekyllthemes.org][Jekyll-Themes]<br>
[jekyllthemes.io][I-O]<br>

![Imgur](https://i.imgur.com/yCvfc7l.png)

<h3>How To Enable Your Theme </h3>

Changing your theme can easily done in your repositories settings but for best practices we'll be implementing a GitHub Action to achieve maximum usage.

Once you've selected the custom theme you want to apply, you'll want to follow these steps:

1. You'll have to setup a GitHub action dedicated to deploying your Jekyll site onto GitHub Pages.<br>
2. Make sure that you point to the right repository and source as the build commands will need access to your Gemfile. 
3. After you setup your workflow you'll want to push all your changes and watch the build commence in the actions tab located within the GitHub repository. When the build completes, your page will now have the custom theme applied.

**Note**: The reason you have to enable this build action is partly due to the fact that GitHub Pages runs in safemode and only allows a set amount of plugins to be displayed. Using third-party build sources allows you to override the limitation and gain better control of the build workflow.

Thanks for reading! 


[Jam-Stack]: https://jamstackthemes.dev/ssg/jekyll/
[Jekyll-Themes]: http://jekyllthemes.org/
[I-O]: https://jekyllthemes.io/
[Doc-1]: https://github.com/marketplace/actions/jekyll-deploy-action
