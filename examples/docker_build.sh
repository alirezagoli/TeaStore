#!/bin/bash
push_flag='true'
registry='alirezagoli'

print_usage() {
  printf "Usage: docker_build.sh [-p] [-r REGISTRY_NAME]\n"
}

while getopts 'pr:' flag; do
  case "${flag}" in
    p) push_flag='true' ;;
    r) registry="${OPTARG}" ;;
    *) print_usage
       exit 1 ;;
  esac
done

docker build --no-cache -t "$registry/teastore-base:new" ../utilities/tools.descartes.teastore.dockerbase/
perl -i -pe's|.*FROM descartesresearch/*|FROM '"$registry"'/|g' ../services/tools.descartes.teastore.*/Dockerfile
docker build --no-cache -t "$registry/teastore-registry:new" ../services/tools.descartes.teastore.registry/
docker build --no-cache -t "$registry/teastore-persistence:new" ../services/tools.descartes.teastore.persistence/
docker build --no-cache -t "$registry/teastore-image:new" ../services/tools.descartes.teastore.image/
docker build --no-cache -t "$registry/teastore-webui:new" ../services/tools.descartes.teastore.webui/
docker build --no-cache -t "$registry/teastore-auth:new" ../services/tools.descartes.teastore.auth/
docker build --no-cache -t "$registry/teastore-recommender:new" ../services/tools.descartes.teastore.recommender/
perl -i -pe's|.*FROM '"$registry"'/|FROM descartesresearch/|g' ../services/tools.descartes.teastore.*/Dockerfile

if [ "$push_flag" = 'true' ]; then
  docker push "$registry/teastore-base:new"
  docker push "$registry/teastore-registry:new"
  docker push "$registry/teastore-persistence:new"
  docker push "$registry/teastore-image:new"
  docker push "$registry/teastore-webui:new"
  docker push "$registry/teastore-auth:new"
  docker push "$registry/teastore-recommender:new"
fi
