def repo_url = 'https://github.com/conan-io/hello'
def repo_branch = 'master'

node {
   stage("Get project"){
      git branch: repo_branch, url: repo_url
   }
   stage("Build"){
        sh "cmake CMakeLists.txt && make"
        echo "makefile"
   }
   stage("packaging artifacts"){
       sh "conan package ."
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
