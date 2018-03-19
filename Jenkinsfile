node {
def customImage

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }
	
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        customImage = docker.build("ntu-cits/my-test-docker-image")
    }
	
	
    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

		/* https://opensource.googleblog.com/2018/01/container-structure-tests-unit-tests.html */
		/* https://blog.jevsejev.io/2016/06/09/docker-image-tests/ */		
        
		customImage.inside {
            sh 'echo "Tests passed"'
        }
    }	
	
    stage('Push image') {
		/* read section under [Specifying a Docker Label] */
		
		docker.withRegistry('localhost:5001') {
            /* app.push("${env.BUILD_NUMBER}") */
            app.push("latest")
        }
    }
}

