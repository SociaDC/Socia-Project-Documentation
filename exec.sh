project_root=$(pwd)

docker run --rm --name=diplomathesis --workdir="" -it \
  -v $project_root/Documentation:/Documentation \
  -v $project_root:/project_root \
  asciidoctor/docker-asciidoctor \
  find /Documentation -name '*.adoc' -exec asciidoctor \
  -a outfilesuffix=.html -D /project_root {} \;

# Inject CSS into each generated HTML file
for html_file in $project_root/*.html; do
  sed -i '1s/^/<style>\n/* Base Styles */\nbody {\n  color: #000000;\n}\n\n/* Footer Styles */\n@page {\n  @bottom-right {\n    content: "Socia";\n  }\n  @bottom-left {\n    content: "Socia";\n  }\n}\n\n/* Heading Styles */\nh1, h2, h3, h4, h5, h6 {\n  color: #000000;\n  font-size: 17px;\n  font-weight: bold;\n  line-height: 1.2;\n  margin-bottom: 10px;\n}\n\n/* Link Styles */\na {\n  color: #0000ff;\n}\n<\/style>\n/' "$html_file"
done
