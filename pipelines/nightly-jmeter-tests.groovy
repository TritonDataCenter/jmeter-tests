pipeline {

    agent none

    options {
        buildDiscarder(logRotator(numToKeepStr: '90'))
        disableConcurrentBuilds()
        skipDefaultCheckout()
        timestamps()
    }



    stages {
        
        stage('jmeter-tests') {
            steps {
                catchError {
                    build(job: 'nightly-jmeter-tests',
                          parameters:[string(name: 'TARGET_RIG', value: 'nightly-1'),
                                      booleanParam(name: 'FABRICS_SETUP',
                                                   value: true)])
                }
            }
        }

        
    }
    
}

