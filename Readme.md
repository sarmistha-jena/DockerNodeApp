#Manual process to build the project 
npm install
npm run list
npm run build
node dist/app.js
curl http://localhost:3000

#Builder pattern
Create separate dockerfiles for "lint and build" and then copy the executable *.js to local machine and then add the file to deployment dockerfile
It is done using shell script
Disavantages- maintenance, time consuming

#Multistage
Single docker image, fast execution, no need to copy artifacts/executables to local system
