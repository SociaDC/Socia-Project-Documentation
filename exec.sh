project_root=$(pwd)

# Create the docs directory if it doesn't exist
mkdir -p $project_root/docs

docker run --rm --name=diplomathesis --workdir="" -it \
  -v $project_root/documentation:/documentation \
  -v $project_root/assets:/assets \
  -v $project_root/docs:/docs \
  asciidoctor/docker-asciidoctor \
  bash -c "gem install rouge && find /documentation -name '*.adoc' -exec asciidoctor \
  -r rouge -a source-highlighter=rouge \
  -a stylesdir=assets -a stylesheet=theme.css -a linkcss=true -a outfilesuffix=.html \
  -D /docs {} \;"
