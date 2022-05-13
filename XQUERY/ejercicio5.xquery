<marvel> {
avg(for $superheroe in doc('superheroes.xml')/marvel/superheroe
   let $nivel := $superheroe/@nivel
  
return <media>{ data($nivel) }</media>
 )
} </marvel>