
FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN useradd -m custuser

WORKDIR /app

COPY --from=builder /root/.local /home/custuser/.local
ENV PATH=/home/custuser/.local/bin:$PATH

COPY . .

RUN chown -R custuser:custuser /app
USER custuser

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
