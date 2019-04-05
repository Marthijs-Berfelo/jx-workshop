# Getting source repositories
During the WS several sources are used, these sources need to be cloned.

1. Clone this repository
```bash
mkdir ~/jx-workshop
cd ~/jx-workshop
git clone [this-repo-clone-url]
```

2. Create the following dir structure
  ```bash
  mkdir -p ~/jx-workshop/Development
  mkdir -p ~/jx-workshop/Docker-Volumes
  mkdir -p ~/jx-workshop/Kube-Volumes/snacks-db
  ```

3. Clone source repositories
  - Change dir to Development
    ```bash
    cd ~/jx-workshop/Development
    ```
  - Clone repositories
    ```bash
    git clone git@github.com:Marthijs-Berfelo/jx-ws-snacks.git
    git clone git@github.com:Marthijs-Berfelo/jx-ws-docker.git
    git clone git@github.com:Marthijs-Berfelo/jx-ws-kube.git
    ```

Notes:
  - Windows: use powershell if you don't want to adjust the '\~', for command prompt replace the '\~' with {path to user home}.
  - If you prefer a different root for the workshop files, make sure to replace the '\~' with this custom path. Also ensure the *-Volumes dirs are owned by your system-user.
