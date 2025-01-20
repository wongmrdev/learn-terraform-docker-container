terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "custom_nginx" {
  name = "custom-nginx"
  build {
    context = "."
  }
}

resource "docker_container" "nginx" {
  image = docker_image.custom_nginx.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8000
  }
}
