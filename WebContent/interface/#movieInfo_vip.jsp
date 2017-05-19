<title>${movie.name}</title>
<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>

<div id="content">

    

    <table id="t01">
        <thead>
            <tr>
            	<th>Movie</th>
                <th>Info</th>
           </tr>
        </thead>
        <tbody>
        
        <td>${movie.name}</br><hr><img src="http://localhost/img/movie/${movie.img}"></td>
        <td>Year: ${movie.year}</br><hr>Type: ${movie.type}</br><hr>${movie.des}</br><hr>${movie.view} views</br><hr>
        <input type="button" value="Watch this movie" onclick="window.location=('urlMovie?code=${movie.id}');window.open('http://localhost/movie/${movie.url}.mp4');" />
        </br><hr>
        <button onclick="goBack()">Back to Movie list</button>
        </td>
                               

       </tbody>
    </table>
	
    </div>