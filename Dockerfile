# -------- Stage 1: Build --------
FROM eclipse-temurin:21-jdk AS builder

WORKDIR /api

# Copy only pom.xml first to cache dependencies
COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

RUN ./mvnw dependency:go-offline -B

# Copy source and build
COPY src src
RUN ./mvnw clean package -DskipTests

# -------- Stage 2: Run --------
FROM eclipse-temurin:21-jre-alpine

# Create non-root user
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

WORKDIR /api

# Copy jar from builder
COPY --from=builder /api/target/*.jar api.jar

# Expose application port
EXPOSE 9090

# Use JVM optimizations for containers
ENTRYPOINT ["java", "-XX:+UseContainerSupport", "-XX:MaxRAMPercentage=75.0", "-jar", "api.jar"]