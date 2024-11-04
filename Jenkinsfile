pipeline {
    agent any
    parameters {
        string(name: 'ROBOT_TAGS', defaultValue: '', description: 'Comma-separated list of Robot Framework tags')
    }
    stages {
        stage('Run Robot Tests') {
            steps {
                script {
                    // Check if ROBOT_TAGS is not null or empty before splitting
                    def tags = params.ROBOT_TAGS ? params.ROBOT_TAGS.split(',').collect { "--include " + it.trim() }.join(' ') : ""
                    sh "robot ${tags} test.robot"
                }
            }
        }
    }
}
