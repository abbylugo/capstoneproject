--Created this code to use for categorization in Tableau.

IF DATEPART('hour',[Activity Hour]) >=5 AND
DATEPART('hour',[Activity Hour]) <12 then "Morning"

ELSEIF DATEPART('hour',[Activity Hour]) >=12 AND
DATEPART('hour', [Activity Hour]) <16 then "Afternoon"

ELSEIF DATEPART('hour',[Activity Hour]) >=16 AND
DATEPART('hour',[Activity Hour]) <18 then "Evening"
 
ELSEIF  DATEPART('hour',[Activity Hour]) >=18 AND
DATEPART('hour',[Activity Hour]) <24 then "Night"

ELSE "Early morning"
END