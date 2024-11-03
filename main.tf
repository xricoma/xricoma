terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

provider "proxmox" {
 pm_api_url   = "https://192.168.1.70:8006/api2/json"
 pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "my_vm" {
 name       = "NETALERTX2"
 target_node = "kamel-server"
 clone      = "NETALERTX"
 cores      = 2
 memory     = 2048
 disk {
    slot = "scsi0"
    size = "10G"
    type = "disk"
    storage    = "local-lvm"
    iothread = "true"
}
}