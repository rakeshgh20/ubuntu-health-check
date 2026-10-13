pipeline {
    agent any

    options {
        timestamps()
        timeout(time: 5, unit: 'MINUTES')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Validate Bash Syntax') {
            steps {
                sh 'bash -n scripts/health_check.sh'
                sh 'bash -n tests/test_health_check.sh'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'bash tests/test_health_check.sh'
            }
        }

        stage('Run Health Check') {
            steps {
                sh 'bash scripts/health_check.sh'
            }
        }
    }

    post {
        success {
            echo 'SUCCESS: All stages passed.'
        }
        failure {
            echo 'FAILURE: Check the console output.'
        }
        always {
            echo 'Pipeline execution finished.'
        }
    }
}

