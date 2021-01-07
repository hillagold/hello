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
#   stage("packaging artifacts"){
#       sh "pwd && ls"
#       echo "packaing with canon"
#       sh "whereis conan"
#       sh "conan create ."
#       sh "conan install hello/0.1@"
#   }
#   stage("push artifact"){
#       echo "push artifact"
#   }
   stage("integration tests"){
       echo "running integrations tests"
   }
   stage("Ansible"){
      sh "ansible-playbook ec2_ansible.yaml"
      echo "ansible test"
   }
}
