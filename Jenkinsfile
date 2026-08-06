pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'docker compose build'
            }
        }



stage('Build Theme') {
    steps {
        sh '''
        cd web/web/themes/custom/informatikadomicile
        npm install
        npm run build
        '''
    }
}
        stage('Deploy') {
            steps {
                sh '''
                docker compose down || true
                docker compose up -d
                '''
            }
        }

        stage('Tests') {
            steps {
                sh 'docker compose ps'
            }
        }
    }
}