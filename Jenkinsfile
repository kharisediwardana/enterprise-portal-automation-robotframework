pipeline {
    agent any

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['STAGING', 'SIT'],
            description: 'Target deployment environment for test execution'
        )
        string(
            name: 'TEST_TAGS',
            defaultValue: 'Smoke',
            description: 'Robot Framework tag filter (e.g. Smoke, PLUS12, Regression)'
        )
        booleanParam(
            name: 'HEADLESS',
            defaultValue: true,
            description: 'Run browser in headless mode'
        )
    }

    environment {
        OUTPUT_DIR       = "results"
        PYTHONUNBUFFERED = "1"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Environment Preparation') {
            steps {
                echo "Setting up Python virtual environment and dependencies..."
                sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Execute Robot Framework Tests') {
            steps {
                echo "Executing Robot Framework suite against ${params.ENVIRONMENT} with tag [${params.TEST_TAGS}]..."
                sh '''
                    . venv/bin/activate
                    mkdir -p ${OUTPUT_DIR}
                    robot --variable HEADLESS:${HEADLESS} \
                          --variablefile config/environment_${ENVIRONMENT.toLowerCase()}.robot \
                          --include ${TEST_TAGS} \
                          --outputdir ${OUTPUT_DIR} \
                          --loglevel DEBUG \
                          tests/ || true
                '''
            }
        }
    }

    post {
        always {
            echo "Publishing Robot Framework report via Jenkins Robot Plugin..."
            step([
                $class: 'RobotPublisher',
                outputPath: "${OUTPUT_DIR}",
                outputFileName: 'output.xml',
                reportFileName: 'report.html',
                logFileName: 'log.html',
                disableArchiveOutput: false,
                passThreshold: 90.0,
                unstableThreshold: 75.0,
                onlyCritical: false
            ])

            echo "Archiving test artifacts and failure screenshots..."
            archiveArtifacts artifacts: "${OUTPUT_DIR}/*.png, ${OUTPUT_DIR}/*.html, ${OUTPUT_DIR}/*.xml", allowEmptyArchive: true
        }
        failure {
            echo "Automated test suite execution completed with failures. Check Jenkins Robot Results trend graph."
        }
        success {
            echo "All tests passed successfully!"
        }
    }
}
