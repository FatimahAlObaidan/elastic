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
    TOKEN=credentials('82b8d589-3306-4de4-a703-54285dd0ae79')
  }

    stages {
      stage("Deploy") {
          steps {
              container('kubectl') {
                  sh '''
			source elastic.sh
			kubectl --token=$TOKEN get all -n omegaproject
		      '''
              }
          }
      }
}
}
