<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html>
<head>
    <title>OpenIDConnect Demo Application</title>
</head>
<body>


<table align="center">
    <tr>
        <td><h2>Home</h2></td>
    </tr>
</table>

<h2 id="username"></h2>
<h2 id='id_token_value'></h2>
<h3 id="roles"></h3>
<div id="links"></div>


<script>

    if (window.location.hash) {

        var data = window.location.hash;
        data = data.substr(1, data.length);
        var params = data.split('&');

        var i;
        var id_token;
        var claims;
        var username;
        var roles;
        var roleList;

        for (i = 0; i < params.length; i++) {

            if (params[i].startsWith("id_token=")){
                //alert(params[i]);
                id_token = params[i].substr("id_token=".length, params[i].length);
                // alert(id_token);

                claims = atob(id_token.split('.')[1]);

                var jsonobj = JSON.parse(claims);

                username = jsonobj.sub;
                document.getElementById('username').innerText = 'Welcome ' + username;

                roles = jsonobj.role;
                document.getElementById('roles').innerText = 'You have roles: ' + roles;


                var linkString = "";

                if(roles.valueOf().includes('Internal/store')){
                    linkString = linkString + "<a href='https://203.94.95.234:9443/store'>Visit GREG Store</a><br>";

                }

                if(roles.valueOf().includes('Internal/publisher')){
                    linkString = linkString + "<a href='https://203.94.95.234:9443/publisher'>Visit GREG Publisher</a><br>";
                }


                document.getElementById('links').innerHTML = linkString;


                //document.getElementById('id_token_value').innerText = claims;

                break;
            } else {
                continue;
            }
        }
    }
</script>
</body>
</html>
