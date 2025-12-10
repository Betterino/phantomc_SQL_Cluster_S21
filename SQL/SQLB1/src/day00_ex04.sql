select concat(name,' (age:',age,',gender:''',gender,''',address:''',address,''')') as full_name
from
    person
order by
    1