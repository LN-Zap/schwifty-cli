FROM debian:bookworm-slim

# Create a group and user
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

WORKDIR /app

# Change the ownership of the /app directory to the appuser
RUN chown -R appuser:appgroup /app

# Switch to the appuser
USER appuser

COPY ./dist/linux/schwifty .

ENTRYPOINT ["./schwifty"]