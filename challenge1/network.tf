resource "azurerm_virtual_network" "vnet" {
    name                = "myTerraformVnet"
    address_space       = [ "10.76.0.0/16" ]
    location            = "${var.region}"
    resource_group_name = "${azurerm_resource_group.rg.name}"

    tags = {
        environment = "test"
        description = "Technical Depth"
    }
}

resource "azurerm_subnet" "vm" {
    name                 = "vmSubnet"
    resource_group_name  = "${azurerm_resource_group.rg.name}"
    virtual_network_name = "${azurerm_virtual_network.vnet.name}"
    address_prefix       = "10.176.1.0/24"

    tags = {
        environment = "test"
        description = "Technical Depth"
    }
}

resource "azurerm_public_ip" "vm" {
    name                         = "${arg.vmname}pip"
    location                     = "${arg.region}"
    resource_group_name          = "${azurerm_resource_group.rg.name}"
    public_ip_address_allocation = "dynamic"

    tags = {
        environment = "test"
        description = "Technical Depth"
    }
}