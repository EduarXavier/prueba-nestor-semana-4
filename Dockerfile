FROM python:3.8-alpine

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

EXPOSE 3000

COPY . .

CMD ["python", "/app/app.py"] 
