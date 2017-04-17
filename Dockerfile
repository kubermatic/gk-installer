FROM fedora:25

# Install heketi-cli
RUN ["/usr/bin/dnf","install","heketi-client","unzip","python","-y"]

# Install kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/v1.6.1/bin/linux/amd64/kubectl /usr/local/bin/

# Make kubectl executable
RUN ["chmod","+x","/usr/local/bin/kubectl"]

# Add git repo
ADD https://github.com/gluster/gluster-kubernetes/archive/v1.1.zip /tmp/

# Create installer directory
RUN ["mkdir","-p","/opt/gluster-kubernetes/"]

# Extract
RUN ["unzip","/tmp/v1.1.zip","-d","/opt/gluster-kubernetes/"]

# Symlink install script
RUN ["ln","-s","/opt/gluster-kubernetes/gluster-kubernetes-1.1/deploy/gk-deploy","/usr/local/bin/gk-deploy"]

# Set default command
CMD ["gk-deploy","-g","-y","-v","-c","/usr/local/bin/kubelet","/etc/gk-deploy/topology.json"]
