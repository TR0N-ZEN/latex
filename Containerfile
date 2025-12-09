FROM fedora

COPY ./packages.texlive.txt /tmp/

# install texlive packages listed in the file
RUN xargs -a /tmp/packages.texlive.txt dnf install -y

WORKDIR /tmp/latex_data

CMD [ "pdflatex", "main.tex" ]


# Information resurces about Containerfiles and building container images:
# 1. https://docs.docker.com/reference/dockerfile/
# 2. https://docs.podman.io/en/stable/markdown/podman-build.1.html
