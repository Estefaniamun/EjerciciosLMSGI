<html> 
    <head><title>Marvel</title></head>
    <body>
  
{
for $superheroe in doc('superheroes.xml')/marvel/superheroe
    let $nombre:= data($superheroe/@nombre)
    let $poder:= data($superheroe/@poderes)
    let $amigos:= data($superheroe/@amigos)
    let $nivel:= data($superheroe/@nivel)
   
return <table>

        <tr>
            <td>{$nombre}</td>
            <td>{$poder}</td>
            <td>{$amigos}</td>
            <td>{$nivel}</td>

        </tr>
</table>


}</body>
</html>