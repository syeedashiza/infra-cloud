FROM ubuntu:20.04
RUN apt-get update
RUN apt-get -y upgrade
RUN apt install -y python3
RUN apt install -y git
RUN mkdir /usr/src/Project
WORKDIR /usr/src/
RUN git clone https://github.com/sachinrawat1111/Project.git
WORKDIR /usr/src/Project/Programs
RUN chmod +x Calculator.py
RUN chmod +x Calculator_Test.py
RUN python3 Calculator.py
RUN python3 Calculator_Test.py
RUN apt update
RUN apt install --yes python3-pip
RUN pip3 install coverage 
RUN coverage run Calculator_Test.py
RUN coverage report
RUN coverage xml -d /usr/src/Project/report
RUN coverage html -d /usr/src/Project/HTML
WORKDIR /usr/src/Project/
RUN git init
RUN git config --global user.email "syeedashiza@gmail.com"
RUN git add Programs
RUN git add HTML
RUN git commit -m "Initial Commit"
CMD echo 'Report Generated'
