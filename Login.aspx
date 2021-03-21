<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function validate() {

            if (document.getElementById("<%=txtName.ClientID%>").value == "") {
                alert("Please Insert Name");
                document.getElementById("<%=txtName.ClientID%>").focus();
                return false;
            }

            if (document.getElementById("<%=txtcontact.ClientID%>").value == "") {
                alert("Please Insert Contact Number");
                document.getElementById("<%=txtcontact.ClientID%>").focus();
                return false;
            }

            if (document.getElementById("<%=txtEmail.ClientID%>").value == "") {
                alert("Please Insert Email");
                document.getElementById("<%=txtEmail.ClientID%>").focus();
                return false;
            }

            if (document.getElementById("<%=txtName.ClientID%>").value == "") {
                alert("Please Insert Name");
                document.getElementById("<%=txtName.ClientID%>").focus();
                return false;
            }

            if (document.getElementById("<%=txtcity.ClientID%>").value == "") {
                alert("Please Insert Number");
                document.getElementById("<%=txtcity.ClientID%>").focus();
                return false;
            }

            var email = document.getElementById("txtEmail").value;
            var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            if (!expr.test(email)) {
                alert("Please Enter Valid Email ID");
                document.getElementById("<%=txtEmail.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        * {
            box-sizing: border-box;
        }

        /* Full-width input fields */
        input[type=text], input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }

        /* Set a style for all buttons */
        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }

            button:hover {
                opacity: 1;
            }

        /* Extra styles for the cancel button */
        .cancelbtn {
            padding: 14px 20px;
            background-color: #f44336;
        }

        /* Float cancel and signup buttons and add an equal width */
        .cancelbtn, .signupbtn {
            float: left;
            width: 50%;
        }

        /* Add padding to container elements */
        .container {
            padding: 16px;
        }

        /* Clear floats */
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }

        /* Change styles for cancel button and signup button on extra small screens */
        @media screen and (max-width: 300px) {
            .cancelbtn, .signupbtn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="container" style="WIDTH: 700PX; MARGIN-LEFT: 400PX;">
                <h1>Sign Up</h1>
                <p>Please fill in this form to join with us.</p>
                <hr>

                <label for="email"><b>Name</b></label>
                <asp:TextBox runat="server" placeholder="Enter Name" ID="txtName"></asp:TextBox>


                <label for="psw"><b>Contact</b></label>
                <asp:TextBox runat="server" placeholder="Enter Contact" ID="txtcontact"></asp:TextBox>



                <label for="psw-repeat"><b>Email</b></label>
                <asp:TextBox runat="server" placeholder="Enter Email" ID="txtEmail"></asp:TextBox>

                <label for="psw-repeat"><b>Address</b></label>
                <asp:TextBox runat="server" placeholder="Enter Address" ID="txtcity"></asp:TextBox>

                <table>
                    <tr>
                        <td>
                            <label for="psw-repeat"><b>Upload Adhar</b></label>
                        </td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="psw-repeat"><b>Upload PAN</b></label>
                        </td>
                        <td>
                            <asp:FileUpload ID="FileUpload2" runat="server" />
                        </td>

                    </tr>

                </table>










                <div class="clearfix">
                    <asp:Button runat="server" ID="btnSave" Style="background-color: #4CAF50; border: none; color: white; padding: 12px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin-left: 250px;"
                        OnClientClick=" return validate()" Text="SAVE DATA" OnClick="btnSave_Click" />





                </div>
            </div>

            <div>
            </div>
            <asp:Label runat="server" ID="lblmsg"></asp:Label>
        </div>
    </form>
</body>
</html>
