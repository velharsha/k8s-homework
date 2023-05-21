
# k8s-homework

**Pre-requisites:**

 - Git knowledge
   
 -  k8s Knowlegde
   
  - CI/CD
   
 -  docker installed on your system

  

***I am unable to go into much details on every step as time constraint of 48 hrs to deliver this.(I can explain in the interview)***

  
  

## How to use this repository to build the Docker image and use template to deploy it on k8s cluster.

  

### Build the Image.(these steps are already done and image is available in pub repo)

**Step 1:** Clone the repository and make sure you are on main branch.

    $ git clone https://github.com/velharsha/k8s-homework.git

  

**Step 2:** build the docker image

    $ cd k8s-homework

    $ sudo docker build -t flask-app:v1.0 .

  

Step3: Push the docker image

    $ sudo docker push <reponame>/flask-app:v1.0

  

### Use the app.yml file to deploy the application onto a k8s cluster

  

 - The file app.yml consists of a Deployment, service and a Secret
   object, where i defined the environment variables as
   db_root_password, db_name, MYSQL_SERVICE_HOST, MYSQL_SERVICE_PORT in
   the file which will be used as input for the application.
   
     
   
-  I have included a servie object linked to this deployment which helps
   to make communications between MYSQL database and the application on
   the Port 5000, lables helps to identify the realtion betweeen
   deployment and the service.

  

- I have included a secret object to be deployed in the same namespace, which will be the password for connecting to the database.

  

- The built image is already included in the deployment file so no need to make any chnages to the image.

### You can also deploy the app using the Helm chart with below commands

    $ cd k8s-worker/

     $ helm install test-userpai -f ./test-userapi/values.yaml ./test-userapi/ -n test-userapi


**Step 1:** To deploy the application

we need a k8s cluster and we need a namespace to be deployed already with name "test-userapi". *Kubectl* must be configured to access the k8s cluster.

  

run the below command to deploy the Python-Flask application on the k8s cluster of your choice.

  

    $ kubectl create -f app.yml -n test-userapi

  

This application might throw erros connecting to database as we are not deploying a database here.

we can use Helm chart for Mysql to deploy it in the same namespace and connect the app with it.

  

For example: we can use this command to deploy the database

    helm install my-mysql stable/mysql \
    
    --set mysqlRootPassword=<root_password> \
    
    --set mysqlUser=<username> \
    
    --set mysqlPassword=<password> \
    
    --set mysqlDatabase=<database_name>

  
  

To delete the deploy application you can run the following commands

  

    $ kubectl delete -f app.yml -n test-userapi
