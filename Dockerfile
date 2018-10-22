FROM sigbilly/yart-builder:stable as build
LABEL maintainer="Germain GAU <germain.gau@gmail.com>"
WORKDIR /app
ADD . /app
RUN cargo build --release

FROM ubuntu:bionic
COPY --from=build /app/target/release/yart /
ENTRYPOINT ["/yart"]
