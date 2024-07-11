docker volume create --opt type=nfs --opt device=:%cd%/Documentation Thesis_Documentation
docker volume create --opt type=nfs --opt device=:%cd%/Assets Thesis_Assets

docker run --rm --name=diplomathesis --workdir="" -it -v %cd%/Documentation:/Documentation -v %cd%/Assets:/Assets asciidoctor/docker-asciidoctor asciidoctor-pdf --theme /Assets/theme.yml -a pdf-fontsdir=/Assets/Fonts /Documentation/index.adoc
