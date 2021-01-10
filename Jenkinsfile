@Library('shared-library') _
def repo_url = 'https://github.com/hillagold/hello.git'
def repo_branch = 'master'
def pack = 'Hello/0.1'
def company = 'cyber/beta'
def repo = 'conan-repo'
def repo_type = 'bintary'

node {
   stage("Get project"){
       git branch: repo_branch, url: repo_url
   }
   stage("Build"){
       echo "makefile"
       sh "cmake CMakeLists.txt"
   }
   stage("Packaging artifacts & Upload to bintray repo"){
       artifact(pack, company, repo, repo_type)
   }
   stage("Ansible"){
       sh "ansible-playbook ec2_ansible.yaml"
       echo "ansible test"
   }
}
