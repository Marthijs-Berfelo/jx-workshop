FROM google/cloud-sdk:241.0.0-slim
ENV USER jx-user
ENV USER_HOME /home/$USER
ENV JX_BIN_DIR $USER_HOME/.jx/bin
ENV PROJECTS_DIR $USER_HOME/Development
RUN groupadd -r $USER \
&& useradd -ms /bin/bash -g $USER $USER \
&& mkdir -p /etc/sudoers.d \
&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER \
&& mkdir -p $JX_BIN_DIR \
&& mkdir -p $PROJECTS_DIR \
&& curl -L https://github.com/jenkins-x/jx/releases/download/v1.3.1089/jx-linux-amd64.tar.gz | tar xzv -C $JX_BIN_DIR \
&& export PATH=$PATH:$JX_BIN_DIR \
&& echo 'export PATH=$PATH:$JX_BIN_DIR' >> $USER_HOME/.bashrc

WORKDIR $USER_HOME
COPY jx-ws-create-cluster.sh .

USER $USER

VOLUME ["$PROJECTS_DIR"]
VOLUME ["${USER_HOME}/.config/gcloud"]

CMD ["tail", "-f", "/dev/null"]
