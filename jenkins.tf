provider "docker" {
  host = "tcp://127.0.0.1:5000"
}

resource "docker_container" "jenkins_master"{
  image = "${docker_image.jenkins.latest}"
  name = "master"  
  ports {
    internal = 8080
    external = 8080
  }
  volumes {
    host_path = "/home/rad/terraformtest"
    container_path = "/mnt/host"
  }
}

resource "docker_container" "jenkins_slave"{
  image = "${docker_image.jenkinsslave.latest}"
  name = "latest"  
  ports {
    internal = 49187 
    external = 49187
  }
}

resource "docker_image" "jenkins"{
  name = "jenkins:latest"
}

resource "docker_image" "jenkinsslave"{
  name = "evarga/jenkins-slave:latest"
}
