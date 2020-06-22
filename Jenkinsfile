pipeline{
  agent {
    docker {
      image 'ernestosbarbosa/ruby-chromedriver:latest'
    }
  }
  stages {
	stage('Setup') {
		steps {
			script {
				sh 'sudo bundle install'
			}
	  }
    }
    stage('Executando testes') {
        steps {
    		script {
    		  try {
    			  sh "sudo bundle exec cucumber"
    			  currentBuild.result = 'SUCCESS'
    		  } catch (Exception e) {
    			  currentBuild.result = 'FAILURE'
    		  }
    		}
        }
    }
    stage('Gerando relatórios') {
      steps {
          publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: 'report.html', reportName: 'HTML Report', reportTitles: ''])
      }
    }
  }
}
