# fishtest-docker
This is a version of a docker image created by @Dantist to run the Fishtest worker (see https://github.com/glinscott/fishtest/wiki/Running-the-worker:-overview)

### Linux instructions

- To create the image execute the following command once:
```shell
./init.sh
```
Note that communicating with the docker daemon requires administrator privileges. So internally this command uses `sudo`. This means that you will be asked for your password.

- To run the worker do:
```shell
./worker.sh [<ARGUMENTS>]
```
Please make sure to have your Fishtest username/password ready the first time you execute this command.

- For developers. To obtain a shell inside the image do:
```shell
./shell.sh
```
