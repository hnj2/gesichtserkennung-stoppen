import sqlite3
from flask import g
import uuid

DATABASE = 'sqlite.db'

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
    return db



def add_mail(mailaddress):
    c = get_db().cursor()
    guid = str(uuid.uuid4())
    print(guid)
    succ=c.execute('INSERT INTO mails (mailad, guid, confirmed) VALUES (?,?,?)',(mailaddress,guid,0))
    c.close()
    get_db().commit()
    return succ

def get_guid_for_mail(mailaddress):
    c = get_db().cursor()
    succ = c.execute('SELECT guid FROM mails WHERE mailad=(?)', (mailaddress,))
    if succ:
        guid = c.fetchone()[0]
        return guid
    else: 
        return False

def delete_mail(real_guid):
    c = get_db()
    succ = c.execute('DELETE FROM mails WHERE guid=?', (real_guid,))
    return succ  

def confirm_mail(real_guid):
    c = get_db().cursor()
    succ = c.execute('UPDATE mails set confirmed = 1 WHERE guid=?', (real_guid,))
    get_db().commit()
    return succ  

def export_mails():
    c = get_db().cursor()
    succ = c.execute('SELECT mailad FROM mails WHERE confirmed=1')
    return c.fetchall()



def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()