def repo_url = 'https://github.com/hillagold/hello.git'
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
       sh "pwd && ls"
       sh "conan create ."
       sh "conan remote remove_ref hello/0.1@"
       sh "conan install hello/0.1@"
       sh "conan package ."
       echo "packaing with canon"
   }
   stage("push artifact"){
       echo "push artifact"
   }
   stage("integration tests"){
       echo "running integrations tests"
   }

}
