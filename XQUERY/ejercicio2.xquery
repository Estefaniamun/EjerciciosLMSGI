<marvel> {
for $superheroe in doc('superheroes.xml')/marvel/superheroe
   let $poder := $superheroe/@poderes
where contains($poder, 'fuerza')
return <superheroe>{ data($superheroe/@nombre) }</superheroe>
} </marvel>