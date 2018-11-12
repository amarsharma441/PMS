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
		session.invalidate();
		return "redirect:login";
	}

}
