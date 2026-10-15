# Kubernetes KIND Nginx Lab

## Project Overview
Deployed Nginx on a Kubernetes cluster using KIND on an Ubuntu AWS EC2 instance.

## Tools
- Docker 29.1.3
- KIND 0.30.0
- kubectl 1.34.12
- Kubernetes v1.34.0
- Nginx

## What I Practiced
- Created a Kubernetes cluster with KIND
- Deployed Nginx using a Deployment
- Exposed Nginx through a NodePort Service
- Tested the Nginx welcome page using curl and port-forwarding
- Scaled the Deployment from 1 to 3 replicas
- Tested Kubernetes self-healing by deleting a Pod
- Inspected Services and EndpointSlices

## Verification
The Nginx welcome page was returned successfully by curl.
All three replicas were Running and registered as Service endpoints.

## Cleanup
Run kind delete cluster --name nginx-lab when finished.

## Note
This was a learning lab on EC2 using KIND. Public internet access to Nginx was not configured.
