# 🚀 Auto-Remediation-Azure

**Auto-Remediation-Azure** is a production-grade cloud automation system that detects critical Azure resource conditions (like high CPU usage) and responds automatically with serverless remediation actions.  
This project reflects my **first complete milestone**, applying everything I’ve learned in Azure so far—combining Infrastructure as Code (IaC), Terraform provisioning, Azure Monitoring, CI/CD pipelines, and serverless logic using Azure Functions and Logic Apps.

---

## 🧩 Project Summary

This solution automatically restarts an Azure virtual machine (VM) when high CPU usage is detected. It uses Azure Monitor alerts and Logic Apps to trigger an Azure Function (written in Python), which securely restarts the affected VM.

✅ Main Highlights:
- Built using **Terraform as IaC** to deploy most Azure infrastructure.
- Integrated **Azure Logic Apps** and **Azure Functions** to automate remediation without manual intervention.
- Connected monitoring through **Azure Monitor Alerts**, and integrated **CI/CD automation via GitHub Actions**.
- Planning to integrate **Application Insights** for end-to-end observability.

---

## 🛠️ Tech Stack

| Category            | Technologies Used                                   |
|---------------------|-----------------------------------------------------|
| **Infrastructure**  | Terraform, Azure Resource Manager                   |
| **Compute & Events**| Azure Functions (Python), Azure Logic Apps         |
| **Monitoring**      | Azure Monitor, Log Analytics, (App Insights planned)|
| **Languages**       | Python, HCL (Terraform)                             |
| **CI/CD**           | GitHub Actions (Function + Infra pipelines)         |
| **Version Control** | Git (GitHub)                                        |

---

## 📁 Folder Structure

auto-remediation-azure/
├── infra/ # Terraform IaC code (RG, alerts, logic app, etc.)
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── terraform.tfvars
├── function_app/ # Azure Function App root
│ └── restart_vm/
│ ├── init.py # Python function to restart VM
│ ├── function.json
│ └── tests/
│ └── test_function.py
├── .github/
│ └── workflows/
│ ├── deployInfra.yml # Terraform CI/CD
│ └── deployFunction.yml # Azure Function CI/CD
├── .gitignore
├── README.md
└── requirements.txt


---

## ⚙️ Key Features

- ✅ **Terraform-first Infrastructure-as-Code (IaC)** deployment.
- ✅ **Azure Function (Python)** with secure credential handling via `DefaultAzureCredential`.
- ✅ **Logic App trigger** using Azure Monitor metric alerts (CPU-based).
- ✅ **Automated CI/CD** using GitHub Actions:
  - Infra deployment on `infra/**` changes.
  - Function deployment on `restart_vm/**` changes.
- 🔜 **Application Insights integration** for telemetry (planned).

---

## 🔄 CI/CD Automation

Deployed and maintained with **GitHub Actions**:

### CI/CD Pipelines:
| Pipeline              | Trigger Path     | Description                          |
|-----------------------|------------------|--------------------------------------|
| `deployInfra.yml`    | `infra/**`       | Deploys infrastructure via Terraform |
| `deployFunction.yml` | `restart_vm/**`  | Publishes Azure Function App         |

Both pipelines are secure (using GitHub secrets) and follow production-grade practices.

---

## 🧪 Testing

Test cases written with `pytest` to validate core logic:

- ✅ Missing environment variable handling.
- ✅ Successful VM restart path using mocks.

> Note: Only 2 test cases added to keep the project minimal but realistic.

---

## 📈 Future Enhancements

- [ ] Integrate Application Insights for live telemetry and traces.
- [ ] Add a test GitHub Actions workflow to automate `pytest` on PRs.
- [ ] Expand remediation actions (e.g., scale-out, alert escalation).
- [ ] Add authentication to function endpoints.

---

## 🙌 Final Notes

This project is more than just automation—it’s my **first milestone showcasing Azure DevOps principles**, event-driven design, infrastructure as code, CI/CD pipelines, and observability.  
I’m proud of the depth and real-world application of this project and will continue building on it as I grow in my cloud engineering journey.

---


