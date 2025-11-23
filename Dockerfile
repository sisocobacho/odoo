FROM debian:latest
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
ARG TARGETARCH

RUN apt-get update 
RUN apt-get install -y \
	build-essential \
	libldap2-dev \
	libpq-dev \
	libsasl2-dev \
	libxml2-dev \
	libxslt1-dev \
	wget 
RUN echo "finish installing dependencies"
RUN uv python install 3.11
RUN uv venv
RUN uv pip install -r requirements.txt 
RUN echo "finish installing requirements"
EXPOSE 8069

# Default command
RUN echo "finish"

