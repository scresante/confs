#!/usr/bin/python3

import smtplib
import socket
import datetime

sender = input('from: ')
receiver = input('to: ')
smtp_host = input('smtphost:' )
suser = input('smtp user: ')
spass = input('smtp pass: ')

message = f"""From: From Person <{sender}>
To: To Person <{receiver}>
Subject: SMTP e-mail test

This is a test e-mail message.
sent from {socket.gethostname()}
at {datetime.datetime.now()}

"""


try:
   smtpObj = smtplib.SMTP(host=smtp_host, local_hostname='tutti.ml', port=587)
   smtpObj.starttls()
   smtpObj.login(suser, spass)
   smtpObj.sendmail(sender, receiver, message)         
   print("Successfully sent email")
except smtplib.SMTPException as e:
   print(f"Error: unable to send email: {e}")

