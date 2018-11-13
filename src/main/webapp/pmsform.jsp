<!DOCTYPE html>
<html>
<head>
    <title>Performance Managment System</title>
</head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>
<div style="clear:left;background:darkblue; width:12%;"><p>2018-19</p></div>
<div style="clear:left;background:blue; width:12%;"><p>+</p></div>

<div style="background:darkblue; display:inline-block; width:80%;">

<h3>UPDATE   |  VIEW  |  DOWNLOAD</h3>
</div>


<div>
<h1>SET WEIGHT</h1>
    
<form action="/setweight">
<img src="weight_table.jpg"/><br>
<label class="label" for="branch">academic_weight</label>
<input type="text" name="academics_weight" required><br>
<label class="label" for="branch">research_weight</label>
<input type="text" name="research_weight" required><br>
<label class="label" for="branch">administration_weight</label>
<input type="text" name="administration_weight" required><br>
<input type="submit">
</form>
</div>

<div>
<h1>UPDATE</h1>
    
<form action="/selectcriteria">
  <select name="tablename">
    <option value="Academics and Academic Administration">Academics and Academic Administration</option>
    <option value="Research and Consultancy">Research and Consultancy</option>
    <option value="Administration">Administration</option>
  </select>
  <br><br>
  <input type="submit">
</form>
</div>

<div> 
	<c:if test ="${sessionScope.trm != null}">
	<table>
 	 <tr>
    	<th>S.No.</th>
    	<th>Parameters</th>
    	<th>Maximum Points</th>
    	<th>Expected Points</th>
    	<th>Points Earned</th>
    	<th>Comment</th>
    	<th>Proof</th>
  	 </tr>
	<c:forEach items="${trm}" var="t">    
    	<tr>
    		<td>${t.getRow_id()}</td>
    		<td>${t.getParameter()}</td>
    		<td>${t.getMaximum_points()}</td>
    		<td>0</td>
    		<td>0</td>
    		<td>null</td>
    		<td>null</td>
 		 </tr>
	</c:forEach>
	
	</table>
	
	</c:if>

</div>
</body>

</html>