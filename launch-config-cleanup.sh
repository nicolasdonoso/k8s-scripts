#!/bin/bash

export AWS_REGION=$1

aws autoscaling describe-auto-scaling-groups --max-items 1000 --region $AWS_REGION|jq ."AutoScalingGroups[].LaunchConfigurationName"|grep kops|sed 's/"//g' > asg.txt

aws autoscaling describe-launch-configurations --max-items 1000|jq ."LaunchConfigurations[].LaunchConfigurationName"|grep kops|sed 's/"//g' > lcfg.txt

grep -vxf asg.txt lcfg.txt > delete.txt

for l in $(cat delete.txt); 
    do 
        aws autoscaling delete-launch-configuration --launch-configuration-name $l|jq ."";
    done