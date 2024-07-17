# git_push.tf

provider "null" {}

resource "null_resource" "git_push" {
  # Trigger the execution whenever this resource block is evaluated
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      cd /d/python
      git add scirpt.py
      git commit -m "Automated commit from Terraform"
      git push origin master
    EOT

    # Use cmd.exe to execute the commands
    interpreter = ["cmd", "/C"]
  }
}

