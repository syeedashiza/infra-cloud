FROM ubuntu:20.04
RUN apt-get update
RUN apt-get -y upgrade
RUN apt install -y python3
RUN apt install -y git
ADD . /usr/src/Project
WORKDIR /usr/src/Project/Programs
RUN python3 Calculator.py
RUN python3 Calculator_Test.py
RUN apt update
RUN apt install --yes python3-pip
RUN pip3 install coverage 
RUN coverage run Calculator_Test.py
RUN coverage report
RUN coverage xml 
RUN coverage html -d /usr/src/Project/HTML
WORKDIR /usr/src/Project/
RUN git init
RUN git config --global user.email "sachin.rawat@stryker.com"
RUN git add Programs
RUN git add HTML
RUN git commit -m "Initial Commit"
RUN git branch -M main
RUN git remote add origin https://sachinrawat1111:10India2020@github.com/sachinrawat1111/Project.git
RUN git push -u origin main
CMD echo 'Report Generated'
