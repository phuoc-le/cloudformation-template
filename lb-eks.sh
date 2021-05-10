helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
    --set clusterName=test-cluster \
    --set serviceAccount.create=false \
    --set region=ap-southeast-1 \
    --set vpcId=vpc-03efa513cbc24cc77 \
    --set serviceAccount.name=aws-load-balancer-controller \
    -n kube-system