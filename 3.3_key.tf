provider "aws" {
 region="us-east-1"
}
resource "aws_instance" "cloudserver" {
  ami           = "ami-0ddc798b3f1a5117e"
  instance_type = "t2.micro"
  key_name= "mycloudkey"

   tags = {
      Name= "myclodserver"
   }
}
resource "aws_key_pair" "mycloudkey" {
  key_name   = "mycloudkey"
  public_key ="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCosa0atZZkggypj3dR6kZu5eKWvUZU+/+pYtIwG9xjySmsOWYyEYX6VYneUQ0SZcTtW5vmZxilmPYMMdA962ogPNRnsVt6+lzNbAyqRdB5SJfGKegMT4BdrK+BdSK2VhPNyjDrz5nbAI+KuSa3TmHuV2Idh3hV/amOz1DBGjAPYuTcqUqjgFIWm+nOn0TM0Z6oeRtU5cnYQChoY3b4auoxBHeuWc5lSKURNvtE9XfQ1Kj1fjqs4knmiTnt+DcGqc5/2XffhFG37+XFNB9hccO2Dyya4rYhUZKZivLm7IiSMzp3lCCzlEcd0WxRd/pZNHcQ2RXcqjzExrs6n5IzdXgJ ec2-user@ip-172-31-2-149.ec2.internal"
}
