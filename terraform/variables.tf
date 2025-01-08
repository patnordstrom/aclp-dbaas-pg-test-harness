variable "region" {
  type        = string
  description = "Linode region to deploy"
}

variable "pg_test_harness_label" {
  type        = string
  description = "Label for PostgreSQL test harness server"
  default     = "pg-test-harness-server"
}

variable "docker_stackscript_id" {
  type        = number
  description = "ID for the Docker one-click marketplace deployment script"
  # In this example we are using Docker One-Click which you can find using the method at the URL below.
  # https://www.linode.com/community/questions/18509/how-can-i-deploy-1-click-apps-from-the-cli
  default = "607433"
}

variable "image_name" {
  type        = string
  description = "The image we will deploy our test harness server with"
  # We are using a marketplace app in this deployment.  Each one has a list of compatible images.
  # You can find a list of compatible images for a StackScript via the command `linode-cli stackscripts view $SS_ID`
  default = "linode/ubuntu22.04"
}

variable "pg_test_harness_image_type" {
  type        = string
  description = "The image type to our test harness server with"
  default     = "g6-standard-2"
}

variable "authorized_users" {
  type        = list(string)
  description = "List of users who has SSH keys imported into cloud manager who need access"
}

variable "allowed_ssh_user_ips" {
  type        = list(string)
  description = "List of IP addresses that can SSH into the server"
}