# Website against face recognition in public space
this website unses
 * https://bulma.io as styling framework
 * No JS yet (which we need for collapsable burger menus for instances)

# Start website locally
With docker installed simply run
```
docker-compose up
```
and do not forget to run `docker-compose down` afterwards.


To run node natively use the watch script defined in package.json
`npm start`
Start a local Server
`python -m SimpleHTTPServer`


Now start coding and see changes in http://localhost:8000
You will need to execute `./apply.sh` to make changes to `index.html` and `aufruf.html` visible.
The apply script also generates the `html.zip`.
