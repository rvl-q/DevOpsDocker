# We need java 8
FROM openjdk:8

# The project should open in 8080 and you get a message by pressing the button.
EXPOSE 8080

WORKDIR /usr/src/app

# Copy all of the source code
COPY . .

# Install...
# Build the project with ./mvnw package
RUN ./mvnw package

# And finally the command to run the application
# Run with java -jar ./target/docker-example-1.1.3.jar
CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]