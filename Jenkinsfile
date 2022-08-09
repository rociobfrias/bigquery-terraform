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
        
        stage('terraform destroy') {
            steps{

                sh ' terraform destroy --auto-approve'
            }
        }
        stage('terraform apply') {
            steps{

                   sh 'terraform apply maintIAM.tf --auto-approve'
            }
        }
    }
}
