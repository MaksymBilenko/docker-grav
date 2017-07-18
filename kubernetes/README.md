# Local minikube volume example
	
	#Start and check minikube instance

	minikube start
	kubectl version

	#Create PersistentVolume and PersistentVolumeClaim for grav data
	cd docker-grav/kubernetes
	
	kubectl create -f minikube-grav.pv.yaml #Optional for prod clusters
	kubectl create -f grav.pvc.yaml

	#Create deployment and service example
	kubectl create -f grav.deployment.yaml
	kubectl expose deployment grav-deployment --type=NodePort

# Open grav on minikube

	open http://$(minikube ip):$(kubectl get svc grav-deployment -o yaml | grep nodePort | awk '{ print $3 }')