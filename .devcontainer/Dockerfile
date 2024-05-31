FROM python:3.12.3-slim

RUN apt update
RUN apt install gettext git gcc -y

RUN apt install bash-completion
RUN echo "if ! shopt -oq posix; then\n\
  if [ -f /usr/share/bash-completion/bash_completion ]; then\n\
    . /usr/share/bash-completion/bash_completion\n\
  elif [ -f /etc/bash_completion ]; then\n\
    . /etc/bash_completion\n\
  fi\n\
fi" >> ~/.bashrc

RUN sh -c "curl -sSL https://pdm.fming.dev/install-pdm.py | python3 -"
ENV PATH=/root/.local/bin:$PATH
