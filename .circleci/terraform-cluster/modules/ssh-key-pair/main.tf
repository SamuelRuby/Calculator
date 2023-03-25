# Create a .pem file
# RSA key of size 2048 bits
resource "tls_private_key" "new-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_sensitive_file" "private_key" {
  filename          = "${var.namespace}-key.pem"
  content = tls_private_key.new-key.private_key_pem
  file_permission   = "0700"
}


# Create a Key Pair
resource "aws_key_pair" "nodekey" {
  key_name   = "${var.namespace}-key"
  public_key = tls_private_key.new-key.public_key_openssh
# public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCldJxUMlogWB1Uu9/aDYFttIQZi1qP4H1BvfYmlbAKqWlAE3aGODI2MHytxvUk9j8BM7LI3+MibMASRSnXGX6UkHsg+3Vorsj6Nq/n2zjLjqLD6PqE+ijoNx6bjRmgztP7iTgfIBYplu6snT0MXCPXUIEUfMZyh2s251RdBEvaJuf/IgmUmssxbT9juToxjKLHmQGOcH4HmsGt33b5G3JL9KMidA3ACmrNZOZzDl48ZbQYaPLCqOVITC9fz9zo2Zlzzp27CJu4Drw15ycvkK2/nsjL9rBbxjhJigqgZWtHRwphg2OtQsYzXoe8OeCqx/Is2QSiTD6J4mUq2WrL2UdP2/CscPt1W543SwGl1k8hloze3dHlgWEjgGZlLbmx9APiHwsrX7vNZkpCi4vCsCVHdiygnOqQxHnNKKNYVTpojxVPym4ElYlx1hurCN6ndMbneeRjYfB29yB5vNc2YgV7oN+HgkOB3PYWp9y+NdBXXFcMmGegMa8y9H9d6qTrINE= vagrant@ubuntu-focal"
}
