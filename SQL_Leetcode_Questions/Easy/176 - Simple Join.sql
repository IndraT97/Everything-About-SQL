select p.FirstName, p.LastName,a.city,a.state 
from person p 
join address a 
using (PersonId);
