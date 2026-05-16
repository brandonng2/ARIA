create table papers (
  id                      text primary key,
  title                   text,
  authors                 text[],
  abstract                text,
  category                text,
  submitted_at            date,
  neurips_status          text,
  neurips_score           float,
  citation_count          integer,
  influential_citations   integer,
  tldr                    text,
  topic_id                integer,
  topic_label             text,
  topic_color             text,
  x                       float,
  y                       float,
  embedding               vector(768)
);

create table topics (
  id           integer primary key,
  label        text,
  color        text,
  centroid_x   float,
  centroid_y   float,
  paper_count  integer,
  show_label   boolean
);

-- indexes
create index on papers using ivfflat (embedding vector_cosine_ops);
create index on papers using gin (to_tsvector('english', title || ' ' || abstract));
create index on papers (topic_id);