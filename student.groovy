pipeline {
    agent any
    stages {
        stage('pull') {
            steps {
                git branch: 'main', credentialsId: 'qhh', url: 'https://github.com/digambarkare/shw.git'
                echo 'pull'
                echo 'hi baby'
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