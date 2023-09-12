FROM python:3.7-alpine
COPY giropops-senhas giropops-senhas
WORKDIR /giropops-senhas
RUN apk add --no-cache gcc musl-dev linux-headers
RUN pip install -r requirements.txt
COPY . .
CMD ["flask", "run", "--host=0.0.0.0"]