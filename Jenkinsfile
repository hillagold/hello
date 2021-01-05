def repo_url = 'https://github.com/conan-io/hello'
def repo_branch = 'master'

node {
   stage("Get project"){
      git branch: repo_branch, url: repo_url
   }
   stage("Build"){
        //sh "sudo apt install cmake"
        //sh "cmake CMakeLists.txt && make"
        runCommand( 'cmake -E remove_directory _build')                             // make sure the build is clean
        runCommand( 'cmake -H. -B_build ' + params.AdditionalGenerateArguments )
        runCommand( 'cmake --build _build ' + params.AdditionalBuildArguments )
        echo "makefile"
   }
   stage("unit-testing"){
       echo "unit-tsting"
   }
   stage("packaging artifacts"){
       echo "packaing with canon"
   }
   stage("push artifact"){
       echo "push artifact"
   }
   stage("running SonarQube/somthing else .. to test quality & vularabilitys"){
       echo "Sonarqube"
   }
   stage("integration tests"){
       echo "running integrations tests"
   }

}

   def runCommand( command )
   {
       if(isUnix())
       {
           sh command
       }
       else
       {
           bat command
       }
   }
