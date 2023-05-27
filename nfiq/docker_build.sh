TAG=1.0
IMAGE_NAME=srinath/nbis_nfiq2:$TAG
CONTAINER_NAME=NFIQ2

docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME}

case "$1" in
  del)
    #following command will remove the container with the name "$IMAGE_NAME"
    docker rmi $IMAGE_NAME

    #following command create a new docker container wich is defined in your Dockerfile
    docker build --rm --tag $IMAGE_NAME .
  ;;

  help)
    echo "this script recreates the given docker containers"
    echo "using:"
    echo "  docker_build.sh <param1>"
    echo "  param1: (optional)"
    echo "     del: delete and create the defined image given in the first three lines of this script"
    echo "    help: shows that help dialog"
    echo ""
    echo "e.g.:"
    echo "  docker_build.sh del"
    echo "  --> delete the old container,"
    echo "  --> delete the old image,"
    echo "  --> create a new image,"
    echo "  --> creates a new container of that image"
  ;;
  *) echo "wrong \$1 parameter: del|help"

esac

# in case of shared directories between docker host and docker container
# please add option "-v /path/to/host/dir:/path/to/container/dir \", e.g.:
#docker run -ti -d \
#  --name ${CONTAINER_NAME} \
#  --restart=unless-stopped \
#  -v /path/to/host/dir:/path/to/container/dir \
#  ${IMAGE_NAME}

docker run -ti -d \
  --name ${CONTAINER_NAME} \
  --restart=unless-stopped \
  -v /home/srinath/Documents/srinath/ITSEC/vol1/srinath:/srinath \
  ${IMAGE_NAME}
