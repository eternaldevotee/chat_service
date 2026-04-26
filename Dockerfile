FROM python:3.11-slim

WORKDIR /app

# Install system deps
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install uv
RUN pip install uv

# Copy project
COPY . /app

# Create venv
RUN uv venv --python 3.11

# Install rasa-pro using uv
RUN . .venv/bin/activate && uv pip install rasa-pro

# Set license
ENV RASA_LICENSE=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI0NThjZTMyMS1jOGNhLTQ0NmEtYmZlNi04N2E3M2NkZDdmNWIiLCJpYXQiOjE3NzcyMjM1NzcsIm5iZiI6MTc3NzIyMzU3NSwic2NvcGUiOiJyYXNhOnBybyByYXNhOnBybzpjaGFtcGlvbiByYXNhOnZvaWNlIiwiZXhwIjoxODcxOTE3OTc1LCJlbWFpbCI6InNodWJoYW1vZmZpY2lhbDA5MTBAZ21haWwuY29tIiwiY29tcGFueSI6IlJhc2EgQ2hhbXBpb25zIn0.KufNhmsB2vPe8FTjfgiF4VE7sYrcxLmF-rQ1o6Zy-sactYe2FeGKbDpe6HCim9TNgvtCZ1aJqUwfGi4i3TgmVUKzCvnMQ6E5hxEIRgrDqbCBTAOnDhlHLGy1StTVPW4F-8voBKu9PGX9LZ0DVtTAbzD2Etnkn6M02qwBrCnhP537FjAoedc4pA_lwVNfRJ2rF3OD3PA_ARmM86q_MiadaGgng_ocXm94KBdPqqcTJ6yZJnAShoczNTXOMNK1HxuwDUbe4MPo7ENUx2L8s1YPqjOcscxdlzN3t7dHyBcCHWfNLB0iKjLbd9WpJca72xULIaXzsPhJ3bVFaP5CdWnYiA

# Run
CMD [".venv/bin/rasa", "run", "--enable-api", "--cors", "*", "--port", "5005", "--interface", "0.0.0.0"]