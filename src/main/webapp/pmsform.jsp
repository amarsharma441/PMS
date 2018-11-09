<!DOCTYPE html>
<html>
<head>
    <title>Performance Managment System</title>
</head>

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
    
<form action="/table">
  <select name="tablename">
    <option value="ACADEMICS and ACADEMIC ADMINISTRATION DETAILS">ACADEMICS and ACADEMIC ADMINISTRATION DETAILS</option>
    <option value="Research and Consultancy">Research and Consultancy</option>
    <option value="Administration">Administration</option>
  </select>
  <br><br>
  <input type="submit">
</form>
</div>
</body>

</html>