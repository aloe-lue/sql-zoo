/*
MySQL
SQLZoo
DataWars, Data Science Practice Projects - LogoDataWars: Practice Data Science/Analysis with +100 Real Life Projects
NSS Tutorial
Field	Type
ukprn	varchar(8)
institution	varchar(100)
subject	varchar(60)
level	varchar(50)
question	varchar(10)
A_STRONGLY_DISAGREE	int(11)
A_DISAGREE	int(11)
A_NEUTRAL	int(11)
A_AGREE	int(11)
A_STRONGLY_AGREE	int(11)
A_NA	int(11)
CI_MIN	int(11)
score	int(11)
CI_MAX	int(11)
response	int(11)
sample	int(11)
aggregate	char(1)
National Student Survey 2012

The National Student Survey http://www.thestudentsurvey.com/ is presented to thousands of graduating students in UK Higher Education. The survey asks 22 questions, students can respond with STRONGLY DISAGREE, DISAGREE, NEUTRAL, AGREE or STRONGLY AGREE. The values in these columns represent PERCENTAGES of the total students who responded with that answer.

The table nss has one row per institution, subject and question.
*/
/*
1.
The example shows the number who responded for:

question 1
at 'Edinburgh Napier University'
studying '(8) Computer Science'
Show the the percentage who STRONGLY AGREE
*/
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'
/*
Calculate how many agree or strongly agree
2.
Show the institution and subject where the score is at least 100 for question 15.
*/
SELECT nss.institution, 
  nss.subject
  FROM nss
 WHERE question='Q15'
   AND SCORE >= 100
   
/*
Unhappy Computer Students
3.
Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'
*/
SELECT nss.institution,
       nss.score
  FROM nss
 WHERE nss.question='Q15'
   AND nss.subject='(8) Computer Science'
   AND nss.score < 50

/*
More Computing or Creative Students?
4.
Show the subject and total number of students who responded to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.

HINT
*/
SELECT nss.subject,
       SUM(nss.response)
  FROM nss
 WHERE question='Q22'
   AND nss.subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
 GROUP BY nss.subject

/*
Strongly Agree Numbers
5.
Show the subject and total number of students who A_STRONGLY_AGREE to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.

HINT
*/
SELECT nss.subject,
       SUM(response*A_STRONGLY_AGREE/100) AS strongly_agree_22
  FROM nss
 WHERE nss.question='Q22'
   AND nss.subject IN (
    '(8) Computer Science', 
    '(H) Creative Arts and Design'
  )
  GROUP BY nss.subject

/*
Strongly Agree, Percentage
6.
Show the percentage of students who A_STRONGLY_AGREE to question 22 for the subject '(8) Computer Science' show the same figure for the subject '(H) Creative Arts and Design'.

Use the ROUND function to show the percentage without decimal places.
*/
SELECT nss.subject,
       ROUND(SUM(nss.response*nss.A_STRONGLY_AGREE)/SUM(nss.response), 0) AS percentage
  FROM nss
 WHERE nss.question='Q22'
   AND subject IN (
    '(8) Computer Science',
    '(H) Creative Arts and Design'
   )
  GROUP BY nss.subject;
/*
Scores for Institutions in Manchester
7.
Show the average scores for question 'Q22' for each institution that include 'Manchester' in the name.

The column score is a percentage - you must use the method outlined above to multiply the percentage by the response and divide by the total response. Give your answer rounded to the nearest whole number.
*/
SELECT nss.institution,
       ROUND(SUM(nss.score * nss.response) / SUM(nss.response), 0) AS score
  FROM nss
 WHERE nss.question='Q22'
   AND (nss.institution LIKE '%Manchester%')
GROUP BY nss.institution

/*
Number of Computing Students in Manchester
8.
Show the institution, the total sample size and the number of computing students for institutions in Manchester for 'Q01'.
*/
SELECT institution,
       SUM(sample) AS total_sample,
       SUM(CASE WHEN subject = '(8) Computer Science' 
         THEN sample
         ELSE 0
        END) AS comp
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution
