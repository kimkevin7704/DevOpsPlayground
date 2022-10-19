# DevOps Playground
By: Kevin Kim
README last updated: 10/13/2022

---

## VM spec
We will be deploying using 3 different environments (dev, staging, production) to simulate an actual production pipeline. VM's will be spun up using Vagrant

#### Each VM is spun up using Vagrant with the following spec:

| VM Box | bento/ubuntu-22.04 |
| VM mem | 2048 |
| private network | 192.168.33.0/24 |
| host port | 8080-8090 |
| installs | nginx |


---

## Topics to cover

| Topic | Tool |
| --- | --- |
| Infrastructure as Code | Terraform & Terragrunt |
| Container Orchestration | Kubernetes & Docker |
| Programming Lang | Python | 
| CI/CD | GitHub Actions |
| Infra Monitoring | Grafana & Prometheus |
| Logs Management | Loki |
| Configuration Management | Ansible |

---

## Objectives
### 1. Environment Parity
    - Dev/Staging/Production should have the almost the same configurations/setup
### 2. Infrastructure as Code
    - Environments can be taken down and spun back up without losing anything
### 3. CICD
    - Maintain repo security, set up a simple deployment pipeline via GitHub Actions
### 4. Monitoring/Logging
    - Set up dashboards for monitoring/logging stack and alerts for downtime

---

## Timeline

### Week 1:
- [x] set up VMs for all environments via Vagrant
- [ ] hello world web app container
- [x] set up github actions for repo
- [x] ansible learning


### Week 2:
- [ ] set up system users (service accounts) have accounts so ansible can access using ssh
- [ ] user management with ansible
- [ ] virtual env set up via ansible
- [ ] configure vm's with Ansible
- [ ] deploy container to all environments
- [ ] set up CICD via Github Actions for deployment
- [ ] kubernetes cluster set up and deploy container

### Week 3:
- [ ] asdf

---

## Env setup
1. make virtual env
    - python -m venv env
    - source env/bin/activate (env/Scripts/activate for Windows)
2. install flask