FROM cgr.dev/chainguard/python:latest-dev as original
WORKDIR /app
COPY giropops-senhas/requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

FROM cgr.dev/chainguard/python:latest
WORKDIR /app
COPY --from=original /home/nonroot/.local/lib/python3.11/site-packages /home/nonroot/.local/lib/python3.11/site-packages
COPY --from=original /home/nonroot/.local/bin  /home/nonroot/.local/bin
ENV PATH=$PATH:/home/nonroot/.local/bin
COPY giropops-senhas/app.py .
COPY giropops-senhas/templates templates/
COPY giropops-senhas/static static/

ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]