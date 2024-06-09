Linux_vm = {
  vm1 = {
    rg_name            = "sn_vm_rg1"
    rg_location        = "central india"
    vnet_address_space = ["10.0.0.0/16"]
    vnet_name          = "vm_vnet"
    subnet_name        = "internal1"
    address_prefixes   = ["10.0.1.0/24"]
    nic_name           = "vmnic1"

    allocation_method = "Static"

    vm_name                  = "vm12"
    size                     = "Standard_F2"
    keyvault_name            = "sn-key-vault2"
    keyvault_rg_name         = "snrg"
    username                 = "username"
    password                 = "password"
  }

  vm2 = {
    rg_name            = "sn_vm_rg1"
    rg_location        = "central india"
    vnet_address_space = ["10.0.0.0/16"]
    vnet_name          = "vm_vnet"
    subnet_name        = "internal2"
    address_prefixes   = ["10.0.2.0/24"]
    nic_name           = "vmnic2"

    allocation_method = "Static"

    vm_name                  = "vm123"
    size                     = "Standard_F2"
    keyvault_name            = "sn-key-vault2"
    keyvault_rg_name         = "snrg"
    username                 = "username"
    password                 = "password"
  }
}

Lb = {
    loadbalancer = {
        pip_name = "lbpublicip"
        location = "central india"
        rg_name = "sn_vm_rg1"
        vnet_name = "vm_vnet"
        allocation_method = "Static"
        lb_name = "internallb"
        ip_config_name = "ip_config"
        pool_name = "backendpool"
        nic_name1 = "vmnic1"
        nic_name2 = "vmnic2" 
        probe_name = "ssh-running-probe"

    }
}