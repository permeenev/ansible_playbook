#### what to do
## git clone https://github.com/daticahealth/java-tomcat-maven-example.git
## cd java-tomcat-maven-example
## docker build -t ghcr.io/permeenev/java-tomcat-maven-example:0.1 .
## echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
## docker push ghcr.io/permeenev/java-tomcat-maven-example:0.1
#### Second step - deploy
## docker run -p 8080:8080 ghcr.io/permeenev/java-tomcat-maven-example:0.1
#### 
FROM maven:3.8-jdk-11
RUN mkdir /java-tomcat-maven-example
COPY . /java-tomcat-maven-example
WORKDIR /java-tomcat-maven-example
RUN mvn clean package -DskipTests
CMD ["java", "-jar", "target/dependency/webapp-runner.jar"]