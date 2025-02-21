# Stage 1: Build the application
FROM gradle:jdk-21-and-22-alpine AS build

# Set the working directory
WORKDIR /app

# Copy only the files required for dependency resolution
COPY build.gradle.kts .
COPY settings.gradle.kts .

# Download dependencies (this step wilrl be cached unless build.gradle.kts.kts or settings.gradle.kts.kts changes)
RUN gradle dependencies --no-daemon

# Copy the rest of the application code
COPY src ./src

# Build the application
RUN gradle build --no-daemon

# Stage 2: Run the application
FROM eclipse-temurin:21-jre-alpine

# Set the working directory
WORKDIR /app

# Copy the built application from the build stage
COPY --from=build /app/build/libs/*.jar ./app.jar

# Run the application
CMD ["java", "-jar", "app.jar"]
