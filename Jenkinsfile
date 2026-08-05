pipeline {

    agent any

    environment {

        APP_NAME = "drupal"

    }

    stages {

        stage('Checkout') {

            steps {

                checkout scm

            }

        }

        stage('Verify Docker') {

            steps {

                sh 'docker version'
                sh 'docker compose version'

            }

        }

        stage('Build Image') {

            steps {

                sh 'docker compose build'

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

        stage('Health Check') {

            steps {

                sh 'docker ps'

            }

        }

    }

    post {

        success {

            echo 'Déploiement terminé'

        }

        failure {

            echo 'Erreur de déploiement'

        }

    }

}