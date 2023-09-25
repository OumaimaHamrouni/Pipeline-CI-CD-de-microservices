FROM openjdk:17-alpine
ARG JAR_FILE=target/product-service-1.0-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
RUN apk add --no-cache bash
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
ENTRYPOINT ["./wait-for-it.sh", "MSEureka.aliases:8761", "--", "java", "-jar"]
CMD ["/app.jar"]