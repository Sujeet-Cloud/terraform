resource "null_resource" "example" {
  provisioner "local-exec" {
    command = <<EOT
      cd /d/push
      python test.py
      git add .
      git commit -m "new"
      git push origin master
    EOT

    interpreter = ["bash", "-c"]  # Use bash shell for command execution
  }
}

