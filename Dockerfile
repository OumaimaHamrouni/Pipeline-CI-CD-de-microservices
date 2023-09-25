FROM openjdk:17-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
RUN apk add --no-cache bash
CMD ["java","-jar","/app.jar"]

