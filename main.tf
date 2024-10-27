terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }
  }
}

provider "proxmox" {
 pm_api_url   = "https://192.168.1.70:8006/api2/json"
 pm_user      = "terraform-prov@pve!mytoken"
 pm_password  = "b2f49004-18cf-490a-8bee-3c89557a726b"
 pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "my_vm" {
 name       = "NETALERTX2"
 target_node = "kamel-server"
 clone      = "NETALERTX"
 storage    = "local-lvm"
 cores      = 2
 memory     = 2048
}