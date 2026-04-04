# Use latest stable channel SDK.
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

# Copy app source code and AOT compile app.
COPY . .
RUN dart compile exe bin/server.dart -o /app/bin/server

# Build minimal serving image.
# Using debian-slim to ensure all Dart AOT dependencies (libc, etc) are present.
FROM debian:bookworm-slim

# Copy the compiled binary from the build stage.
COPY --from=build /app/bin/server /app/bin/server

# Ensure the server is listening on the standard Cloud Run port.
ENV PORT=8080
EXPOSE 8080

# Start server.
CMD ["/app/bin/server"]
