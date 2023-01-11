/* Primitive Types:
- strings
- booleans
- numbers
*/

variable "var1" {
    default = "This is a string"
}

variable "var2" {
    default = true
}

variable "var3" {
    default = 3
}

variable "list_var" {
    default = [1, 3, 5, 7]
}

variable "map_var" {
    default = {
        foo = "bar"
    }
}

output "list_output" {
    value = element(var.list_var, 1)
}

output "map_output" {
    value = lookup(var.map_var, "foo", "not there")
}

