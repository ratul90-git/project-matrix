# Build Stage - Using Eclipse Temurin JDK 21.0.6+7 and Installing Maven
FROM eclipse-temurin:21.0.6_7-jdk-alpine AS builder

# Set working directory inside the container
WORKDIR /app

# Install Maven manually
RUN apk add --no-cache maven

# Copy Maven wrapper and project files
COPY mvnw pom.xml ./
COPY .mvn .mvn
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Runtime Stage - Use JRE only to keep the final image lightweight
FROM eclipse-temurin:21.0.6_7-jre-alpine

# Set the working directory
WORKDIR /app

# Copy the JAR file from the builder stage
COPY --from=builder /app/target/*.jar welcomeService.jar

# Expose application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "welcomeService.jar"]
