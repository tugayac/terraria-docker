# Instructions

## Build
Run
```sh
docker build -t terraria-1401 .
```

You can replace the `1401` with the version you're building for. To change the version, make sure also update the Dockerfile `VANILLA_VERSION` variable as well

## Run
If you'd like to, you can create a `serverconfig.txt` config file based on the `serverconfig-default.txt` file in this repo (you don't have to though. If you don't provide one, one will be auto-generated on start).

To start the docker container:
```sh
docker run -it --name=terraria-1401 -v <path to config dir>:/config -v <path to worlds dir>:<path to worlds dir in your serverconfig> -p 7777:7777 <image name from above>
```
Where `<image name from above>` would be `terraria-1401` in this case.

`-v <path to worlds dir>:<path to worlds dir in your serverconfig>` is optional. It's useful if you want to create a cronjob to auto-backup your world. For this to work, you'll have to set `worldpath` in the `serverconfig.txt` before you start the server.

If you want to provide an existing world, add `-e world=<world file name>` to the argument list.

**Note: You can use `Ctrl+P Ctrl+Q` to detach from a docker container. To re-attach, use the `docker attach` commands.**

# Troubleshooting

## Incorrect Permissions on `run.sh`
"I get an error like the following"
```
docker: Error response from daemon: OCI runtime create failed: container_linux.go:345: starting container process caused "exec: \"./run.sh\": permission denied": unknown.
```

This means the permissions on `run.sh` are too restrictive. Run:
```sh
chmod +x run.sh
```
And then build the container again, then try starting the container.
