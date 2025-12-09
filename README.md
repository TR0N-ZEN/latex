## latex to pdf using containerisation

This section will guides you to get the programs and extra data
in order to generate a pdf file to your latex code.
The approach using *containerisation* keeps you from cluttering your
computer with all the installed data.

The containerisation program used in examples here is *podman*.
Feel free to familiarize yourself with it reading
https://podman.io/docs.

The instructions to install podman are available at
https://podman.io/docs/installation.

After installation of podman
create a folder (or symbolic link `ln -s TARGET LINK_NAME`) named *data* inside
the directory where you will execute the `podman run ...` command and
place a file named *main.tex* with valid latex content there.

Then execute the following commands:
```
podman build -f Containerfile --tag latex .
podman run --volume ./data:/tmp/latex_data --name latex_container --rm latex
```

The resulting pdf file should now be inside the data folder and carry the name
*main.pdf*.



### problem: missing package

If during execution of `podman run ...`
an error like "missing package" appears search for it using the program *dnf*
from inside the container.
Assume the package *bibtex* is missing search for it
using the following command:
```
podman run --name latex_container --rm latex dnf search texlive-bibtex
```
So the result may look like this
```
Updating and loading repositories:
Repositories loaded.
Matched fields: name (exact)
 texlive-bibtex.x86_64: Process bibliographies (bib files) for LaTeX or other formats
Matched fields: name
 texlive-bibtex8.x86_64: BibTeX variant supporting 8-bit encodings
 texlive-bibtexperllibs.noarch: BibTeX Perl Libraries
 texlive-bibtexu.x86_64: BibTeX variant supporting Unicode (UTF-8), via ICU
```
so you most likely have to get the package *texlive-bibtex.x86_64*
to fix the issue of missing *bibtex*.
To get the package append its name into a new line of the file
*packages.texlive.txt*.



---


## documentation about latex

Consider reading on of the books/pdf as it will help you to avoid
frustrated when using latex.

+ books/pdfs:
  + https://upload.wikimedia.org/wikipedia/commons/2/2d/LaTeX.pdf (about 700 pages pdf)
  + https://ctan.org/pkg/latex2e-help-texinfo (web page to choose the format)
    + https://latexref.xyz/dev/latex2e.pdf (about 300 pages pdf)
  + https://ftp.tu-chemnitz.de/pub/tex/info/lshort/english/lshort.pdf (about 150 pages pdf)
+ search page about latex packages: https://ctan.org/search?phrase=
