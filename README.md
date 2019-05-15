# docker-eks-node-drain
A docker container that runs lifecyled to gracefully terminate a node during an ASG event a spot instance notify. This runs as a daemonset in kubernetes

## Resources needed
- An autocaling group hook for the EKS nodes
- An SNS topic to receive the event
- A configmap file for some configuration options

### node-drainer configmap
There needs to be a configmap in order to run this as a daemonset in kubernetes. An example of a working configmap is as follows

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: node-drainer
  namespace: kube-system
  labels:
    k8s-app: node-drainer
data:
  AWS_REGION: <your region>
  LIFECYCLED_SNS_TOPIC: <your sns topic>
  LIFECYCLED_CLOUDWATCH_GROUP: <your log group>
```
