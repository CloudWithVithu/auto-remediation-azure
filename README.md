# 🚀 Auto-Remediation-Azure

**Auto-Remediation-Azure** is a production-grade cloud automation system that detects critical Azure resource conditions (like high CPU usage) and responds automatically with serverless remediation actions.  
This project reflects my **first complete milestone**, applying everything I’ve learned in Azure so far—combining Infrastructure as Code (IaC), Terraform provisioning, Azure Monitoring, and serverless logic using Azure Functions and Logic Apps.

---

## 🧩 Project Summary

This solution automatically restarts an Azure virtual machine (VM) when high CPU usage is detected. It uses Azure Monitor alerts and Logic Apps to trigger an Azure Function (written in Python), which securely restarts the affected VM.  

✅ Main Highlights:
- Built using **Terraform as IaC** to deploy most of the Azure infrastructure.  
- Integrated **Azure Logic Apps** and **Azure Functions** to automate remediation without manual intervention.  
- Connected monitoring through **Azure Monitor Alerts**, and planning to integrate **Application Insights**.  
- This project was a hands-on opportunity to combine automation, observability, and resilience in the cloud.

---

## 🛠️ Tech Stack

| Category            | Technologies Used                                   |
|---------------------|-----------------------------------------------------|
| **Infrastructure**  | Terraform, Azure Resource Manager                   |
| **Compute & Events**| Azure Functions (Python), Azure Logic Apps         |
| **Monitoring**      | Azure Monitor, Log Analytics, (App Insights planned)|
| **Languages**       | Python, HCL (Terraform)                             |
| **Version Control** | Git (GitHub)                                        |

---

## 📁 Folder Structure

auto-remediation-azure/
├── infra/ # Terraform IaC code (resource group, alerts, logic app)
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
├── .gitignore
├── README.md
└── requirements.txt


---

## ⚙️ Key Features

- ✅ **Terraform-first Infrastructure-as-Code (IaC)** deployment for reproducibility and scalability.
- ✅ **Serverless Function (Python)** to securely restart VMs using Azure SDK and DefaultAzureCredential.
- ✅ **Logic App Webhook** trigger connected to Azure Monitor metric alerts.
- ✅ **Azure Monitor Alerting** for high CPU usage events.
- 🔜 **Application Insights Integration** (coming soon for advanced observability).

---

## 📌 Manual + Terraform Deployment

While some resources were provisioned manually (like initial Function App), **the core infrastructure including the Logic App, Monitor alerts, and Action Groups were deployed with Terraform**, aligning with real-world cloud engineering practices.

---

## 🧪 Testing

Basic test cases were implemented using `pytest` to validate:
- Response when environment variables are missing
- Logic of the VM restart trigger via mocks

---

## 📈 Future Enhancements

- [ ] Integrate Application Insights for advanced monitoring and tracing.
- [ ] Expand remediation logic (e.g., autoscaling, disk cleanup, alert forwarding).
- [ ] Replace manual steps with full Terraform automation.
- [ ] Add CI/CD pipelines using GitHub Actions.

---

## 🙌 Final Notes

This project is more than just automation—it’s my **first milestone showcasing core Azure DevOps skills**, IaC, event-driven remediation, and production-aligned monitoring.  
I’m proud of what I’ve built so far and excited to grow this further.

---

