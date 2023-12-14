FROM nodered/node-red
USER root
RUN	apk update
RUN apk add ffmpeg
WORKDIR /data
COPY package.json /data/package.json
COPY flows.json /data/flows.json
COPY settings.js /data/settings.js
RUN npm install
WORKDIR /data/timelapse
COPY timelapse/configurations.json .
COPY timelapse/location.json .
WORKDIR /data/timelapse/recordings
WORKDIR /data/timelapse/images
WORKDIR /usr/src/node-red
