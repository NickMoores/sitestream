FROM debian:bullseye

# Install git, supervisor, VNC, & X11 packages
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      bash \
      git \
      net-tools \
      novnc \
      supervisor \
      x11vnc \
      xvfb

# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768
    URL=https://www.google.co.uk
COPY . /app
CMD ["/app/entrypoint.sh"]
EXPOSE 8080
