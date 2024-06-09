Linux_vm = {
  vm1 = {
    rg_name           = "sn_vm_rg"
    rg_location       = "Central India"
    address_space     = ["10.0.0.0/16"]
    vnet_name         = "vm_vnet"
    address_prefixes  = ["10.0.1.0/24"]
    pip_name          = "vm_pip"
    allocation_method = "Static"
    pip_sku           = "Standard"
    nic_name          = "vm_nic"
    subnet_id         = "/subscriptions/d9d0472a-8ba4-4c4b-aadd-675696f61ca7/resourceGroups/sneha_vm_rg/providers/Microsoft.Network/virtualNetworks/sneha_vnet/subnets/vmsubnet"
    vm_name           = "vm12"
    size              = "Standard_F2"
    admin_user        = "snehaadmin"
    password          = "Password@1234"
  }
}