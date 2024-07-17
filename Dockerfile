FROM python:3.11.5-slim

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g playwright && \
    npx playwright install-deps

COPY requirements.txt ./

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

RUN rfbrowser init

COPY . .

EXPOSE 8080

ENV ENVIRONMENT production

CMD ["robot", "--outputdir", "./results", "--pythonpath", "./", "--loglevel", "TRACE", "tests"]
