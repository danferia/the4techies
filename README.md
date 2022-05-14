# the4techies
CIT 480 
Welcome to our Repository
Within our files you will find our HTML files which will contain our Space Invaders game , and blog site containt information about our team.
To begin there are neccessary steps which are required to start.
1. First you will need an AWS account.
2. Once the account is set up Be sure to have Terraform, AWS CLI, and Git downloaded into your local machine. 
- Using the link Below it will direct you to downlod the correct Terraform for your OS
https://www.terraform.io/downloads?_ga=2.211967572.1335186206.1652148028-810911765.1647492940
- Using the Following Link it will direct you to download and install AWS CLI to your machine.
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
- The following link will provide steps on hot to download GIT:
https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

Once all of the above are installed you will run this command
git clone https://github.com/danferia/the4techies.git 
This will download all the files neccessary 

Some prerequisites will to have an instance configured AWS with VPC, subnets, security groups and domain name registered. 
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html
Once all of those are set up and te instance is running.
You will go into the folder /terraform stuff final which will have the S3 buckets, Route 53, ACM certificates, Cloudfront to be configure into the instance.
Enter the following commands to run terraform and create S3, Route53, ACM certificates, Cloud front
- terraform init
- terraform plan
- terraform apply
    - When ther terrafrm apply is running there will be an email sent that is registered with the domain name
    - accept the certificates 
    - oncethe certificates are created Route53 will then be created
- If everything ran smoothly there will be 9 changes to be applied.
- Once applied ther DNS will need to finish pointing to the route
- Once that is complete upload the files from /space invader true website
  - run command aws s3 sync . s3://www.the4techs.com
- This will upload all the fiiles into the s3 bucket
- once everything is set it will set the website 
- https://www.the4techs.com/
Congrats! Everything is set
- 

