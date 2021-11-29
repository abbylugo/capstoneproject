--Dataset from https://www.kaggle.com/arashnic/fitbit--
--Google Data Analytics Capstone project--
--Purpose for this code is to use SQL to query data in BigQuery and join on one dataset for Tableau.
SELECT
A.Id,
TIMESTAMP(A.ActivityDate) AS is_timestamp,
A.TotalSteps,
A.TotalDistance,
A.Calories,
SAFE.PARSE_TIMESTAMP("%c", H.Time),
H.Value,
SAFE.PARSE_TIMESTAMP("%c",S.SleepDay),
S.TotalMinutesAsleep,
S.TotalTimeinBed,
SAFE.PARSE_TIMESTAMP("%c",W.Date),
W.WeightPounds,
W.BMI,
SAFE.PARSE_TIMESTAMP("%c",M.ActivityMinute),
M.Mets 
FROM
`carbon-feat-332220.bellabeat.dailyActivity_merged` A
LEFT JOIN
`carbon-feat-332220.bellabeat.heartrate_seconds_merged` H
ON
A.Id = H.Id
LEFT JOIN
`carbon-feat-332220.bellabeat.sleepDay_merged` S
ON
A.Id = S.Id
LEFT JOIN
`carbon-feat-332220.bellabeat..weightLogInfo_merged` W
ON
A.Id = W.Id
LEFT JOIN
`carbon-feat-332220.bellabeat.minuteMETsNarrow_merged` M
ON
A.Id = M.Id;

--Added after inital query running over 1hr
WHERE A.Id = 8877689391
 OR A.Id = 8053475328
 OR A.Id = 1503960366
 OR A.Id = 2022484408
 OR A.Id = 4388161847
 OR A.Id = 3977333714
 OR A.Id = 6962181067
 OR A.Id = 7007744171
 OR A.Id = 7086361926
 OR A.Id = 8378563200;

--Join for complete table to analyze in Tableau
SELECT
A.Id,
TIMESTAMP(A.ActivityDate) AS activity_ts, --ts means timestamp
A.TotalSteps,
A.TotalDistance,
A.VeryActiveMinutes,
A.FairlyActiveMinutes,
A.LightlyActiveMinutes,
A.SedentaryMinutes,
A.Calories,
S.SleepDay,
S.TotalMinutesAsleep,
S.TotalTimeinBed,
W.weightlog_is_timestamp2,
W.WeightPounds,
W.BMI,
W.LogId AS weight_log_id,
MS.is_timestamp AS minute_sleep_ts,
MS.logId AS minute_sleep_log_id
FROM
`carbon-feat-332220.bellabeat.dailyActivity_merged` A
LEFT JOIN
`carbon-feat-332220.bellabeat.cl_sleepDay_merged` S
ON
A.Id = S.Id
LEFT JOIN
`carbon-feat-332220.bellabeat.cl_weightLogInfo_merged` W
ON
A.Id = W.Id
LEFT JOIN 
`carbon-feat-332220.bellabeat.cl_minuteSleep_merged` MS
ON
A.Id = MS.Id;




