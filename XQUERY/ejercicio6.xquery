<marvel> {
for $superheroe in doc('superheroes.xml')/marvel/superheroe
    let $nombre:= data($superheroe/@nombre)
    let $poder:= data($superheroe/@poderes)
    let $amigos:= data($superheroe/@amigos)
    let $nivel:= data($superheroe/@nivel)
return <superheroe>
        <nombre> {$nombre} </nombre>
       <poderes>{$poder}</poderes>
        <amigos>{ $amigos}</amigos>
        <nivel>{ $nivel}</nivel>
            </superheroe>
} </marvel>