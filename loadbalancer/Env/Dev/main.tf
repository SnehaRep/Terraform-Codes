module "resource_group" {
  source   = "../../VirtualMachine/resource_group"
  Linux_vm = var.Linux_vm

}

module "virtual_network" {
  source     = "../../VirtualMachine/virtua_network"
  Linux_vm   = var.Linux_vm
  depends_on = [module.resource_group]
}

module "subnet" {
  source     = "../../VirtualMachine/subnet"
  Linux_vm   = var.Linux_vm
  depends_on = [module.virtual_network]
}

module "network_interface" {
  source     = "../../VirtualMachine/network_interface"
  Linux_vm   = var.Linux_vm
  depends_on = [module.subnet]

}

module "Linux_vm" {
  source     = "../../VirtualMachine/Linux_VM"
  Linux_vm   = var.Linux_vm
  depends_on = [module.network_interface]
}

module "Loadbalancer" {
  source = "../../VirtualMachine/Loadbalancer"
  Lb = var.Lb
  depends_on = [module.Linux_vm]
}
