connect to SE3DB3;



-- q1
SELECT COUNT(*) FROM PLAYER_MAST; 

-- q2
SELECT * FROM PLAYER_MAST;

--q3
--q3p1
SELECT COUNT(DISTINCT TEAM_ID) FROM MATCH_DETAILS;
--q3p2
SELECT COUNT(*) FROM GOAL_DETAILS WHERE GOAL_SCHEDULE = 'ET';
--q3p3
select count(*) from goal_details where goal_schedule = 'ST';
--q3p4
select count(*) from goal_details where goal_schedule = 'NT';
--q3p5
select count(*) from player_booked where play_schedule = 'ST';
--q3p6
select count(*) from player_booked where play_schedule = 'ET';

-- q4
--q4p1
select min(play_date) from match_mast;
--q4p2
select max(play_date) from match_mast;

-- q5
--q5p1
select sc.country_name from soccer_country sc
inner join soccer_team st
on sc.country_id = st.country_id
inner join match_details md
on md.team_id = st.team_id
inner join match_mast mm
on mm.match_no = md.match_no
and mm.play_date in( 
	select min(mm.play_date) from match_mast mm
);

select sc.country_name from soccer_country sc, soccer_team st, match_details md, match_mast mm
where sc.country_id = st.country_id 
and md.team_id = st.team_id 
and mm.match_no = md.match_no
and mm.play_date in( 
	select min(mm.play_date) from match_mast mm
);

q5p2
select sc.country_name from soccer_country sc
inner join soccer_team st
on sc.country_id = st.country_id
inner join match_details md
on md.team_id = st.team_id
where md.win_lose = 'W' 
and md.match_no in(
	select max(md.match_no) from match_details md
);

select sc.country_name from soccer_country sc, soccer_team st, match_details md
where sc.country_id = st.country_id 
and md.team_id = st.team_id
and md.win_lose = 'W' 
and md.match_no in(
	select max(md.match_no) from match_details md
);

-- q6
--q6p1
select sc.country_name, count(ps.kick_id) from soccer_country sc, penalty_shootout ps, soccer_team st
where sc.country_id = st.country_id and st.team_id = ps.team_id
group by st.team_id;
--q6p2
select sc.country_name from soccer_country sc, soccer_team st, match_details md
where st.country_id = sc.country_id and st.team_id = md.team_id and md.match_no in(
	select max(match_no) from match_details
);
--q6p3
select distinct mm.play_date from match_mast mm, penalty_shootout ps
where mm.match_no = ps.match_no;
--q6p4
select distinct sv.venue_name from soccer_venue sv, penalty_shootout ps, match_mast mm
where sv.venue_id = mm.venue_id and mm.match_no = ps.match_no;














