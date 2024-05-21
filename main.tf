provider "azurerm" {
  features {}
}

resource "null_resource" "provision" {
  connection {
    type     = "winrm"
    host     = "4.180.155.203"
    user     = "beheerder"
    password = "M@sterY0d@123"
    https    = false
    port     = 5985
  }

  provisioner "file" {
    source      = "scripts/setup.ps1"
    destination = "C:\\setup.ps1"
  }

  provisioner "remote-exec" {
    inline = [
      "powershell.exe -File C:\\setup.ps1"
    ]
  }
}


