# The csvserver assignment
### Part1
1. Creat the script gencsv.sh to generate a file named inputFile.
```sh
cat gencsv.sh
./gencsv.sh
```
2. Running the script without any arguments, will generate the file inputFile with 10 such entries in current directory.
```sh
cat inputFile
```
 > Note: We can extend this script to generate any number of entries, for 100000 entries replace $(seq 10) to $(seq 100000) in gencsv.sh.
 
 3. Run the container in the background with file generated inputFile available inside the container using below command.
 ```sh
 docker run -d -v <inputFile path here>:/csvserver/inputdata infracloudio/csvserver:latest
 ```
4. the port on which the application is listening is 9300 cross check by exec into the container.
5. To access the application on the host at http://localhost:9393 and to set the env variable CSVSERVER_BORDER=Orange run the container with below command.
```sh
docker run -d -p 127.0.0.1:9393:9300 -v <inputFile path here>:/csvserver/inputdata -e CSVSERVER_BORDER='Orange' infracloudio/csvserver:latest
```
#####  The application is accessible at http://localhost:9393, it has 10 entries from inputFile and the welcome note with orange color border.

