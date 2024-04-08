pipeline {
    agent any
    stages {
        stage('pull') {
            steps {
                 
                echo 'pull'
            }
        }
        stage('build') {
            steps {
                echo 'build done'
            }
        }
        stage('quality-test') {
            steps {
                echo 'quality-test'
            }
        }
        stage('test') {
            steps {
                echo 'test done'
            }
        }
        stage('deploy') {
            steps {
                echo 'deploy done'
            }
        }
    }
}