# base image 
FROM node:20-buster

# Needed packages installation
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv \
    && apt-get clean

#Node for Next
WORKDIR /app

# Node.js dependencies
COPY package*.json ./
RUN npm install

# Python environment 
WORKDIR /backend

# Python dependencies
COPY requirements.txt ./
RUN pip3 install -r requirements.txt

# Copy the code
WORKDIR /app
COPY . .

# I exposed 3000 for Next.js, 8000 for Django, and 5000 for Flask 
EXPOSE 3000 8000 5000

# run services 
CMD ["sh", "/app/start.sh"]
