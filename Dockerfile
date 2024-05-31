# Start with the official Node.js Docker image
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json before other files
# Utilise Docker cache to save re-installing dependencies if unchanged
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy all files
COPY . .

# Build the Next.js app
RUN yarn build

# Expose the listening port
EXPOSE 8002

# Run yarn start to start the app
CMD ["yarn", "start"]