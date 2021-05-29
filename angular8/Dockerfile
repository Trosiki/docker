FROM node:latest

RUN npm install npm@latest -g

RUN apt install bash git -y

RUN mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

ENV HOME=/home/node

# Copy of Startup.sh
COPY ./scripts/startup.sh /etc/startup.sh
RUN chmod 777 /etc/startup.sh

WORKDIR $HOME/app

RUN npm i -g npm

RUN npm install -g @angular/cli && npm cache clean --force

EXPOSE 4200

CMD [ "node" ]

ENTRYPOINT ["/etc/startup.sh"]
