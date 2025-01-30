function aws-attach-volume
    aws ec2 attach-volume --volume-id $argv[1] --instance-id $argv[2] --device /dev/sda1
end