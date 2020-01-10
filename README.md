# Website against face recognition in public space

this website unses
 * https://bulma.io as styling framework
 * **sass** to generate the css files
 * Bare html files that are appended to each other to form the final html files (ghetto templating)
 * No JS yet (which we need for collapsable burger menus for instances)

# Start website locally

### With docker
With docker installed simply run
```
docker-compose up
```
and do not forget to run `docker-compose down` afterwards.

This starts a webserver locally on port 8000.
Any changes to the files in `templates/` are immediately applied to the files in `html/`.

### Manually 

A local test server can simply be started using python:
```
python -m SimpleHTTPServer
```

To compile the **sass** code natively you need to install **node**, **npm** and run `npm install`.
Then you can compile the scss file to its css target by running:
```
npm run css-deploy
```
You can also start a watch script that continuously applies changes to the sass file by running:
```
npm start
```

To generate the html files in `html/` from the templates run:
```
make
```
You can use the command
```
watch make
```
to run this command periodically and keep your `html/` directory updated.

# Upload to live website

The shell script `./diff.sh` can be used to view the difference between the live website and your current html directory.

To update the live website run `./upload.sh`.
The script will ask you to confirm the changes.

