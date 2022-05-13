<marvel> {
for $superheroe in doc('superheroes.xml')/marvel/superheroe
   let $poder := $superheroe/@poderes
   let $amigo := $superheroe/@amigos
where contains($poder, 'fuerza') and contains($amigo, 'Iron Man')
return <superheroe>{ data($superheroe/@nombre) }</superheroe>
} </marvel>