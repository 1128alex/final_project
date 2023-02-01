<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-4">
		<h2 class="mt-3 font-weight-bold">Login</h2>
		<form method="post" action="/user/sign_in">
			<div>
				<label>Id</label> <input type="text" name="userId"
					class="form-control" placeholder="Input your Id">
			</div>
			<div class="mt-2">
				<label>Password</label> <input type="password" name="password"
					class="form-control" placeholder="Input your Password">
			</div>
			<div class="d-flex justify-content-between">
				<div class="mt-2">
					Don't have an Id? <a href="/univ/user/sign_up">Sign Up</a>
				</div>
				<button type="submit" class="btn button mt-3" id="loginBtn">Login</button>
			</div>
		</form>
	</div>
</div>