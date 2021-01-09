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
   stage("Packaging artifacts"){
       echo "packaing with canon"
       sh "conan new Hello/0.1 -t"
       sh "conan create . cyber/beta"
   }
   stage("Push artifact"){
       echo "Upload to Conan-repo bintray"
       sh "conan user -p 3f3432aa5e1948249fe3b0a1857c6ff19af4e036 -r conan-repo hillagold"
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
