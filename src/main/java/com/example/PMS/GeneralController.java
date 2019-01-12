package com.example.PMS;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GeneralController extends Functions
{

	@RequestMapping("/profile")
	public String facultyprofiledetails(HttpSession session)
	{
		if(isLoggedIn(session))
		{
			return "profile.jsp";
		}
		else
		{
			return "redirect:login";
		}
	}
}
