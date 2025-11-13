region = "us-east-1"
vpc_id = "vpc-0976de1a5f727d5b1"
private_subnet_ids = [
  "subnet-08d757131aac70b91",
  "subnet-0b4259fab8c1539c4",
  "subnet-03b64ac069bf50233",
]
instance_count = 4
instance_type  = "t3.smaller"
key_name       = "dev-pro-ssh-key-1"
project_name   = "retail-pro"
environment    = "dev"

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCvE1gsc8r+SOjxCavqYSe/ZLtdCKcQr1W2ElvU0Qwp34ynXFTQgnaJKAHWZUj5BmrPdj/u03GH5mzlI2+8gp0UwrbOFqm3S16X3zyEmPzEKnrLWUuYygHejv7x/b2gdu9UlgzQ2QmzLsboIK+SWvnHk0FvuQLtr4AdkCRYKE6TgFVVma/dr0MibeKSQ23+Be1tVf0MznDHvaocoz3xIxqTJynZyxSHnvzHdFGD/m7Ibu3ovRKhUdrYrHaG5x5/M+xbFE6OG7S2E9866LwRoldwffamktZtOC2yunZHlObFpmnFv+EqLSo+ZrPzfsQQS/jLbf9xZJbSL8BEF4epUoirE0q98W6WELxiYo87nMwNT7QMkSw9aBJiFcA6WMRzFzrxhE7o5dmG7UKol6Z5chwd+0Ngn2wASsStM2LtWjbspoJObnjSfQVbCZTNPk6yYkPrKLKEA8Dxy9anqq0CNlgqdv4RDmjH2tbuiv4H6TyTINFjfFxTY4ek8zBwc6xJf1U= ubuntu@ip-172-20-1-15"
