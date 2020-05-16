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
docker run -it --name=terraria-1401 -v <path to config dir>:/config -p 7777:7777 <image name from above>
```
Where `<image name from above>` would be `terraria-1401` in this case.

If you want to provide an existing world, add `-e world=<world file name>` to the argument list.
