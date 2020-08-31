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
    TOKEN=credentials('56e56c1c-f3ab-4d35-ae63-4f6c2f70dd71')
  }

    stages {
      stage("Deploy") {
          steps {
              container('kubectl') {
                  sh '''
			source elastic.sh
			kubectl --token=$TOKEN get all -n omegaa
		      '''
              }
          }
      }
}
}
