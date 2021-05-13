# ccmb-workflow
Collection of scripts for workflow automation.

## Workflow on oscar

### Configuring environment variables
In order to make the scripts configurable, environment variables can be used to set paths and git branches. On oscar, modify the `~/.modules` file, e.g.:

```shell
export DEV_BRANCH=dev-branch
export PACKAGE_DIR=/path/to/pkg

alias ll='ls -al'

module load R/4.0.5
```
### Installing R package under development
Installing an R package from a branch can be done by running a shell script remotely through ssh. E.g. set the package directory and the branch to develop as environment variables and let the `oscar.Jenkinsfile` execute the `bash/install-R-package.sh` script.

```groovy
        stage('Install R package on oscar') {
            sshScript remote: remote, script: "bash/install-R-package.sh"
        }
```

### Submit `sbatch` jobs
`slurm-job.sh` jobs can submitted to the slurm scheduler by executing a shell script remotely. The `bash/sbatch-submit.sh` script is an example script that first allows to assert the existence of environment variables with comprehensive error message, submits a job to slurm, and then tails the slurm output. In order to get the tailing to cancel on error, it is important to implement pattern matching for possible log output that indicates failure. In the given example, the log output is expected to contain one of the following strings to signal the termination of the job.

```shell
SUCCESS_MESSAGE='SUCCESS'
FAILURE_MESSAGE='FAILURE'
CANCELLATION_MESSAGE='CANCELLED'
```

