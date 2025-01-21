# ssh-target

## Purpose

To deploy a linux VM into a Kubernetes cluster using TrustedUserCA and connecting to the pod using SSH certificates

## Preparation

- Click the green `Use this template` button to create a copy of this repo for your own use.
- Clone the repo down to the computer that has kubectl access to the cluster
- Edit the ca.pub file to have your own public key of an RSA 2048 or higher encryption key
- Deploy the ssh-target into your cluster

## Install the Workload

Deploy into cluster using kubectl and Kustomize

```sh
kubectl apply -k .
```

## Connect to the Workload

- Wait for the Load Balancer IP to be provisioned
- Connect to the Pod directly (using the exposed IP address of the service) using SSH Certificates or through Akeyless connect like `akeyless connect -t ubuntu@35.184.187.38 -c "/ninja-hw/hw5/SSH Issuer"`
