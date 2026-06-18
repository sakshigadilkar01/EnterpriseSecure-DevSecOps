# EnterpriseSecure-DevSecOps-
EnterpriseSecure DevSecOps is a CI/CD system that integrates development, security, and operations to deliver secure applications. It uses tools like Jenkins, SonarQube, and DVWA to automate builds, detect code vulnerabilities, and improve software security before deployment
# EnterpriseSecure DevSecOps Pipeline

## Project Overview
Complete DevSecOps pipeline integrating SAST, SCA, Container Scanning, 
IaC Scanning, and DAST using Jenkins CI/CD on Kali Linux.

## Architecture
GitHub --> Jenkins --> SonarQube (SAST) --> Docker Build --> 
Trivy (Container Scan) --> Checkov (IaC Scan) --> OWASP ZAP (DAST)

## Tools Used
- Jenkins - CI/CD Orchestration
- SonarQube - Static Application Security Testing
- Trivy - Container/Dependency Vulnerability Scanning
- Terraform - Infrastructure as Code
- Checkov - IaC Security Scanning
- OWASP ZAP - Dynamic Application Security Testing
- DVWA - Target Vulnerable Application

## Folder Structure
devsecops-pipeline/
      ── week1/
      ── week2/
      ── week3/
      ── week4/
└── README.md

## Weekly Breakdown
- Week 1: Containerization and SAST setup
- Week 2: Dependency and Container scanning with Trivy
- Week 3: Infrastructure as Code scanning with Checkov
- Week 4: DAST integration with OWASP ZAP

## Results Summary
- SonarQube: Code quality gate configured
- Trivy: 3 vulnerabilities found in symfony/yaml
- Checkov: 11 passed, 10 failed checks on Terraform
- OWASP ZAP: DAST scan completed on DVWA application
