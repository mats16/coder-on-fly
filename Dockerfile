FROM mcr.microsoft.com/azure-cli:azurelinux3.0

# Install terraform
COPY --from=hashicorp/terraform:1.11  /bin/terraform /usr/local/bin/terraform

# Install coder
COPY --from=ghcr.io/coder/coder:v2.22.1 /opt/coder /opt/coder

# Add coder user
RUN echo "coder:x:1000:1000::/home/coder:/bin/bash" >> /etc/passwd && \
    echo "coder:x:1000:" >> /etc/group && \
    install -d -m 0755 -o 1000 -g 1000 /home/coder

# Set coder user
USER coder
WORKDIR /home/coder

# Copy local Azure credentials
ADD --chown=1000:1000 .azure /home/coder/.azure

ENV PATH=$PATH:/opt
ENV HOME=/home/coder
ENV CODER_HTTP_ADDRESS=0.0.0.0:3000

EXPOSE 3000
CMD /opt/coder server --access-url https://$FLY_APP_NAME.fly.dev
