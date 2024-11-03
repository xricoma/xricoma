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
 PM_API_TOKEN_ID      = "terraform-prov@pve!mytoken"
 PM_API_TOKEN_SECRET  = "b2f49004-18cf-490a-8bee-3c89557a726b"
 pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "my_vm" {
 name       = "NETALERTX2"
 target_node = "kamel-server"
 clone      = "NETALERTX"
 cores      = 2
 memory     = 2048
 disk {
    slot = 0
    # set disk size here. leave it small for testing because expanding the disk takes time.
    size = "10G"
    type = "scsi"
    storage    = "local-lvm"
    iothread = 1
}
}