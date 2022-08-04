pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    options {
        ansiColor('xterm')
    }
    environment {
        GOOGLE_CLOUD_KEYFILE_JSON = credentials('pocdatacap')
    }
    stages {
        stage('Git checkout') {
           steps{
                git branch: 'main', credentialsId: 'Github', url: 'https://github.com/rociobfrias/bigquery-terraform'
            }
        }
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform apply') {
            steps{
      
                   sh 'terraform apply --auto-approve'
            }
        }
    }
}
