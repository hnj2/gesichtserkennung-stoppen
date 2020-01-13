#!/usr/bin/env python3.6
from flask import Flask
import db
from validate_email import validate_email



app = Flask(__name__)



@app.route("/")
def index():
    return "Hello World"

@app.route("/add/<string:mailaddress>")
def add(mailaddress):
	is_valid = validate_email(mailaddress)
	if not is_valid:
		return "Ungültige Mailadresse",500
	succ = db.add_mail(mailaddress)
	if succ:
		return "Erfolg!"
	else:
		return "Fehler",500

@app.route("/delete/<string:mailaddress>/<string:user_guid>")
def delete(mailaddress,user_guid):
	real_guid = db.get_guid_for_mail(mailaddress)
	if real_guid == user_guid:
		succ = db.delete_mail(real_guid)
		write_exports()
		if succ:
			return "Erfolgreich gelöscht!"
		else:
			return "Fehler beim löschen.",500
	else:
		return "Fehler beim löschen.",500		

@app.route("/confirm/<string:mailaddress>/<string:user_guid>")
def confirm(mailaddress,user_guid):
	real_guid = db.get_guid_for_mail(mailaddress)
	if real_guid == user_guid:
		succ = db.confirm_mail(real_guid)
		write_exports()
		if succ:

			return return redirect("https://gesichtserkennung-stoppen.de/mail_confirmed.html", code=302)
		else:
			return "Fehler beim Bestätigen.",500
	else:
		return "Fehler beim Bestätigen.",500

def init_db():
    with app.app_context():
        dbase = db.get_db()
        with app.open_resource('schema.sql', mode='r') as f:
            dbase.cursor().executescript(f.read())
        dbase.commit()

def write_exports():
	with open('confirmed_mails','w') as f:
		mails = db.export_mails()
		mails = "\n".join([m[0] for m in mails])
		print(mails)
		f.write(str(mails))

@app.teardown_appcontext
def close_connection(exception):
    dbs = db.get_db()
    if dbs is not None:
        dbs.close()

if __name__ == "__main__":
	init()
	app.run()
