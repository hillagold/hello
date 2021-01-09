def repo_url = 'https://github.com/hillagold/hello.git'
def repo_branch = 'master'

node {
   stage("Get project"){
      git branch: repo_branch, url: repo_url
   }
   stage("Build"){
        echo "makefile"
        sh "cmake CMakeLists.txt"
   }
   stage("ppackaging artifacts"){
       echo "packaing with canon"
       sh "conan new Hello/0.1 -t"
       sh "conan create . cyber/beta"
   }
   stage("push artifact"){
       echo "Upload to Conan-repo bintray"
       sh "conan upload Hello/0.1@cyber/beta -r=conan-repo --all"
   }
   stage("integration tests"){
       echo "running integrations tests"
   }
   stage("Ansible"){
      sh "ansible-playbook ec2_ansible.yaml"
      echo "ansible test"
   }
}
