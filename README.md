# Explore Ansible

Test ansible features and record diary

    docker build -t ansible .

    docker run -it --rm -p 8888:8888 --name ansible -v `pwd`:/root ansible jupyter notebook --notebook-dir=/root/ --ip='*' --port=8888 --no-browser --allow-root --NotebookApp.token=''

## Python environment

    virtualenv -p python3 awsenv
    source awsenv/bin/activate

    pip install boto3  