resource_group_name      = "rg"
resource_group_location  = "South India"

vn_name                 = "vn"
vn_location             = "South India"
address_space           = ["10.0.0.0/16"]

pr_name                 = "pr-sn"
pr_address_prefixes     = ["10.0.1.0/24"]

pb_name                 = "pb-sn"
pb_address_prefixes     = ["10.0.2.0/24"]

sg_name                 = "sg"
sg_location             = "South India"

security_rules = {
  allow_ssh = {
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  allow_http = {
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  allow_https = {
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
