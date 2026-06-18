# Week 3 — Infrastructure as Code (IaC) Scanning

## Project Name
EnterpriseSecure DevSecOps

## Objective
Write Terraform IaC scripts and scan them using Checkov to detect 
cloud misconfigurations before deployment.

## Tools Used
- Terraform 1.6.3
- Checkov 3.3.1

---

# Step 1 — Install Terraform

```bash
wget https://releases.hashicorp.com/terraform/1.6.3/terraform_1.6.3_linux_amd64.zip
unzip terraform_1.6.3_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform --version
```

Note: Kali mirror timeout hota hai apt install ke liye, isliye direct 
binary download kiya hashicorp releases se.

---

# Step 2 — Install Checkov

```bash
pip install checkov --break-system-packages --ignore-installed
checkov --version
```

---

# Step 3 — Write Terraform Configuration

Created main.tf with intentionally misconfigured resources:
- S3 bucket with public-read ACL (no encryption, no versioning)
- Security group with open SSH (0.0.0.0/0)

---

# Step 4 — Run Checkov Scan

```bash
checkov -d ~/terraform-iac
```

## Results

| Result | Count |
|---|---|
| Passed | 11 |
| Failed | 10 |
| Skipped | 0 |

## Key Failed Checks

| Check ID | Description |
|---|---|
| CKV2_AWS_6 | S3 bucket has no Public Access block |
| CKV2_AWS_61 | S3 bucket has no lifecycle configuration |
| CKV_AWS_144 | No cross-region replication enabled |
| CKV_AWS_18 | No access logging enabled |

---

# Step 5 — Jenkins Pipeline Updated

Added IaC Security Scan stage to existing pipeline:
- Stage 1: Clone Repository
- Stage 2: Static Code Analysis (SonarQube)
- Stage 3: Build Docker Image
- Stage 4: Container Vulnerability Scan (Trivy)
- Stage 5: IaC Security Scan (Checkov)

---

# Step 6 — Verify Pipeline

```text
Finished: SUCCESS
```

---

# Results
- Terraform successfully installed and configured
- Checkov successfully scanned IaC files
- 10 misconfigurations identified in Terraform scripts
- Jenkins pipeline updated with Checkov stage
- Pipeline executed successfully with all 5 stages
