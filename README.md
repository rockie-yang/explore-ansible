# Explore Ansible

Test ansible features and record diary

    docker build -t ansible .

    docker run -it --rm -p 8888:8888 --name ansible -v `pwd`:/root ansible jupyter notebook --notebook-dir=/root/ --ip='*' --port=8888 --no-browser --allow-root --NotebookApp.token=''

## Python environment

    virtualenv -p python3 awsenv
    source awsenv/bin/activate

    pip install boto3  



ansible galaxy to generate folder structure    


http://localhost:8080/api/v1/clusters/Sandbox/configurations?type=ranger-admin-site

&tag=version1535037823672

Get all clusters

	http://localhost:8080/api/v1/clusters


Get cluster Sandbox

	http://localhost:8080/api/v1/clusters/Sandbox


Get all configurations
	http://localhost:8080/api/v1/clusters/Sandbox/configurations

Get all version information of ranger-admin-site

	http://localhost:8080/api/v1/clusters/Sandbox/configurations?type=ranger-admin-site


	http://localhost:8080/api/v1/clusters/Sandbox/configurations?type=ranger-admin-site&tag=TOPOLOGY_RESOLVED


	http://localhost:8080/api/v1/clusters/Sandbox/configurations?type=admin-properties&tag=TOPOLOGY_RESOLVED