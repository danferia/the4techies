---
title: "Team Blog 9"
date: 2022-04-10
draft: true
---
Amazon Web Services is a great tool for any developers who want to get started with cloud computing services but each service has their own unique costs. Luckily for eligible services, AWS provides a Free Tier so users can enjoy the services AWS has at no cost. 

On the *Billing & Cost Management Dashboard* you can see an overview of **Top Free Tier Services by Usage** which highlights the highest percentage of month-to-date usage against Free Tier limits based on service.

![Imgur](https://i.imgur.com/VTUSMFr.png)

AWS automatically provides alerts through AWS budgets that notify users by email when you exceed 85% of your free tier limits for each service. For additional visibility, you can decrease or increase the alert threshold by creating a new usage budget. 

**Note**: The alerts only cover non-expiring AWS Free Tier offerings, such as 1 million publishes of Amazon SNS or 10 GB of storage retrievals through Amazon Glacier (Glacier API only). They also cover offerings that expire after 12 months, which includes 30 GB of SSD/Magnetic Amazon EBS storage, 500 MB per month of Amazon ECR storage, and much more.

Check out all the offerings AWS provides on their Free Tier [here][free-tier].

<h3>Setting Up Usage Alerts</h3>

It's quite simple to setup a variety of alerts to manage the costs or usage of your services. This is especially important for companies or users who are mindful of their costs and need to set a budget. For this guide we'll be creating a usage budget to notify when a service exceeds a certain threshold.
 
1. From the menu on the left, select **Budgets** then choose **Create budget**. On the **Create budget** page, choose **Usage** as the **Budget Type**.

![Imgur](https://i.imgur.com/uB6CuGZ.png)

2. On the **Set budget details** page, edit to your specifications. Add as much usage type groups as needed. Here's an example snippet of a budget tracking RDS hours: 

![Imgur](https://i.imgur.com/hXCa3UW.png)

3. Once on the **Configure thresholds** page, you can then configure your usage threshold. For example, on a budget of 100 hours on RDS you can send an email alert once 75 hours has been reached. You can also set up your the specific notifications you'd like to receive, such as Amazon SNS or Chatbot Alerts.

![Imgur](https://i.imgur.com/Bty2jZm.png)

4. Review and confirm your budget.

Make sure to take advantage of all the services Amazon has to offer on their AWS Free Tier.

[free-tier]: https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsm.page-all-free-tier=1
