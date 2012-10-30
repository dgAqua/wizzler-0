<% smtp_server_address = "smtp.livemail.co.uk"
On Error Resume Next
Response.Buffer = True
Set Jmail = Server.CreateOBject( "JMail.Message" )
Jmail.Logging = true
Jmail.Silent = true
JMail.From = "site@dm2g.com"
Jmail.AddRecipient "dareng@me.com"
JMail.Subject = "Form Response"
'Doing things this way helps retain the form field order
For i = 1 to (Request.Form.Count)
     body = body & Request.Form.Key(i) & ": " & Request.Form.Item(i) & vbcrlf
Next
JMail.Body = Body
JMail.Priority = 1
If Not Jmail.Send(smtp_server_address) then
     ' There was an error - print the error log
     Response.write ("Error:<br>" & Jmail.log)
Else
     ' The message has been sent - redirect to confirmation page
     Set JMail = Nothing
     Response.Redirect "../thankyou.htm"
End If
Set JMail = Nothing %>