pipeline {
    agent any // Use any available agent or node for running the pipeline

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Checking out source code...'
                checkout scm // Retrieves the source code from the repository
            }
        }
        
        stage('Install Dependencies') {
            steps {
                echo 'Installing dependencies...'
                sh 'npm install' // Installs project dependencies
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                sh 'npm test' // Runs the test command defined in package.json
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            cleanWs() // Cleans up the workspace after execution
        }
        success {
            echo 'Tests passed successfully!'
        }
        failure {
            echo 'Tests failed. Check the logs for details.'
        }
    }
}
