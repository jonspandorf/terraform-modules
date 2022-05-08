[
  {
    "essential": true,
    "memory": 256,
    "name": "${CONTAINER_NAME}",
    "cpu": 256,
    "image": "${REPOSITORY_URL}:${BUILD_NUMBER}",
    "workingDirectory": "/",
    "portMappings": [
        {
            "containerPort": 8000,
            "hostPort": 8000
        }
    ]
  }
]

