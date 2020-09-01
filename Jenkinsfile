pipeline {
      agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: kubectl
    image: bryandollery/terraform-packer-aws-alpine
    command:
    - cat
    tty: true
  - name: helm
    image: alpine/helm
    command:
    - cat
    tty: true
"""
    }
  }
  environment {
    TOKEN=credentials('f79b40ee-2e62-47d2-8cad-e5e350d38804')
  }

    stages {
      stage("Deploy") {
          steps {
              container('kubectl') {
                  sh '''
			source elastic.sh
			kubectl --token=$TOKEN get all -n omega
		      '''
              }
          }
      }
}
}
