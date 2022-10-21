FROM public.ecr.aws/docker/library/alpine:3.15.4@sha256:4edbd2beb5f78b1014028f4fbb99f3237d9561100b6881aabbf5acce2c4f9454
ARG TERRAFORM_VERSION="1.1.8"

WORKDIR /tmp

#Install tfenv for terraform
RUN apk add --update --no-cache openssl git bash curl unzip sudo && \
    git clone https://github.com/tfutils/tfenv.git /usr/bin/.tfenv && \
    ln -s /usr/bin/.tfenv/bin/* /usr/bin && \
    chmod +x /usr/bin/tfenv

#Install terraform
RUN tfenv install $TERRAFORM_VERSION

#Install tflint
RUN curl https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

ENTRYPOINT [""]
