FROM node:8-alpine

RUN npm install -g -s --no-progress yarn

RUN yarn global add vue-cli && \
    yarn global add quasar-cli && \
    yarn global add cordova && \
    yarn global add @vue/cli && \
    yarn global add @vue/cli-init 

#RUN mkdir -p /code

RUN mkdir /home/node/app
#ADD . /home/node/app

WORKDIR /home/node/app
USER root
#COPY . .
	
#RUN yarn run build && \
#    yarn run prune && \
#    yarn cache clean && \
VOLUME [ "/home/node/app" ]


RUN cd /home/node/app

RUN yarn install && \
	yarn cache clean && \
	rm -rf /var/cache/apk/* /tmp/*

#RUN quasar dev	
	
#EXPOSE 3000
CMD [ "quasar", "dev" ]
#CMD /bin/sh

