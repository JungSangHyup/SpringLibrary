<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LOGIN</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        
        <div class="wrap">
            <div class="form-wrap">
                <div class="container">
                    <h3>LOGIN</h3>  
                </div>
                
                
                <form id="login" action="" class="input-group">
                    <input type="text" class="input-field" placeholder="User name or Email" required>
                    <input type="password" class="input-field" placeholder="Enter Password" required>
                    <input type="checkbox" class="checkbox"><span>로그인 유지</span>
                    <button class="submit">Login</button>
                </form>
            </div>
            
        </div>
        <script>
            var x = document.getElementById("login");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                z.style.left = "0";
            }

        </script>
    </body>
</html>