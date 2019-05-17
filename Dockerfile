# Docker image for CI of .NET Core code to Amazon Lambda

FROM mcr.microsoft.com/dotnet/core/sdk:2.2
MAINTAINER Samuel Barrera

RUN apt-get -y update      
RUN apt-get -y install zip
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -b ~/bin/aws