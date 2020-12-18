#!groovy

node {
    checkout scm
    withCredentials(
            [
                    usernamePassword(
                            credentialsId: 'brown-account',
                            passwordVariable: 'PASSWORD',
                            usernameVariable: 'USER')
            ]
    ) {
        def remote = [
                name: 'oscar',
                host: 'ssh.ccv.brown.edu',
                user: USER,
                password: PASSWORD,
                allowAnyHosts: true
        ]
        stage('Transfer a file to oscar') {
            writeFile file: 'hello.txt', text: 'Hello oscar!'
            sshPut remote: remote, from: 'hello.txt', into: '.'
        }
        stage('Run a command on oscar') {
            sshCommand remote: remote, command: "ls -lrt"
            sshCommand remote: remote, command: "for i in {1..5}; do echo -n \"Loop \$i \"; date > hello.txt; sleep 1; done"
        }
        stage('Run a shell script on oscar') {
            sshScript remote: remote, script: "oscar-job.sh"
        }
        stage('Fetch a file from oscar') {
            sshGet remote: remote, from: 'hello.txt', into: 'hello.txt', override: true
            sh 'cat hello.txt'
        }
        stage('Remove a file from oscar') {
            sshRemove remote: remote, path: "hello.txt"
            sshCommand remote: remote, command: "ls -lrt"
        }
    }
}
