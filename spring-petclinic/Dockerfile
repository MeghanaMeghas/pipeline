FROM openjdk:17-jdk-slim as build

WORKDIR /app

RUN apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

# Install Trivy
RUN apt-get update \
&& apt-get install -y curl \
&& curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
