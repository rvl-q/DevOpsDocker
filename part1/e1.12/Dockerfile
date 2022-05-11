# We need node
FROM node:lts

# serve to serve the project in port 5000
EXPOSE 5000

WORKDIR /usr/src/app

# Copy all of the source code
COPY . .

# Install...
# Build...
RUN npm run build
RUN npm install -g serve

# And finally the command to run the application
CMD ["serve", "-s", "-l", "5000", "build"]