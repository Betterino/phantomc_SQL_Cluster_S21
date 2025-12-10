CREATE VIEW v_persons_female
as select *
from person where gender = 'female';
CREATE VIEW v_persons_male
as select *
from person where gender = 'male';