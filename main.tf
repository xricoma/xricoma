provider "proxmox" {
 pm_api_url   = "https://192.168.1.70:8006/api2/json"
 pm_user      = "tf_user@pam!terraform"
 pm_password  = "563176d7-9ba2-4ec2-872d-1e40c8fa0e6e"
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