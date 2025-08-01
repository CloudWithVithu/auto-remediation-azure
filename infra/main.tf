resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "autoheal-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "autoheal-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                  = var.vm_name
  resource_group_name   = azurerm_resource_group.main.name
  location              = var.location
  size                  = "Standard_B1s"
  admin_username        = "azureuser"
  admin_password        = "P@ssw0rd1234!"
  network_interface_ids = [azurerm_network_interface.nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_monitor_action_group" "vm_action_group" {
  name                = "autoheal-action-group"
  resource_group_name = azurerm_resource_group.main.name
  short_name          = "autohealAG"

  email_receiver {
    name                    = "admin"
    email_address           = "vithushanvisuvalingam@gmail.com"
    use_common_alert_schema = true
  }

  webhook_receiver {
  name                    = "logicapp-hook"
  service_uri             = "https://prod-05.eastasia.logic.azure.com:443/workflows/35b6993d9c154ca497aaae251855d560/triggers/When_a_HTTP_request_is_received/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2FWhen_a_HTTP_request_is_received%2Frun&sv=1.0&sig=kz_nz8WQMgtjM6_tqd0iwtb7Cg8m6k_rTlXVvEjEDbk"
  use_common_alert_schema = true
  }
}

resource "azurerm_monitor_metric_alert" "high_cpu_alert" {
  name                = "high-cpu-alert"
  resource_group_name = azurerm_resource_group.main.name
  description         = "Alert when CPU usage > 80%"
  severity            = 3
  enabled             = true
  frequency           = "PT1M"
  window_size         = "PT5M"
  scopes              = [azurerm_windows_virtual_machine.vm.id]

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.vm_action_group.id
  }

  tags = {
    environment = "autoheal"
  }
}

# trigger CI/CD test
