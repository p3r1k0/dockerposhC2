# Kali
FROM kalilinux/kali-linux-docker:latest

# Update and apt install programs. Don't dist-upgrade with docker.
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
 curl \
 git \
 tmux \
 gdb \
 gobuster \
 man-db \
 python-impacket \
 minicom \
 nasm \
 nmap \
 sqlmap \
 sslscan \
 ruby \
 wordlists

RUN gem install tmuxinator

RUN tmuxinator -h

# Make Attacky things
RUN mkdir /usr/share/tools/ && cd /usr/share/tools/ && \
	curl -sSL https://raw.githubusercontent.com/nettitude/PoshC2_Python/master/Install.sh | bash

# Modify IP on the server files or you can always install on your linux machine and just copy the Config.py file...
RUN sed 's/HostnameIP = .*/HostnameIP = "https:\/\/192.168.1.X"'/ /opt/PoshC2_Python/Config.py

# creating tmuxinator config
RUN echo "bmFtZTogbW9uaXRvcgpyb290OiB+LwoKd2luZG93czoKICAtIHBvc2hjMjoKICAgICBsYXlvdXQ6IG1haW5faG9yaXpvbnRhbAogICAgIHBhbmVzOgogICAgICAgIC0gcHl0aG9uIC9vcHQvUG9zaEMyX1B5dGhvbi9DMlZpZXdlci5weQogICAgICAgIC0gcHl0aG9uIC9vcHQvUG9zaEMyX1B5dGhvbi9JbXBsYW50SGFuZGxlci5weQogICAgICAgIC0gcHl0aG9uIC9vcHQvUG9zaEMyX1B5dGhvbi9DMlNlcnZlci5weQogICAgICAgIC0gL2Jpbi9iYXNo" | base64 --decode > /root/.config/tmuxinator/monitor.yml








