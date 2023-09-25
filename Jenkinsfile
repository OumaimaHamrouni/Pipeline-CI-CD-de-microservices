pipeline {
	agent any

	
    stages {
	
	    


	
	
        stage('Build du projet') { 
		 agent { docker 'maven:3.8.3-openjdk-17' }
            steps {
			
                sh 'mvn clean install -DskipTests ' 
				stash includes: 'target/*.jar', name: 'targetfiles'
				
            }
        }



	stage('Construction image') {
            steps { 
                 unstash 'targetfiles'
			   
			   script {
			  
                        sh 'docker build . -t productimage:latest'
                        sh'docker login -u oumaimahamrouni -p oumaima22091996'
						sh 'docker tag productimage oumaimahamrouni/product'
						sh 'docker push oumaimahamrouni/product'
               
                    }
			   
			   
               }
            }
              










        }
}