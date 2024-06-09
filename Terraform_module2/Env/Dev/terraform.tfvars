Linux_vm = {
  vm1 = {
    rg_name            = "sn_vm_rg1"
    rg_location        = "central india"
    vnet_address_space = ["10.0.0.0/16"]
    vnet_name          = "vm_vnet"
    subnet_name        = "internal"
    address_prefixes   = ["10.0.1.0/24"]
    nic_name           = "vmnic"

    allocation_method = "Static"

    vm_name                  = "vm12"
    size                     = "Standard_F2"
    keyvault_name            = "sn-key-vault1"
    keyvault_rg_name         = "sn_rg"
    username                 = "username"
    password                 = "password"
    Bastion_address_prefixes = ["10.0.2.0/24"]
    bastion_pip              = "basion_pip"
    bastion_host_name        = "sn_vm_bastion"
  }

}