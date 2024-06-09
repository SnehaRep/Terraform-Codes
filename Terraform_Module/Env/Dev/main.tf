module "resource_group" {
  source   = "../../Virtual_Machin/resource_group"
  Linux_vm = var.Linux_vm

}

module "virtual_network" {
  source     = "../../Virtual_Machin/virtual_network"
  Linux_vm   = var.Linux_vm
  depends_on = [module.resource_group]
}

module "subnet" {
  source     = "../../Virtual_Machin/subnet"
  Linux_vm   = var.Linux_vm
  depends_on = [module.virtual_network]
}

module "Linux_vm" {
  source     = "../../Virtual_Machin/Linux_VM"
  Linux_vm   = var.Linux_vm
  depends_on = [module.subnet]
}
