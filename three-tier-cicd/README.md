|Three-Tier Application — Docker & Jenkins CI/CD|

A containerized three-tier web application demonstrating a practical DevOps CI/CD workflow using Docker, Docker Compose, Jenkins, and AWS ECR.

The application consists of a React frontend, Node.js/Express backend, and MongoDB database running as separate services.


🏗️ Architecture

```text
Developer
    |
    v
  GitHub
    |
    v
  Jenkins
    |
    +--> Build Docker Images
    |
    +--> Push Images to AWS ECR
    |
    v
Docker Compose
    |
    +--> React Frontend
    |
    +--> Node.js Backend
    |
    +--> MongoDB
----------------------------
three-tier-cicd/
├── backend/
│   ├── Dockerfile
│   ├── package.json
│   ├── package-lock.json
│   └── server.js
│
├── frontend/
│   ├── Dockerfile
│   ├── package.json
│   ├── package-lock.json
│   ├── public/
│   └── src/
│
├── docker-compose.yml
├── Jenkinsfile
├── .gitignore
└── README.md
-----------------------------
📚 What I Practiced

Through this project I practiced:

Docker containerization
Dockerfiles
Docker Compose
React application deployment
Node.js/Express API deployment
MongoDB containers
Jenkins CI/CD
AWS ECR
Docker image tagging
Automated image builds
Automated image pushes
Linux administration
Git and GitHub
Environment-based configuration
----------------------------
Author

Umar Farooq

DevOps & Cloud Engineering Enthusiast
BS Artificial Intelligence — JKU Vienna

GitHub: https://github.com/Farooq-dev00

Portfolio: https://github.com/Farooq-dev00/umar-devops-portfolio