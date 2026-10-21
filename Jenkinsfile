
pipeline {
    agent any

    environment {
        AWS_PROFILE = 'terraform-1958'
        AWS_REGION  = 'ap-south-1'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Check Tools') {
            steps {
                sh '''
                    set -e
                    git --version
                    packer version
                    aws --version
                '''
            }
        }

        stage('Packer Format Check') {
            steps {
                sh 'packer fmt -check .'
            }
        }

        stage('Packer Init') {
            steps {
                sh 'packer init .'
            }
        }

        stage('Packer Validate') {
            steps {
                sh 'packer validate .'
            }
        }

        stage('Build ScyllaDB AMI') {
            steps {
                sh '''
                    set -e
                    packer build .
                '''
            }
        }
    }

    post {
        success {
            echo 'ScyllaDB AMI build completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Check the Jenkins console output.'
        }
    }
}
