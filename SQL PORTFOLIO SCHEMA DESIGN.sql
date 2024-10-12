CREATE TABLE public.artist
(
    artist_id int8 PRIMARY KEY,
    name character varying
);


COPY public.artist
FROM 'D:\Project 3\music store data\artist.csv'
DELIMITER ','
CSV HEADER

SELECT * FROM public.artist

CREATE TABLE public.album2
(
    album_id int8 PRIMARY KEY,
    title character varying,
    artist_id int8,
	FOREIGN KEY (artist_id) references public.artist(artist_id)
);

COPY public.album2
FROM 'D:\Project 3\music store data\album_2.csv'
DELIMITER ','
CSV HEADER

SELECT * FROM public.album2

CREATE TABLE public.media_type
(        
         media_type_id INT8 PRIMARY KEY,
		 name character varying
);

COPY public.media_type
FROM 'D:\Project 3\music store data\media_type.csv'
DELIMITER ','
CSV HEADER

SELECT * FROM public.media_type

CREATE TABLE public.genre
(        
         genre_id INT8 PRIMARY KEY,
		 name character varying
);

COPY public.genre
FROM 'D:\Project 3\music store data\genre.csv'
DELIMITER ','
CSV HEADER

SELECT * FROM public.genre

CREATE TABLE public.track
(        
         track_id INT8 PRIMARY KEY,
		 name character varying,
		 album_id INT8,
		 media_type_id INT8,
		 genre_id INT8,
		 composer character varying,
		 milliseconds INT8,
		 bytes INT8,
		 unit_price FLOAT8,
		 FOREIGN KEY (album_id) references public.album2(album_id),
		 FOREIGN KEY (media_type_id) references public.media_type(media_type_id),
		 FOREIGN KEY (genre_id) references public.genre(genre_id)
);

COPY public.track
FROM 'D:\Project 3\music store data\track.csv'
DELIMITER ','
CSV HEADER

SELECT * FROM public.track

CREATE TABLE public.playlist
(        
         playlist_id INT8 PRIMARY KEY,
		 name character varying
);


COPY public.playlist
FROM 'D:\Project 3\music store data\playlist.csv'
DELIMITER ','
CSV HEADER

SELECT * FROM public.playlist

CREATE TABLE public.playlist_track
(        
         playlist_id INT8,
		 track_id INT8,
		 FOREIGN KEY (playlist_id) references public.playlist(playlist_id),
		 FOREIGN KEY (track_id) references public.track(track_id)
);

COPY public.playlist_track
FROM 'D:\Project 3\music store data\playlist_track.csv'
DELIMITER ','
CSV HEADER

SELECT * FROM public.playlist_track

CREATE TABLE public.employee
(        
         employee_id INT8 NOT NULL PRIMARY KEY,
		 last_name character varying,
		 first_name character varying,
		 title character varying,
		 reports_to INT4,
		 levels character varying,
		 birthdate DATE NOT NULL,
		 hire_date DATE NOT NULL,
		 address character varying,
		 city character varying,
		 state character varying,
		 country character varying,
		 postal_code character varying,
		 phone character varying,
		 fax character varying,
		 email character varying
);

COPY public.employee
FROM 'D:\Project 3\music store data\employee.csv'
DELIMITER ','
CSV HEADER

SELECT * FROM public.employee

CREATE TABLE public.customer
(        
         customer_id INT8 NOT NULL PRIMARY KEY,
		 first_name character varying,
		 last_name character varying,
		 company character varying,
		 address character varying,
         city character varying,
		 state character varying,
		 country character varying,
		 postal_code character varying,
		 phone character varying,
		 fax character varying,
		 email character varying,
		 support_rep_id INT4,
		 FOREIGN KEY (support_rep_id) REFERENCES public.employee(employee_id)
);

COPY public.customer
FROM 'D:\Project 3\music store data\customer.csv'
DELIMITER ','
CSV HEADER

SELECT * FROM public.customer

CREATE TABLE public.invoice
(        
         invoice_id INT8 NOT NULL PRIMARY KEY,
		 customer_id INT4,
		 invoice_date DATE NOT NULL,
		 billing_address character varying,
		 billing_city character varying,
		 billing_state character varying,
		 billing_country character varying,
		 billing_postal_code character varying,
		 total FLOAT4,
		 FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id)
	
);


COPY public.invoice
FROM 'D:\Project 3\music store data\invoice.csv'
DELIMITER ','
CSV HEADER

SELECT * FROM public.invoice


CREATE TABLE public.invoice_line
(        
         invoice_line_id INT4 PRIMARY KEY,
		 invoice_id INT4,
		 track_id INT4,
		 unit_price FLOAT4,
		 quantity INT4,
		 FOREIGN KEY (invoice_id) REFERENCES public.invoice(invoice_id),
		 FOREIGN KEY (track_id) REFERENCES public.track(track_id)
);


COPY public.invoice_line
FROM 'D:\Project 3\music store data\invoice_line.csv'
DELIMITER ','
CSV HEADER

SELECT * FROM public.invoi










