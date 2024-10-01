project_root=$(pwd)

# Create the output directory if it doesn't exist
mkdir -p $project_root/output

docker run --rm --name=diplomathesis --workdir="" -it \
  -v $project_root/documentation:/documentation \
  -v $project_root/assets:/assets \
  -v $project_root/output:/output \
  asciidoctor/docker-asciidoctor \
  find /documentation -name '*.adoc' -exec asciidoctor \
  -a stylesdir=/assets -a stylesheet=/assets/theme.css -a linkcss=true -a outfilesuffix=.html \
  -D /output {} \;
