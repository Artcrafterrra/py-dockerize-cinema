FROM python:3.13-alpine

ENV PYTHONOUNNBUFFERED=1
ENV PYTHONUNBUFFERED=1

WORKDIR /cinema

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /vol/web/static /vol/web/media \
    && adduser --disabled-password --no-create-home my_user \
    && chown -R my_user /vol \
    && chmod -R 755 /vol

USER my_user

EXPOSE 8000