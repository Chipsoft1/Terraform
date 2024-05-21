provider "azurerm" {
  features {}
}

variable "vm_ip" {
  description = "IP address of the Windows VM"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the Windows VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the Windows VM"
  type        = string
  sensitive   = true
}

variable "powershell_script_content" {
  description = "The content of the PowerShell script to run"
  type        = string
}

resource "null_resource" "provision" {
  triggers = {
    always_run = "${timestamp()}"
  }

  connection {
    type     = "winrm"
    host     = var.vm_ip
    user     = var.admin_username
    password = var.admin_password
    https    = false
    port     = 5985
  }

  provisioner "remote-exec" {
    inline = [
      "echo '${var.powershell_script_content}' > C:\\Scripts\\ScriptT1.ps1",
      "powershell.exe -ExecutionPolicy Bypass -File C:\\Scripts\\ScriptT1.ps1"
    ]
  }
}
