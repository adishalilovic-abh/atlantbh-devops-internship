FROM postgres:16-alpine
# Use the PostgreSQL 9.6.0 image as the base image
#FROM postgres:9.6.0

# Set environment variables
ENV POSTGRES_PASSWORD=petclinic
ENV POSTGRES_DB=petclinic

# Expose the default PostgreSQL port
EXPOSE 5432

#CMD ["postgres", "-D", "FOREGROUND"]

# (Optional) You can specify a custom name for your container here, but it's not the same as the 'docker run' --name flag
# This is just a label for the container, and the container will still have a generated name when it's run
#LABEL name=postgres-petclinic
