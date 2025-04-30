## latex to pdf

create a folder (or symbolic link `ln -s TARGET LINK_NAME`) named `data` in
the directory where you execute the `podman run ...` command and
place a file named `main.tex` file with valid latex content there

```
podman build -f fedora.podmanfile --tag latex .
podman run --volume ./data:/tmp/latex_data --name latex_container --rm latex
```

---

## documentation

+ https://upload.wikimedia.org/wikipedia/commons/2/2d/LaTeX.pdf
+ https://ctan.org/pkg/latex2e-help-texinfo
  + https://latexref.xyz/dev/latex2e.pdf
