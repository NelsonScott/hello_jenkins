# How I deployed Jenkins on MiniKube

Use kubectl to apply the deployment, then service.  

## Known Issues
Can't delete any files due to user permissions,
https://stackoverflow.com/questions/50782740/why-is-jenkins-suddenly-unable-to-delete-a-workspace
Can't seem to recreate the k8s deploy from exported files
This was solved by always deleting workspace, specified in jenkinsfile (had to due with volume perms at the time)


## For k8s Plugin with Minikube
Needed to follow configuration on https://github.com/jenkinsci/kubernetes-plugin#configuration-on-minikube

The blazemeter guide was a little incomplete here, follow the above guide, also seemed to need to specify label in jenkinsfile

# First Way, Reversed Engineered Files from This
## create it

```
# should pin this
kubectl create deployment hello-jenkins --image=jenkins/jenkins:lts
```

## Make accessible via web
```
kubectl expose deployment hello-jenkins --type=NodePort --port=8080
```

## find that password
```
kubectl logs hello-jenkins
```

## open it up, once logs say its ready
`minikube service hello-jenkins`
