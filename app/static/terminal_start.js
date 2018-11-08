$('#terminal_container').height($(document).height());
var welcome_message = 'Welcome to joshuacook.me  0.2!';
welcome_message += '<br><br>';
welcome_message += '********************************************************************<br>'
welcome_message += '********************************************************************<br>'
welcome_message += '***&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
welcome_message += 'The website is now operational.'
welcome_message += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***<br>'
welcome_message += '***&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
welcome_message += 'Configuration has completed.'
welcome_message += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;***<br>'
welcome_message += '***&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
welcome_message += 'Access Data Science Reference via command, datascience.'
welcome_message += '***<br>'
welcome_message += '********************************************************************<br>'
welcome_message += '********************************************************************<br>'
welcome_message += '<br><br>';
welcome_message += "Type 'help' for usage.";
// welcome_message += 'Please login by typing: $ login username <br><br>If this is your first visit, you may select any username.'
$('#terminal_container').terminal('server', {hello_message : welcome_message });
