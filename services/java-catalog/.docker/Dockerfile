FROM gradle:8.2-jdk17 AS build

WORKDIR /app
COPY . .
RUN gradle clean build

FROM openjdk:21-ea-17-slim-bullseye

WORKDIR /app
COPY --from=build /app/build/libs/blog-0.0.1-SNAPSHOT.jar /app/app.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
