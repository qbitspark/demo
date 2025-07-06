#!/bin/bash

echo "🔄 Updating your Spring Boot app..."

# Stop and remove old container
sudo docker stop my-app 2>/dev/null || true
sudo docker rm my-app 2>/dev/null || true

# Build new jar
echo "📦 Building jar..."
./mvnw clean package -DskipTests

# Build new Docker image
echo "🐳 Building Docker image..."
sudo docker build -t my-spring-app .

# Run new container
echo "🚀 Starting new container..."
sudo docker run -d -p 8080:8080 --name my-app my-spring-app

echo "✅ Done! App is running at http://localhost:8080"
