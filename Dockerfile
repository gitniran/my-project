FROM openjdk:8-jre-alpine
ARG LIB_NAME
RUN echo $LIB_NAME
ENV LIBS=${LIB_NAME}
COPY build/libs/$LIBS $LIBS
RUN ls $LIBS
RUN wget -O dd-java-agent.jar https://dtdg.co/latest-java-tracer
#COPY ./dd-java-agent.jar dd-java-agent.jar
ENTRYPOINT java -javaagent:dd-java-agent.jar -jar ${LIBS}



# EXPOSE 8080
# ARG LIB_NAME


# COPY ./build/libs/my-app-1.0-SNAPSHOT.jar /usr/app/
# WORKDIR /usr/app

# ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
