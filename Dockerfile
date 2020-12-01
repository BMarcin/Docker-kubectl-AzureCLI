FROM docker:dind

RUN apk update
RUN apk upgrade

#install wget
RUN apk add --no-cache wget

# install AzureCLI
RUN apk add --no-cache bash make py-pip
RUN apk add --no-cache --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev curl git
RUN pip install azure-cli

# install kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# install dvc
RUN pip install dvc
RUN dvc --version

# clean
RUN apk del --purge build
