FROM python:3.12.3-slim

RUN apt-get update
RUN apt-get install gettext git gcc bash-completion make -y

RUN echo "if ! shopt -oq posix; then\n\
  if [ -f /usr/share/bash-completion/bash_completion ]; then\n\
    . /usr/share/bash-completion/bash_completion\n\
  elif [ -f /etc/bash_completion ]; then\n\
    . /etc/bash_completion\n\
  fi\n\
fi" >> ~/.bashrc

RUN sh -c "curl -sSL https://pdm.fming.dev/install-pdm.py | python3 -"
ENV PATH=/root/.local/bin:$PATH
