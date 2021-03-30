# Use NodeJS base image
FROM node:12.21.0

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .

RUN npm run build

# Bind the port that the image will run on
EXPOSE 8081

# Define the Docker image's behavior at runtime
CMD [ "node", "./www/server.js" ]
