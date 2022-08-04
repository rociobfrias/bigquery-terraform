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
                   sh 'terraform apply -var="deletion_protection=false"'
                   sh 'terraform apply --auto-approve'
            }
        }
    }
}
