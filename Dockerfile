# Define what image docker will use
FROM node:14

# Define main docker app working directory
WORKDIR /code

# Copy node app config file with dependencies to working
# directory.
COPY package*.json .

# Define PORT env var
ENV PORT=8080

# Run command to prepare application to run
RUN npm install

# Expose the PORT 8080 of application that is
# running
EXPOSE 8080

# Copy files in the folder to docker app directory
# ignoring files listed in .dockerignore
COPY . .

# Run command to start application in docker instance
CMD ["node", "index.js"]