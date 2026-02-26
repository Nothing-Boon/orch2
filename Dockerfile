# Use a lightweight Node.js image based on Alpine Linux 

FROM node:20-alpine 

RUN apk add --no-cache python3 make g++ sqlite-dev

# Create and set the working directory 

WORKDIR /usr/src/app 

  

# Copy package.json and package-lock.json first to leverage Docker cache 

COPY package*.json ./ 

  

# Install only production dependencies for a smaller image 

RUN yarn install --only=production 

  

# Copy the rest of the application source code 

# Note: node_modules and .env should be excluded via .dockerignore 

COPY . . 

  

# The application runs on port 3000 

EXPOSE 3000 

  

# Start the application 

CMD [ "npm", "start" ] 