FROM node:7.8.0-alpine

# The base node image sets a very verbose log level.
ENV NPM_CONFIG_LOGLEVEL warn

# Make install directory
RUN mkdir /var/www

# Install `serve` to run the application.
RUN npm install -g serve

# Copy package*.json files into the image.
COPY package*.json /var/www

# Set working Directory.
WORKDIR /var/www

# Install packages.
RUN npm install

# Copy files into image.
COPY . .

# Build for production.
RUN npm run build:prod

# Tell Docker about the port we'll run on.
EXPOSE 5000

ENTRYPOINT ["npm", "run", "start:prod"]


