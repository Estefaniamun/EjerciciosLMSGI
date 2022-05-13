<marvel> {
for $superheroe in doc('superheroes.xml')/marvel/superheroe
   let $poder := $superheroe/@poderes
   let $amigo := $superheroe/@amigos
where contains(upper-case($poder), upper-case('fuerza')) and contains(upper-case($amigo),upper-case( 'Iron Man'))
return <superheroe>{ data($superheroe/@nombre) }</superheroe>
} </marvel>