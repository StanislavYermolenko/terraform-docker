variable "env" {
  type = string
  description = "Env to deploy to"
  default = "dev"
}

variable "image" {
  type = map
  description = "image for container"
  default = {
    dev = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }
}


variable "ext_port" {
  type = list
  
    validation {
    condition = max(var.ext_port...) <= 65535 && min(var.ext_port...) > 0
    error_message = "The external port must be valid port range 0-65535."
  }  

}


variable "int_port" {
  type = number
  default = 1880
  
    validation {
    condition = var.int_port == 1880
    error_message = "The internal port must be 1880."
  }
}


locals {
  container_count = length(var.ext_port)
  
}
