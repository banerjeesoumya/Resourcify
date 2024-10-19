# Use Node.js as the base image
FROM node:16

# Set the working directory
WORKDIR /app

# Copy the backend and frontend package.json files separately to install dependencies
COPY backend/package*.json ./backend/
COPY frontend/package*.json ./frontend/

# Install backend and frontend dependencies
RUN npm install --prefix ./backend
RUN npm install --prefix ./frontend

# Install global tools if needed (like vite and tsc)
RUN npm install -g typescript vite

# Copy the rest of the code
COPY ./backend ./backend
COPY ./frontend ./frontend

# Expose the ports for frontend and backend
EXPOSE 3000 5173

# Run both frontend and backend services
CMD npm run dev --prefix ./backend & npm run dev --prefix ./frontend
