FROM docker.io/library/golang

LABEL MAINTAINER "Rob Muhlestein <rob@rwx.gg>"
LABEL SOURCE "https://github.com/rwxrob/code-mage"

ENV DEBIAN_FRONTEND=noninteractive

RUN yes | \
    apt-get -y --no-install-recommends upgrade && \
    apt-get update && \
    apt-get install -y \
        apt-utils build-essential apt-transport-https  ca-certificates \
        curl neovim tmux dialog perl python-is-python3 gh jq sudo lynx w3m \
        shellcheck  figlet sl tree nmap ed bc iputils-ping bind9-dnsutils htop \
        libncurses5 libcurses-perl net-tools ssh sshpass sshfs rsync \
        cifs-utils smbclient bash-completion make wget less lolcat pandoc \
        hyperfine \
        && \
    cpan -I Term::Animation && \
    apt-get clean && \
    vim +PlugInstall +GoInstallBinaries +qall && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/dmesg.* && \
    cat /dev/null > /var/log/dmesg

COPY ./files/. ./Containerfile /

ENTRYPOINT ["sh","/entry"]
