FROM python:3 as static

WORKDIR /vostokdocs
RUN apt-get update && apt-get install -y texlive-latex-recommended texlive-fonts-recommended texlive-latex-extra texlive-lang-cyrillic latexmk

COPY . .
RUN pip install -r requirements.txt
RUN sphinx-build -b html . _build/html
RUN sphinx-build -b html -D language=en_GB . _build/html/en
RUN sphinx-build -b latex . _build/pdf
RUN sphinx-build -b latex -D language=en_GB . _build/pdf/en
RUN make --directory=_build/pdf all LATEXOPTS="-interaction=nonstopmode" || :
RUN make --directory=_build/pdf/en all LATEXOPTS="-interaction=nonstopmode" || :


FROM nginx:1.15-alpine
COPY --from=static /vostokdocs/_build/html /usr/share/nginx/html
COPY --from=static /vostokdocs/_build/pdf/Sphinx.pdf /usr/share/nginx/html/vostokdocs.pdf
COPY --from=static /vostokdocs/_build/html/en /usr/share/nginx/html/en
COPY --from=static /vostokdocs/_build/pdf/en/Sphinx.pdf /usr/share/nginx/html/en/vostokdocs-en.pdf
