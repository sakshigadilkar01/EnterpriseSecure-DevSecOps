# Week 2 — Dependency and Container Scanning

## Project Name
EnterpriseSecure DevSecOps

## Objective
Integrate Trivy scanner into Jenkins pipeline to scan Docker images for CVE vulnerabilities.

## Tools Used
- Trivy 0.70.0
- Jenkins
- Docker
- DVWA

---

# Step 1 — Install Trivy

### Add Trivy GPG Key
```bash
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
```

### Add Repository
```bash
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | sudo tee /etc/apt/sources.list.d/trivy.list
```

### Install Trivy
```bash
sudo apt update
sudo apt install trivy -y
trivy --version
```

---

# Step 2 — Scan Docker Image Manually
```bash
trivy image dvwa-image
```

---

# Step 3 — Jenkins Pipeline Updated

Added Trivy stage to Jenkins pipeline:
- Stage 1: Clone Repository
- Stage 2: Static Code Analysis (SonarQube)
- Stage 3: Build Docker Image
- Stage 4: Container Vulnerability Scan (Trivy)

---

# Step 4 — Verify Pipeline
Open Jenkins → DevSecOps-Week1 → Build Now
```text
Finished: SUCCESS
```

---

# Results
- Trivy successfully installed
- DVWA Docker image scanned
- 3 CVEs found in symfony/yaml library
- Jenkins pipeline updated with Trivy stage
- Pipeline executed successfully
