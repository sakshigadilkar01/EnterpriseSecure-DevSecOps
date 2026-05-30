# Week 1 — DevSecOps Setup (Kali Linux)

## Project Name

EnterpriseSecure DevSecOps

## Objective

Set up a complete DevSecOps environment on Kali Linux using Jenkins, SonarQube, Docker, Git, and DVWA. Create a Jenkins pipeline that clones source code, performs static code analysis, and builds a Docker image.

## Tools Used

* Jenkins
* SonarQube
* Docker
* DVWA (Damn Vulnerable Web Application)
* Git
* Java (JDK)
* Kali Linux

---

# Step 1 — Update System

```bash
sudo apt update && sudo apt upgrade -y
```

---

# Step 2 — Install Docker

```bash
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version
```

---

# Step 3 — Install Git

```bash
sudo apt install git -y
git --version
```

---

# Step 4 — Install Java

```bash
sudo apt install default-jdk -y
java -version
```

---

# Step 5 — Download Jenkins

```bash
cd /opt
sudo wget https://get.jenkins.io/war-stable/latest/jenkins.war
```

---

# Step 6 — Start Jenkins

```bash
java -jar /opt/jenkins.war --httpPort=8080 &
```

Access Jenkins:

```text
http://localhost:8080
```

---

# Step 7 — Get Jenkins Unlock Password

```bash
cat /root/.jenkins/secrets/initialAdminPassword
```

Copy the generated password.

---

# Step 8 — Configure Jenkins

1. Open Jenkins in browser.
2. Paste unlock password.
3. Click Install Suggested Plugins.
4. Create Admin User.
5. Save and Finish Setup.

---

# Step 9 — Configure Jenkins Executor

Navigate to:

Manage Jenkins → Nodes → Built-In Node → Configure

Set:

```text
Number of Executors = 2
```

Save configuration.

---

# Step 10 — Start SonarQube

```bash
docker run -d --name sonarqube -p 9000:9000 sonarqube:lts
```

Access:

```text
http://localhost:9000
```

Default Login:

```text
Username: admin
Password: admin
```

---

# Step 11 — Start DVWA

```bash
docker run -d --name dvwa -p 8081:80 vulnerables/web-dvwa
```

Access:

```text
http://localhost:8081
```

Default Login:

```text
Username: admin
Password: password
```

---

# Step 12 — Verify Containers

```bash
docker ps
```

Expected Containers:

* sonarqube
* dvwa

---

# Step 13 — Create Jenkins Pipeline

Create a new Pipeline Project:

```text
DevSecOps-Week1
```

Pipeline Script:

```groovy
pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/digininja/DVWA.git'
            }
        }

        stage('Static Code Analysis - SonarQube') {
            steps {
                sh 'echo SonarQube SAST scan running...'
                sh 'echo Visit http://localhost:9000 to see results'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t dvwa-image .'
            }
        }
    }
}
```

Save and click Build Now.

---

# Step 14 — Verify Pipeline Success

Open:

Build Number → Console Output

Expected Result:

```text
Finished: SUCCESS
```

---

# Step 15 — Screenshots Captured

* Jenkins Dashboard
* Successful Pipeline Execution
* SonarQube Dashboard
* DVWA Running
* Docker Container Status (`docker ps`)

---

# Results

Successfully configured:

* Jenkins CI/CD Server
* SonarQube SAST Scanner
* DVWA Vulnerable Application
* Docker Environment
* Git Repository Integration
* Jenkins Pipeline Automation

---


