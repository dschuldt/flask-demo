FROM debian:stretch-slim
LABEL maintainer=dev@dschuldt.de

ADD https://github.com/krallin/tini/releases/download/v0.18.0/tini /tini
ADD app.py /app/
RUN apt update && apt install -y python python-pip && pip install flask gunicorn && chmod +x /tini

ENTRYPOINT ["/tini", "--"]
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:80", "--chdir", "/app", "app:app"]
