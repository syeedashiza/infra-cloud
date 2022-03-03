FROM ubuntu:20.04
RUN apt-get update
RUN apt-get -y upgrade
RUN apt install -y python3
RUN apt install -y git
RUN mkdir /usr/src/Project
WORKDIR /usr/src/
RUN git clone https://github.com/syeedashiza/infra-cloud.git
WORKDIR /usr/src/Project/Programs
RUN apk add --no-cache dos2unix
RUN dos2unix Calculator.py
RUN dos2unix Calculator_Test.py
RUN chmod +x Calculator.py
RUN chmod +x Calculator_Test.py
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
RUN git config --global user.email "syeedashiza@gmail.com"
RUN git add Programs
RUN git add HTML
RUN git commit -m "Initial Commit"
RUN git branch -M report
RUN git remote rm origin
RUN git remote add origin https://github.com/syeedashiza/infra-cloud.git
RUN git push -u origin report
CMD echo 'Report Generated'
