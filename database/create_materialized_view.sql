CREATE MATERIALIZED VIEW video_search_view AS
select v.id,
	   v."channelId",
	   v.title,
	   v.description,
	   v."thumbnailSrc",
	   c."name" as channel_name,
	   c."avatarSrc",
	   setweight(to_tsvector('english', v.title), 'A') ||
	   setweight(to_tsvector('english', v.description), 'B')  ||
	   setweight(to_tsvector('english', c."name"), 'C') AS search_vector
  from videos v , channels c 
 where 1=1
   and v."channelId" = c.id
	 and c.status = true
   and v.status = true;

CREATE INDEX idx_video_search_vector ON video_search_view USING gin(search_vector);