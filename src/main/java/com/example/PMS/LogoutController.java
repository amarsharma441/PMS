package com.example.PMS;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController
{
	
	@RequestMapping("/logout")
	public String Logout(HttpSession session)
	{
		//session.removeAttribute("obj");
		session.invalidate();
		System.out.println("LOGOUT SUCCESSFULL");
		return "redirect:login";
	}

}
