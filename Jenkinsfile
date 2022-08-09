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
                sh 'terraform maintIAM.tf fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform maintIAM.tf init'
            }
        }
        
        stage('terraform destroy') {
            steps{

               // sh ' terraform destroy --auto-approve' 
                println "Comentado"
            }
        }
        stage('terraform apply') {
            steps{

                   sh 'terraform apply maintIAM.tf --auto-approve'
            }
        }
    }
}
