<html>
<head>
    <title>OpenIDConnect Demo Application</title>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#goButton").click(makeRequest);
        });

        function makeRequest() {

            // Define properties
            var AUTH_ENDPOINT = document.getElementById("authorize_endpoint").value;
            var RESPONSE_TYPE = "id_token token";
            var CLIENT_ID = document.getElementById("client_id").value;
            var REDIRECT_URI = document.getElementById("redirect_uri").value;
            var SCOPE = document.getElementById("scope").value;
            var NONCE = 12345;

            // Build authorization request endpoint
            var requestEndpoint = AUTH_ENDPOINT + "?" +
                    "response_type=" + encodeURIComponent(RESPONSE_TYPE) + "&" +
                    "client_id=" + encodeURIComponent(CLIENT_ID) + "&" +
                    "redirect_uri=" + encodeURIComponent(REDIRECT_URI) + "&" +
                    "nonce=" + encodeURIComponent(NONCE) + "&" +
                    "scope=" + encodeURIComponent(SCOPE);

            // Send to authorization request endpoint

            window.location.replace(requestEndpoint);
        }
    </script>

    <style>
        table#request_form {
            border-collapse: separate;
            border-spacing: 0 10px;
        }

    </style>


</head>
<body>
<table align="center">
    <tr>
        <td><h2>BNP Portal</h2></td>
    </tr>
</table>

<br/>

<form onsubmit="makeRequest()">

    <table id="request_form" align="center">
        <tr>
            <!--td>Authorize Endpoint</td-->
            <td><input type="hidden" id="authorize_endpoint" name="authorize_endpoint" value="https://203.94.95.234:9444/oauth2/authorize" size="100" required/></td>
        </tr>
        <tr>
            <!--td>Client ID</td-->
            <td><input type="hidden" id="client_id" name="client_id" value="e32VYIxf48xzhSm8G7DOk52D_wga" size="100" required/></td>
        </tr>
        <tr>
            <!--td>Redirect URI</td-->
            <td><input type="hidden" id="redirect_uri" name="redirect_uri" value="http://localhost:8080/myapp/callback" size="100" required/></td>
        </tr>
        <tr>
            <!--td>Scope</td-->
            <td><input type="hidden" id="scope" name="scope" value="openid" size="100" required/></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button id="goButton" type="button" class="button">Login to Identity Server</button>
            </td>
        </tr>

    </table>

</form>
</body>
</html>
