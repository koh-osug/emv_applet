# Start with a base image that includes OpenJDK
FROM amazoncorretto:17-alpine

# Install dependencies
RUN apk update && \
    apk add wget unzip git apache-ant

# Copy build.xml into the project directory
COPY build.xml /emv_applet/
COPY emv /emv_applet/emv
COPY sdks /emv_applet/sdks

# Set working directory
WORKDIR /emv_applet

# Build the applet using Ant
RUN ant

# Expose the CAP file
CMD ["cp", "/emv_applet/build/emv.cap", "/output"]
