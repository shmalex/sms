# Simple Monitoring System 
## TEMPLATE

To monitor your system independently from other system using github

The idea is simple - system will execute scripts on your system and push changes to github (private or public repository, as you wish).

You can add new scripts and organize the folder structure to your needs. 
- Collect information daily or hourly
- Create new files or overwrite existing one.

You can adjust scripts remotely - simply push changes to the repository and changes will be pulled by `run.sh` during next scheduler execution.


# Installation 

1. Create your repository
2. Configure root to be able to push to that repo (copy keys, etc.)
3. Configure crontab :

    `sudo crontab -e`

    `0 0 * * * cd /home/user/my_sms/bash && bash run.sh`