pipeline {
    agent any
    stages {
        stage('pull') {
            steps {
                git branch: 'main', credentialsId: 'tttttt', url: 'https://github.com/digambarkare/shw.git'
                echo 'pull'
                echo 'hi baby'
            }
        }
        stage('build') {
            steps {
                sh '/opt/maven/mvn clean package'
                echo 'build done'
            }
        }
        stage('quality-test') {
            steps {
                sh '''mvn sonar:sonar \\
  -Dsonar.projectKey=student.api \\
  -Dsonar.host.url=http://13.212.23.53:9000 \\
  -Dsonar.login=84a7d5fb5fcc3092d2216dcd99d0caad31041dad'''
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