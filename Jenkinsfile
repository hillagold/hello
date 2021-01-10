@Library('shared-library') _
def repo_url = 'https://github.com/hillagold/hello.git'
def repo_branch = 'master'
def pack = 'Hello/0.1'
def company = 'cyber/beta'

node {
   stage("Get project"){
      git branch: repo_branch, url: repo_url
   }
   stage("Build"){
        echo "makefile"
        sh "cmake CMakeLists.txt"
   }
   stage("Packaging artifacts"){
       echo "packaing with canon"
       artifact(pack, company)
       sh "conan new Hello/0.1 -t"
       sh "conan create . cyber/beta"
   }
   stage("Push artifact"){
       echo "Upload to Conan-repo bintray"
       sh "conan upload Hello/0.1@cyber/beta -r=conan-repo --all"
   }
   stage("Ansible"){
      sh "ansible-playbook ec2_ansible.yaml"
      echo "ansible test"
   }
}
