vnet = {

  vnet1 = {
    rg_name       = "sn_rg2"
    location      = "central india"
    vnet_name     = "vm_vnet"
    address_space = ["10.0.0.0/16"]
    subnets = {
      subnet1 = {
        sub_name       = "subnet1"
        address_prefix = "10.0.1.0/24"
      }

      subnet2 = {
        sub_name       = "subnet2"
        address_prefix = "10.0.2.0/24"
      }
    }
  }
}