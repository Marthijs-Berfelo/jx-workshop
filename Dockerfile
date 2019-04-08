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
&& jx install dependencies -b -d kubectl helm kops \
&& echo '## Configure JX path variables' >> $USER_HOME/.bashrc \
&& echo ' export PATH=$PATH:$JX_BIN_DIR' >> $USER_HOME/.bashrc \
&& echo '## Configure  kubectl completion and alias (kc)' >> $USER_HOME/.bashrc \
&& echo ' source <(kubect completion bash)' >> $USER_HOME/.bashrc \
&& echo ' alias kc=kubectl' >> $USER_HOME/.bashrc \
&& echo ' complete -F __start_kubectl kc' >> $USER_HOME/.bashrc \
&& echo '## Configure helm completion' >> $USER_HOME/.bashrc \
&& echo ' source <(helm completion bash)' >> $USER_HOME/.bashrc \
&& echo '## Configure kops completion' >> $USER_HOME/.bashrc \
&& echo ' source <(kops completion bash)' >> $USER_HOME/.bashrc \

WORKDIR $USER_HOME
COPY jx-ws-create-cluster.sh .

USER $USER

VOLUME ["$PROJECTS_DIR"]
VOLUME ["${USER_HOME}/.config/gcloud"]

CMD ["tail", "-f", "/dev/null"]
