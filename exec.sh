#!/bin/bash
project_root=$(pwd)

docker run --rm --name=diplomathesis --workdir="" -it \
  -v $project_root/Documentation:/Documentation \
  -v $project_root/Assets:/Assets \
  -v $project_root:/project_root \
  asciidoctor/docker-asciidoctor \
  find /Documentation -name '*.adoc' -exec asciidoctor \
  -a stylesdir=/Assets -a stylesheet=theme.css -a linkcss=true -a outfilesuffix=.html \
  -D /project_root {} \;
