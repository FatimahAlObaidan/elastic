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
    TOKEN=credentials('86ccc4c2-eca9-46cd-b773-916d116cb056')
  }

    stages {
      stage("Deploy") {
          steps {
              container('kubectl') {
                  sh '''
			source elastic.sh
			kubectl --token=$TOKEN get all -n ommega
		      '''
              }
          }
      }
}
}
