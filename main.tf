resource "null_resource" "default" {
  provisioner "local-exec" {
    command = "echo 'Hello World, now with more characters'"
  }
}
