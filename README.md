# Containerisation and Deployment of Wisecow Application on Kubernetes 

## Overview

This repository provides instructions for deploying the Wisecow application on a Minikube cluster and configuring it with secure HTTPS access using Nginx as a forward proxy with SSL.
- Application URL: https://rapportsoft.in:30002

## Prerequisites
- Minikube Cluster
- kubectl Tool
- Nginx Web Server
- SSL Certificate
- Registered DNS

## Access The Application
### After Deploying The Application On Kubernetes Cluster It will Access Through-
- #### Access The Application Within Minikube
***curl http://localhost:30001***
- #### Forwarded the Minikube service to host machine By Following Command:
***nohup kubectl port-forward svc/wisecow-service 30001:100 &***
- #### After Forwarding The Service To The Host Machine Will Able To access The Application From Host Machine Through
***curl http://localhost:30001***

### Nginx Configuration for SSL
- Fist We Need To Install Nginx Web Server.
- Then We Need To Add SSL Certificate And Private Key In Configuration file.
- After That We Need To Add Listening Port Number Which Is 30002.
-  Then We Need To Forward The Requests Comes From Nginx To The localhost:30001 Where The Application Is Hosted.
-  The Last Step Is That We Need To Add A Record In The DNS Whch Will Map The Public Ip Address Of Server.
-  When Anyone Requests to `https://rapportsoft.in:30002` will be forwarded to `localhost:30001`.


## Accessing the Application Securely

- Use the following URL to access the Wisecow application securely:

https://rapportsoft.in:30002
