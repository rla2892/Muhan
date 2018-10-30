<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
body{
  margin: 0;
  padding: 0;
  border: 0;
  background-color: #4A8DCA;
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: 'Open Sans', 'Helvetica', sans-serif; 
  overflow: hidden;
  width: 100%;
  height: 100vh;
}

h1, h2, h3, h4, h5, h6{
  margin: 0;
  padding: 0;
  border: 0;
}

p{
  font-size: 10px;
  font-weight: 400;
  text-align: center;
}

a{
  color: #4A8DCA;
  text-decoration: none;
}

a:hover{
  text-decoration: underline;
}

.container{
  background-color: #f9f9f9;
  border-radius: 5px;
  padding: 40px 50px 40px 50px;
}

form h1{
  font-size: 24px;
  font-weight: 300;
  margin-bottom: 30px;
  text-align: center;
  text-transform: none;
}

form h2{
  color: #444;
  font-size: 10px;
  font-weight: 700;
  margin-bottom: 10px;
}

form input{
  border: 1px solid #ddd;
  border-radius: 3px;
  color: #888;
  display: block;
  font-size: 12px;
  margin-bottom: 30px;
  padding: 0px 10px;
  height: 35px;
  width: 250px;
}

form input:focus{
  outline: none;
  border-color: #ccc;
}

::-webkit-input-placeholder {
  color: #bbb;
  font-size: 10px;
  line-height: 16px;
}

form label{
  display: inline-block;
}

form button{
  background-color: #4A8DCA;
  border: none;
  border-radius: 3px;
  color: #fff;
  font-size: 12px;
  font-weight: 700;
  letter-spacing: .5px;
  height: 50px;
  width: 270px;
  margin-bottom: 20px;
  -webkit-transition: all 400ms ease;
          transition: all 400ms ease;
}

form button:focus{
  outline: none;
}

form button:hover{
  background-color: #67A84F;
}

</style>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>

<div class="container">
    <form>
      <h1>Create Your Account</h1>
     
        <h2>Your Name</h2>
<input type="text" name="yourname" autofocus>
      <h2>Email Address</h2>
<input type="text" name="email" placeholder="example@email.com">
      <h2>Password</h2>
<input type="password" name="password">
      <a href="https://dribbble.com/shots/1958400-Minimal-Login-and-Register-Forms"><button type="button" value="Submit">Sign Me Up!</button></a>
    </form>
  <p>Form styling practice. <a href="https://dribbble.com/shots/1958400-Minimal-Login-and-Register-Forms">This Dribbble Shot</a></p>
</div>