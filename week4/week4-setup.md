# Week 4 — DAST Integration and Pipeline Hardening

## Project Name
EnterpriseSecure DevSecOps

## Objective
Integrate OWASP ZAP for Dynamic Application Security Testing (DAST) 
to catch runtime vulnerabilities in the running application.

## Tools Used
- OWASP ZAP
- DVWA (running on port 8081)

---

# Step 1 — Install OWASP ZAP

```bash
sudo apt update
sudo apt install zaproxy -y
```

---

# Step 2 — Verify DVWA is Running

```bash
docker start dvwa
docker ps
```

Accessed application at:
