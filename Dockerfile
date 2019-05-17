FROM mcr.microsoft.com/dotnet/core/sdk:2.2

MAINTAINER Samuel Barrera

LABEL version="1.0"
LABEL description="Docker image for CI of .NET Core code to Amazon Lambda"

RUN apt-get clean
RUN apt-get -y update
RUN apt-get -y install zip
RUN dotnet tool install -g dotnet-serve
ENV PATH="${PATH}:/root/.dotnet/tools"
RUN dotnet tool install -g dotnetsay
RUN dotnetsay
RUN dotnet tool install -g Amazon.Lambda.Tools
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -b ~/bin/aws