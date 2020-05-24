# Deploy Jenkins master to Kubernetes Cluster or MiniKube

We'll use kubectl to apply the manifests  

`./scripts/deploy.sh`
You can always remove all this later with `./scripts/tear_down.sh`

Find your pod(s):
`kubectl get pods`

And tail logs to find your initial password, you'll see a message like "Please use the following password to proceed to installation"
`kubectl logs --follow hello-jenkins-76fcbcbc9b-z6vhv`

Visit the host
```
# in ingress yaml
hello-jenkins-ingress.yaml

# notice the host
host: jenkins.scottnelson.dev.k8s.pelotime.com`

# which will send you to
https://jenkins.scottnelson.dev.k8s.pelotime.com/login?from=%2F
```

Select install recommended plugins, create your user, and then you're done.

### Solved Issues (gotchas)
Can't delete any files due to user permissions,
https://stackoverflow.com/questions/50782740/why-is-jenkins-suddenly-unable-to-delete-a-workspace
Can't seem to recreate the k8s deploy from exported files
This was solved by always deleting workspace, specified in jenkinsfile (had to due with volume perms at the time)


## For k8s Plugin with Minikube
Needed to follow configuration on https://github.com/jenkinsci/kubernetes-plugin#configuration-on-minikube

The blazemeter guide was a little incomplete here, follow the above guide, also seemed to need to specify label in jenkinsfile

## Archive
### (Just for Posterity) First Way, Reversed Engineered Files from This
### create it

```
# should pin this
kubectl create deployment hello-jenkins --image=jenkins/jenkins:lts
```

### Make accessible via web
```
kubectl expose deployment hello-jenkins --type=NodePort --port=8080
```

### find that password
```
kubectl logs hello-jenkins
```

## open it up, once logs say its ready
`minikube service hello-jenkins`

## Potential Future work
Add CI like Travis, github actions, to test the setup on minikube
