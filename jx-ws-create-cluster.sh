jx create cluster gke \
--cluser-name jx-workshop \
--docker-registry eu.gcr.io \
--docker-registry-org jx-ws \
--default-admin-password build_together \
--default-admin-username knowledge \
--default-environment-prefix jx-ws \
--namespace share \
--git-provider-url https://github.com \
--git-api-token e879d254d8bcebdc0d1a74e4bbe9c289cb39ca30
--git-private \
--domain workshop.hybrit.io \
--git-username Marthijs-Berfelo
--environment-git-owner Marthijs-Berfelo
