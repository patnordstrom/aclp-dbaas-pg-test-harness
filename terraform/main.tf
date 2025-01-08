resource "random_password" "root_pass" {
  length  = 30
  special = true
}

resource "linode_instance" "pg_test_harness" {
  label            = var.pg_test_harness_label
  region           = var.region
  image            = var.image_name
  type             = var.pg_test_harness_image_type
  root_pass        = random_password.root_pass.result
  authorized_users = var.authorized_users
  stackscript_id   = var.docker_stackscript_id
  # You can view the UDF names that the script uses by viewing the script.  
  # In this example our script is at https://cloud.linode.com/stackscripts/607433
  stackscript_data = {
    "user_name"    = var.authorized_users[0]
    "disable_root" = "Yes"
  }
  metadata {
    user_data = filebase64("../cloud-init/pg-test-harness-config.yaml")
  }
}

resource "linode_firewall" "pg_test_harness_fw" {
  label           = "${var.pg_test_harness_label}-fw"
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"

  inbound {
    label    = "allow-ssh-from-my-computer"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = var.allowed_ssh_user_ips
  }

  linodes = [linode_instance.pg_test_harness.id]
}