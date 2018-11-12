package com.example.PMS;

import javax.servlet.http.HttpSession;

public class Functions 
{
	public boolean isLoggedIn(HttpSession session)
	{
		if(session.getAttribute("obj") != null)
		{
			return true;
		}
		
		else
		{
			return false;
		}
	}
}
