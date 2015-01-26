--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: account_num_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN account_num_domain AS character(20);


ALTER DOMAIN public.account_num_domain OWNER TO postgres;

--
-- Name: address_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN address_domain AS text;


ALTER DOMAIN public.address_domain OWNER TO postgres;

--
-- Name: age_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN age_domain AS smallint NOT NULL
	CONSTRAINT age_domain_check CHECK ((VALUE >= 0));


ALTER DOMAIN public.age_domain OWNER TO postgres;

--
-- Name: award_title_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN award_title_domain AS character(50) NOT NULL;


ALTER DOMAIN public.award_title_domain OWNER TO postgres;

--
-- Name: character_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN character_domain AS character varying(40) NOT NULL;


ALTER DOMAIN public.character_domain OWNER TO postgres;

--
-- Name: cinema_code_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN cinema_code_domain AS character(10) NOT NULL;


ALTER DOMAIN public.cinema_code_domain OWNER TO postgres;

--
-- Name: cinema_title_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN cinema_title_domain AS character varying(40);


ALTER DOMAIN public.cinema_title_domain OWNER TO postgres;

--
-- Name: city_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN city_domain AS character varying(30);


ALTER DOMAIN public.city_domain OWNER TO postgres;

--
-- Name: country_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN country_domain AS character varying(30);


ALTER DOMAIN public.country_domain OWNER TO postgres;

--
-- Name: email_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN email_domain AS character(80)
	CONSTRAINT email_domain_check CHECK (((VALUE)::text ~* '^[A-Z0-9.\-+_%]+@[A-Z0-9.\-]+\.[A-Z]{2,4}$'::text));


ALTER DOMAIN public.email_domain OWNER TO postgres;

--
-- Name: ent_title_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN ent_title_domain AS character(80) NOT NULL;


ALTER DOMAIN public.ent_title_domain OWNER TO postgres;

--
-- Name: fest_title_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN fest_title_domain AS character(50) NOT NULL;


ALTER DOMAIN public.fest_title_domain OWNER TO postgres;

--
-- Name: file_path_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN file_path_domain AS character(100);


ALTER DOMAIN public.file_path_domain OWNER TO postgres;

--
-- Name: fullname_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN fullname_domain AS character varying(80);


ALTER DOMAIN public.fullname_domain OWNER TO postgres;

--
-- Name: genre_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN genre_domain AS character varying(20);


ALTER DOMAIN public.genre_domain OWNER TO postgres;

--
-- Name: language_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN language_domain AS character varying(30);


ALTER DOMAIN public.language_domain OWNER TO postgres;

--
-- Name: moment_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN moment_domain AS bigint NOT NULL
	CONSTRAINT moment_domain_check CHECK ((VALUE >= 0));


ALTER DOMAIN public.moment_domain OWNER TO postgres;

--
-- Name: movie_title_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN movie_title_domain AS character(80);


ALTER DOMAIN public.movie_title_domain OWNER TO postgres;

--
-- Name: password_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN password_domain AS character varying(40) NOT NULL;


ALTER DOMAIN public.password_domain OWNER TO postgres;

--
-- Name: profession_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN profession_domain AS character(20);


ALTER DOMAIN public.profession_domain OWNER TO postgres;

--
-- Name: rate_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN rate_domain AS smallint
	CONSTRAINT rate_domain_check CHECK (((VALUE <= 5) AND (VALUE >= 1)));


ALTER DOMAIN public.rate_domain OWNER TO postgres;

--
-- Name: sex_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN sex_domain AS character(6) NOT NULL
	CONSTRAINT sex_domain_check CHECK (((VALUE = 'male'::bpchar) OR (VALUE = 'female'::bpchar)));


ALTER DOMAIN public.sex_domain OWNER TO postgres;

--
-- Name: year_domain; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN year_domain AS smallint;


ALTER DOMAIN public.year_domain OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: artist_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE artist_table (
    fullname fullname_domain NOT NULL,
    birthday date,
    birth_country country_domain,
    birth_city city_domain,
    sex sex_domain NOT NULL,
    biography text,
    account_number account_num_domain,
    user_email email_domain
);


ALTER TABLE public.artist_table OWNER TO postgres;

--
-- Name: award_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE award_table (
    festival_title fest_title_domain NOT NULL,
    festival_year year_domain NOT NULL,
    award_title character(40) NOT NULL,
    awarded_movie_title movie_title_domain,
    awarded_movie_year year_domain,
    awarded_character_artist_name fullname_domain,
    awarded_character_profession profession_domain,
    awarded_character_movie_title movie_title_domain,
    awarded_character_movie_year year_domain
);


ALTER TABLE public.award_table OWNER TO postgres;

--
-- Name: character_candid_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE character_candid_table (
    festival_title fest_title_domain NOT NULL,
    festival_year year_domain NOT NULL,
    award_title character(40) NOT NULL,
    candidate_character_artist_name fullname_domain NOT NULL,
    candidate_character_profession profession_domain NOT NULL,
    candidate_character_movie_title movie_title_domain NOT NULL,
    candidate_character_movie_year year_domain NOT NULL
);


ALTER TABLE public.character_candid_table OWNER TO postgres;

--
-- Name: cinema_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cinema_table (
    cinema_code cinema_code_domain NOT NULL,
    address address_domain NOT NULL,
    title cinema_title_domain
);


ALTER TABLE public.cinema_table OWNER TO postgres;

--
-- Name: comment_comment_reply_to_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comment_comment_reply_to_table (
    replier_comment_id bigint NOT NULL,
    target_comment_id bigint
);


ALTER TABLE public.comment_comment_reply_to_table OWNER TO postgres;

--
-- Name: comment_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comment_table (
    comment_auto_id bigint NOT NULL,
    movie_title movie_title_domain NOT NULL,
    movie_release_year year_domain NOT NULL,
    user_email email_domain NOT NULL,
    title character(40) NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.comment_table OWNER TO postgres;

--
-- Name: comment_table_comment_auto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comment_table_comment_auto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_table_comment_auto_id_seq OWNER TO postgres;

--
-- Name: comment_table_comment_auto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comment_table_comment_auto_id_seq OWNED BY comment_table.comment_auto_id;


--
-- Name: dialogue_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dialogue_table (
    movie_title movie_title_domain NOT NULL,
    movie_release_year year_domain NOT NULL,
    user_email email_domain NOT NULL,
    "character" character_domain NOT NULL,
    second moment_domain NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.dialogue_table OWNER TO postgres;

--
-- Name: entertainment_company_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entertainment_company_table (
    title ent_title_domain NOT NULL,
    address address_domain,
    account_number account_num_domain
);


ALTER TABLE public.entertainment_company_table OWNER TO postgres;

--
-- Name: festival_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE festival_table (
    title fest_title_domain NOT NULL,
    year year_domain NOT NULL,
    location address_domain NOT NULL,
    host_title ent_title_domain
);


ALTER TABLE public.festival_table OWNER TO postgres;

--
-- Name: fund_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fund_table (
    movie_title movie_title_domain NOT NULL,
    movie_release_year year_domain NOT NULL,
    investor_account_number account_num_domain NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.fund_table OWNER TO postgres;

--
-- Name: investor_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE investor_table (
    account_number account_num_domain NOT NULL
);


ALTER TABLE public.investor_table OWNER TO postgres;

--
-- Name: movie_artist_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_artist_table (
    artist_name fullname_domain NOT NULL,
    movie_title movie_title_domain NOT NULL,
    movie_release_year year_domain NOT NULL,
    profession profession_domain NOT NULL
);


ALTER TABLE public.movie_artist_table OWNER TO postgres;

--
-- Name: movie_candid_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_candid_table (
    festival_title fest_title_domain NOT NULL,
    festival_year year_domain NOT NULL,
    award_title character(40) NOT NULL,
    candidate_movie_title movie_title_domain NOT NULL,
    candidate_movie_year year_domain NOT NULL
);


ALTER TABLE public.movie_candid_table OWNER TO postgres;

--
-- Name: movie_genre_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_genre_table (
    movie_title movie_title_domain NOT NULL,
    movie_release_year year_domain NOT NULL,
    genre genre_domain NOT NULL
);


ALTER TABLE public.movie_genre_table OWNER TO postgres;

--
-- Name: movie_list_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_list_table (
    list_user_email email_domain NOT NULL,
    list_title character varying(40) NOT NULL,
    movie_title movie_title_domain NOT NULL,
    movie_release_year year_domain NOT NULL
);


ALTER TABLE public.movie_list_table OWNER TO postgres;

--
-- Name: movie_rate_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_rate_table (
    movie_title movie_title_domain NOT NULL,
    movie_release_year year_domain NOT NULL,
    user_email email_domain NOT NULL,
    rating rate_domain NOT NULL
);


ALTER TABLE public.movie_rate_table OWNER TO postgres;

--
-- Name: movie_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_table (
    title movie_title_domain NOT NULL,
    release_year year_domain NOT NULL,
    country country_domain,
    main_language language_domain,
    story_line text,
    min_age smallint
);


ALTER TABLE public.movie_table OWNER TO postgres;

--
-- Name: picture_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE picture_table (
    file_path file_path_domain NOT NULL,
    movie_title movie_title_domain NOT NULL,
    movie_release_year year_domain NOT NULL,
    min_age smallint
);


ALTER TABLE public.picture_table OWNER TO postgres;

--
-- Name: review_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE review_table (
    movie_title movie_title_domain NOT NULL,
    movie_release_year year_domain NOT NULL,
    writer_fullname fullname_domain NOT NULL,
    last_change timestamp without time zone,
    context text
);


ALTER TABLE public.review_table OWNER TO postgres;

--
-- Name: saloon_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE saloon_table (
    container_cinema_code cinema_code_domain NOT NULL,
    saloon_id smallint NOT NULL,
    rows_num smallint NOT NULL,
    columns_num smallint NOT NULL
);


ALTER TABLE public.saloon_table OWNER TO postgres;

--
-- Name: show_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE show_table (
    saloon_container_cinema_code cinema_code_domain NOT NULL,
    saloon_id smallint NOT NULL,
    movie_title movie_title_domain NOT NULL,
    movie_release_year year_domain NOT NULL,
    show_date date NOT NULL,
    stage smallint NOT NULL,
    price smallint NOT NULL
);


ALTER TABLE public.show_table OWNER TO postgres;

--
-- Name: tag_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tag_table (
    artist_name fullname_domain NOT NULL,
    picture_path file_path_domain NOT NULL,
    x integer NOT NULL,
    y integer NOT NULL,
    radius integer NOT NULL
);


ALTER TABLE public.tag_table OWNER TO postgres;

--
-- Name: ticket_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ticket_table (
    saloon_container_cinema_code cinema_code_domain NOT NULL,
    saloon_id smallint NOT NULL,
    movie_title movie_title_domain NOT NULL,
    movie_release_year year_domain NOT NULL,
    show_date date NOT NULL,
    stage smallint NOT NULL,
    chair_row smallint NOT NULL,
    chair_column smallint NOT NULL,
    owner_email email_domain
);


ALTER TABLE public.ticket_table OWNER TO postgres;

--
-- Name: user_list_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_list_table (
    user_email email_domain NOT NULL,
    list_title character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.user_list_table OWNER TO postgres;

--
-- Name: user_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_table (
    email email_domain NOT NULL,
    fullname fullname_domain NOT NULL,
    password password_domain NOT NULL,
    birthday date NOT NULL,
    sex sex_domain NOT NULL,
    superuser boolean DEFAULT false NOT NULL
);


ALTER TABLE public.user_table OWNER TO postgres;

--
-- Name: comment_auto_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_table ALTER COLUMN comment_auto_id SET DEFAULT nextval('comment_table_comment_auto_id_seq'::regclass);


--
-- Data for Name: artist_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY artist_table (fullname, birthday, birth_country, birth_city, sex, biography, account_number, user_email) FROM stdin;
رضا عطاران	1991-01-19	ایران	مشهد	male  	در ۲۰ اردیبهشت ۱۳۴۷ در محله گاراژدارها شهر مشهد به‌دنیا آمد پدر و مادرش از اهالی بخش کاخک شهرستان گناباد در استان خراسان بودند. او دیپلم خود را در رشته اقتصاد در مشهد گرفت و برای ادامه تحصیل در رشته طراحی صنعتی در دانشکده هنرهای زیبای دانشگاه تهران به تهران آمد. با وجود علاقه به رشته تحصیلی‌اش، به بازیگری، فیلم‌نامه‌نویسی و کارگردانی روی آورد. عطاران در سال ۱۳۷۳ ازدواج کرد.	8982                	\N
پوران درخشنده	1982-01-19	ایران	کرمانشاه	female	فیلمساز، تهیه کننده، محقق و نویسنده فعال ایران زمین در ۷ فروردین ماه سال ۱۳۳۰ در شهر کرمانشاه به دنیا آمد، او تحصیل تکمیلی خود را در مدرسه عالی تلویزیون و سینما گذراند و در سال ۱۳۵۴ در سازمان صدا و سیما شروع بکار کرد و در همان زمان فیلم طاعون که درباره طاعون در کردستان به سال ۱۳۲۸ است را تهیه کرد. سال بعد نیز ۱۳۵۵ درباره چهارشنبه سوری و نیز فیلمی درباره مراسم سنتی نواحی مختلف ایران موسیقی نواحی ایران را سال ۱۳۵۶ تولید کرد. موج، جانماز، سجاده، تحقیقی درباره زنان، اشتغال و صنایع دستی در کردستان در سال ۱۳۵۷ فیلم‌های مستند «چشمه‌های آب معدنی راه هراز»، به تصویر کشید و همان سال مستندهای سه گانه صنایع دستی را در کردستان تولید کرد.	\N	\N
بهمن قبادی	1984-12-16	ایران	کردستان	male  	او در سال ۱۳۴۸ در بانه در استان کردستان به دنیا آمد. تحصیلات متوسطه‌اش را در سنندج به پایان برد و سال ۱۳۷۱ برای ادامه تحصیل در دانشگاه، به تهران رفت و در رشته سینما در دانشکده صدا و سیما مشغول به تحصیل شد، ولی دانشگاه را رها کرد و به انجام نرساند. او معتقد است هر آنچه در سینما دارد حاصل تجربیاتی است که با ساختن فیلم‌های کوتاهش به دست آورده. قبادی در سال‌های پایانی دهه ۶۰ به عکاسی هنری و صنعتی روی آورد. تأثیر عکاسی در نگاه او به جهان تصویر گرش انکار ناپذیر است. پس از آن، با ساخت فیلم‌های هشت میلی‌متری به فیلم‌سازی روی آورد. حاصل آن دوران، تعدادی فیلم داستانی و مستند هشت میلی‌متری است. فیلم‌های کوتاه قبادی از نیمه دهه ۱۳۷۰ مورد توجه قرار گرفتند و توانستند جوایز داخلی و خارجی متعددی را نصیب قبادی کنند. با فیلم زندگی در مه، مسیر تازه‌ای در کارنامه او گشوده شد. این فیلم جوایز متعدد بین‌المللی را به دست آورده و عنوان «پر افتخارترین مستند تاریخ ایران» را نیز به خود اختصاص داده‌است. وی با ساخت فیلم بلند زمانی برای مستی اسب‌ها به جرگه فیلم‌سازان حرفه‌ای پیوست.	3223                	\N
کیومرث پوراحمد	1992-01-01	ایران	نجف آباد	male  	او کارش را با نقدنویسی آغاز کرد و از ۱۳۵۳ با دستیاری در مجموعه تلویزیونی آتش بدون دود وارد سینما شد. فیلم شب یلدا الهام‌گرفته از زندگی خود اوست.[۳] پوراحمد شرح حال خود را در کتابی تحت عنوان «کودکی نیمه‌تمام» منتشر کرده‌است. مادرش، پروین‌دخت یزدانیان با بازی در فیلم‌های او، کار بازیگری را آغاز کرد و آثار برجسته‌ای با بازی او به ثبت رسید. دخترش، مریم پوراحمد هم در فیلم شب یلدا به ایفای نقش پرداخته‌است.[۴] فیلم مستندی درباره زندگی پوراحمد به کارگردانی مشترک سیدسجاد آوینی و اردلان آشوری ساخته شده‌است.[۵] پوراحمد در شب تقدیر از وی خود را شاگرد مسعود کیمیایی دانست و گفت :این افتخاری برای یک شاگرد است در مراسم تقدیر از او در کنار استادش قرار گیرد.[۶]	9874                	\N
مسعود ده‌نمکی	1988-08-24	ایران	آذربایجان شرقی	male  	او در دهه ۱۳۷۰ از اعضای فعال انصار حزب‌الله بوده‌است، و همزمان با روزنامه‌نگاری در نشریه یالثارات و چند نشریه دیگر، مدت‌ها به عنوان سردبیر و مدیرمسئول نشریه‌های شلمچه و جبهه مشغول به فعالیت بود.\nوی دانش‌آموختهٔ رشتهٔ علوم سیاسی از دانشگاه آزاد می‌باشد.	5532                	dehnamak@yahoo.com                                                              
نرگس آبیار	1991-06-03	ایران	تهران	female	وی متولد سال ۱۳۴۹ در شهر تهران و فارغ‌التحصیل رشته ادبیات است. وی از سال ۱۳۷۶ فعالیت داستان‌نویسی خود را در حوزه هنری آغاز کرد و تاکنون بیش از سی جلد کتاب از وی در قالب رمان و داستان به چاپ رسیده است. او که نوشتن چهار فیلمنامه بلند سینمایی را نیز در کارنامه خود دارد از سال ۱۳۸۴ به ساخت فیلم‌های کوتاه و مستند روی آورد که نخستین تجربهٔ او بن‌بست مهربان، برنده بهترین فیلم کوتاه داستانی از جشنواره ستایش شد و دربخش مسابقه چند جشنواره بین‌المللی نیز به نمایش در آمد. وی تاکنون هفت فیلم داستانی و مستند و دو فیلم سینمایی را کارگردانی کرده است.	\N	\N
سرژ آزاریان	1986-04-18	فرانسه	پاریس	female	وی پیش از ساختن اولین فیلمش از فرانسه به ایران آمد و چون به زبان فرانسه صحبت می‌کرد سر صحنهٔ فیلم‌هایش از وجود مترجم استفاده می‌کرد	6767                	\N
فریدون جیرانی	1994-03-11	ایران	تهران	male  	فریدون جیرانی کارگردان، فیلم‌نامه‌نویس، تهیه‌کننده، فیلمبردار، و مجری کارشناس سابق( برنامه تلویزیونی هفت )مطرح و سرشناس ایرانی است. فریدون جیرانی یکی از مهم ترین کارگردانان اخیر سینمای ایران است. فیلم های وی همیشه در گیشه به فروش بالایی دست یافتند و اکثرشان جنجالی بودند. از مهم ترین فیلم های جیرانی می توان به:قرمز،شام آخر، سالاد فصل، پارک وی، قصه ی پریا و من مادر هستم اشاره کرد.	6685                	\N
مسعود آب‌پرور	1990-01-05	ایران	تهران	male  	مسعود آتش آب‌پرورمعروف به مسعود آب پرور (زاده ۲ تیر ۱۳۴۰ تهران) دانش آموخته کارگردانی سینما از دانشکده سینما و تئاتر است. از دیگر فعالیت‌های وی می‌توان به کارشناسی سناریو و فیلم در بنیاد سینمایی فارابی، تأسیس کارگاه گسترش هنر و طراحی کلیپ‌های ایرانی اشاره کرد.	5532                	\N
بهرام بیضایی	1977-05-11	ایران	تهران	male  	فعالیت سینمایی را با فیلم‌برداری یک فیلم هشت میلیمتری چهار دقیقه‌ای سیاه و سفید در سال ۱۳۴۱ آغاز کرد. پس از ساخت فیلم کوتاه عمو سبیلو در سال ۱۳۴۹، اولین فیلم بلندش رگبار را در سال ۱۳۵۰ ساخت. چریکه تارا و مرگ یزدگرد فیلم‌هایی که او در سال‌های ۱۳۵۷ و ۱۳۶۰ ساخت تا کنون در محاق توقیف می‌باشند. او در سال‌های پیش و پس از انقلاب برای ساختن فیلم‌های خود با مشکلات و سنگ‌اندازی‌های بسیاری روبه‌رو بوده‌است. او تا کنون ۹ فیلم بلند و ۴ فیلم کوتاه ساخته‌است. پس از نمایش عمومی فیلم سگ‌کشی (۱۳۸۰) که با استقبال گستردهٔ منتقدان و مردم روبه‌رو شد، وقتی همه خوابیم را در سال ۱۳۸۷ روی پرده برد.	6454                	\N
بهروز افخمی	1986-09-12	ایران	تهران	male  	بهروز افخمی متولد ۱۳۳۵ تهران، فارغ‌التحصیل تدوین از مدرسه عالی تلویزیون و سینما است. وی فعالیت هنری را با ساخت فیلم‌های کوتاه آغاز کرد.\nاو سینمای حرفه‌ای را برای بار نخست با فیلم «زیر باران» به کارگردانی سیف‌الله داد به عنوان مدیر فیلمبرداری تجربه کرد.\nاز دیگر فعالیت‌های جنبی وی می‌توان به تدریس سینما، عضویت در شورای هنرستان روایت فتح و نماینده مردم در مجلس ششم شورای اسلامی اشاره کرد.\nزندگی مشترک بهروز افخمی با ناهید طلوع به جدایی انجامید. وی هم اکنون با مرجان شیرمحمدی زندگی می‌کند.	4321                	\N
آرامائیس آقامالیان	1988-08-29	ایران	تهران	male  	آرماییس آقامالیان (زاده ۱۲۸۹ جلفا، درگذشته ۱۳۶۴) نقاش، نویسنده و کارگردان ایرانی است. وی دانش آموخته نقاشی است. آرماییس آقامالیان فعالیت هنری را با دستیاری دکوراتور تئاتر آغاز کرد. او سینمای حرفه‌ای را در سال ۱۳۳۸ با فیلم در جستجوی داماد شروع کرد.	8984                	\N
علی حاتمی	1990-04-19	ایران	تهران	male  	اولین اثر سینمایی حاتمی در سال ۱۳۴۸ با عنوان حسن کچل ساخته شد و آخرین فیلم نیمه‌تمامش با نام جهان پهلوان تختی که یکی از بزرگ‌ترین پروژه‌های سینمایی او بعد از مجموعهٔ هزاردستان بود، به علت مرگ ناشی از بیماری سرطان نافرجام ماند. پس از مرگش نیز دو فیلم مبتنی بر هزاردستان با تدوین واروژ کریم‌مسیحی (به نام‌های کمیتهٔ مجازات و تهران روزگار نو) ساخته شد.	6767                	farazan9920@yahoo.com                                                           
عباس کیارستمی	1993-03-11	ایران	تهران	male  	کیارستمی از جمله کارگردانانی است که پس از انقلاب ۱۳۵۷ ایران در کشور باقی‌ماند. او بر این باور است که تصمیم به ماندن مهم ترین تصمیم او برای زندگی حرفه‌ای اش بوده است. او می‌گوید که حضور همیشگی اش در ایران و ملیت ایرانی اش توانایی او در ساخت فیلم را دوچندان کرده است	\N	\N
نیکی کریمی	1979-02-01	ایران	تهران	female	نیکی کریمی در ۱۹ آبان ۱۳۵۰ در تهران به دنیا آمد. وی از دوران دبستان بازی در گروه‌های کوچک تئاتری را آغاز کرد. نخستین نقش سینمایی‌اش را در سال ۱۳۶۸ در فیلم «وسوسه» به کارگردانی جمشید حیدری به دست‌ آورد. اما نخستین حضور جدی‌اش را می‌توان در فیلم «عروس» به کارگردانی بهروز افخمی در سال ۱۳۶۹ دانست. نیکی کریمی و ابوالفضل پورعرب را اولین ستارگان سینمای ایران پس از انقلاب می‌دانند. پس از آن، وی در دو فیلم مهم از داریوش مهرجویی به نام‌های «سارا» و «پری» بازی کرد. در سال ۱۳۷۱ بازی در فیلم «سارا» (اقتباسی از «خانه عروسک» اثر هنریک ایبسن) توانست برایش جایزه بهترین بازیگر زن جشنواره‌های سن سباستین و نانت را به ارمغان بیاورد. در همان سال برای تحصیل در رشته طراحی لباس به آمریکا رفت و تا زمان بازی در فیلم «پری» اثر داریوش مهرجویی به ایران بازنگشت. بازی‌اش در این فیلم که اقتباسی از کتاب «فرنی و زویی» اثر سلینجر بود مورد توجه قرار گرفت و او برای بار سوم در جشنواره فیلم فجر نامزد سیمرغ بلورین شد.\n\n	\N	\N
فریبرز عرب‌نیا	1990-11-18	ایران	تهران	male  	فریبرز عرب‌نیا از بازیگران ایرانی است. فریبرز عرب نیا در سال ۱۳۴۳ در تهران متولد شد و در سال ۱۳۶۰ موفق به اخذ مدرک دیپلم ریاضی فیزیک شد. او پس از طی کردن دوره خدمت سربازی در سال ۱۳۶۴ به ترکیه رفت و در دانشگاه خاورمیانه آنکارا مشغول به تحصیل رشته مدیریت شد، اما آن را نیمه تمام رها کرد و به ایران بازگشت تا در رشته مورد علاقه‌اش مشغول شود. او پس از گذراندن تحصیلات دانشگاهی و دوره‌های تخصصی تئاتر و سینما به شکل حرفه‌ای وارد کار شد و تئاتر را در کانون تئاتر تجربی زیر نظر استاد حمید سمندریان و سینما را در دوره‌ای دو ساله در مجتمع آموزشی سینما تحصیل کرد. او همچنین در رشتهٔ ارتباط تصویری (گرافیک) موفق به اخذ مدرک کارشناسی از دانشگاه هنر شد. او علاوه بر بازیگری در زمینه طراحی گرافیک نیز فعال می‌باشد.	6685                	\N
نادر طالب‌زاده	1983-08-03	ایران	تهران	male  	نادر طالب‌زاده (متولد ۱۳۳۲ تهران) تهیه‌کننده، مجری برنامه‌های تلویزیونی، مستند ساز و روزنامه‌نگار ایرانی - آمریکایی است.	6543                	\N
شیرین نشاط	1984-06-09	ایران	قزوین	female	شیرین نشاط در ۶ فروردین ۱۳۳۶ (۲۶ مارس ۱۹۵۷) در قزوین زاده شد. در سال ۱۹۷۴ (۱۳۵۳) برای ادامه تحصیل به آمریکا رفت و در دانشگاه کالیفرنیای برکلی به تحصیل هنر پرداخت. او در طول دهه ۸۰ میلادی مدیر شرکت نمایشگاه هنر و معماری نیویورک بود. در این دوره او راه برگزاری نمایشگاه‌هایی مانند Werchitecture، عکس‌های ساختمان‌های آسیب‌دیده در سارایوو یا Queer Space به تحلیل نقش جنسیت در تعیین فضاها (و برعکس) معناهای فضای فیزیکی پرداخت، موضوعی که به همهٔ فیلم‌های او راه یافت.	\N	eftekhari.ali@gmail.com                                                         
تهمینه میلانی	1980-01-11	ایران	تبریز	female	تهمینه میلانی در سال ۱۳۳۹ در شهر تبریز به دنیا آمد. در دوران دبیرستان به تهران نقل مکان کرد و در دبیرستانهای شرف و مرجان به ادامه تحصیل پرداخت. سال ۱۳۵۷ در رشته برق دانشگاه تبریز قبول شد. هم‌زمان با پیروزی انقلاب و بسته شدن دانشگاه‌ها به تهران بازگشت و در رشته معماری دانشگاه علم و صنعت مشغول به تحصیل گردید. با بسته شدن دانشگاه‌ها حضور در جلسات شعرخوانی، نمایش فیلم و از فعالیت‌هایی این قبیل را برگزید. در یکی از این جلسات بود که با مسعود کیمیایی آشنا گردید و توانست نظر موافق او را در دستیاری وی در کارگاه آزاد فیلم جلب نماید. بسیار جوان بود که به عنوان اولین تجربه سینمائی به عنوان منشی صحنه فیلم خط قرمز برگزیده شد.	\N	angelina.jolie@gmail.com                                                        
پل آدلستین	1969-08-29	آمریکا	ایلینویز	male  	پل آدلستین (به انگلیسی: Paul Adelstein) بازیگر آمریکایی که برای بازی در نقش پل کلرمن در سریال فرار از زندان و نقش کنونی او به عنوان پزشک متخصص اطفال (کوپر فریدمن) در سریال تمرین‌های خصوصی شناخته می شود. او ابتدا بازی را در تئاتر شروع و در سال ۱۹۹۰ با بازی در اولین فیلمش وارد دنیای بازیگری شد او در سال ۲۰۰۵ تا ۲۰۰۷ با بازی در فصل اول و دوم سریالفرار از زندان مشهور شد و از او برای بازی در فصل چهارم دعوت شد و او در قسمت ۲۱ این فصل حضور یافت. او هم اکنون در حال بازی در فیلم تمرین‌های خصوصی می باشد.	4321                	\N
محسن مخملباف	1980-11-05	ایران	تهران	male  	محسن مخملباف در جنوب شهر تهران به دنیا آمد و به دلیل فقر خانوادگی از هشت تا هفده سالگی در سیزده شغل مختلف شاگردی و کارگری کرد تا مخارج خود و مادرش را تامین کند. او از سن پانزده سالگی در گروهی چریکی که خود تشکیل داده بود، به فعالیت سیاسی و مخفی پرداخت. در سن هفده سالگی در جریان عملیات خلع سلاح یک پلیس تیر خورد و دستگیر شد مجموعاً مخملباف قبل از انقلاب ۱۳۵۷ ایران بیش از چهار سال به علت فعالیت‌های سیاسی در زندان بوده‌است. او عضو سازمان مجاهدین انقلاب اسلامی بود. مخملباف بعد از انقلاب با شروع فعالیت حوزه هنری سازمان تبلیغات اسلامی در این سازمان مشغول به کار شد. اولین فیلم او توبه نصوح نام داشت.	6543                	\N
چستر بنینگتون	1976-01-12	آمریکا	آریزونا	female	چستر در شهر فینیکس در ایالت آریزونای آمریکا به دنیا آمد. او در کودکی به موسیقی علاقه نشان داد و از گروهای دپش مد و استون تمپل پایلتز به عنوان گروه‌های مورد علاقه‌اش نام می‌برد. او در کودکی مورد تجاوز قرار گرفته بود. چند سال بعد او به کوکایین و شیشه اعتیاد پیدا کرد. او سرانجام بر اعتیاد خود غلبه کرد و اکنون در مصاحبه‌های خود مصرف مواد مخدر را کاری بد می‌شمارد. او پیش از آغاز موسیقی حرفه‌ای در یک رستوران برگر کینگ کار می‌کرد.	\N	elisha.am@gmail.com                                                             
جنیفر آنیستون	1969-01-22	آمریکا	کالیفرنیا	female	جنیفر جوآنا آنیستون (به انگلیسی: Jennifer Joanna Aniston) (متولّـد ۱۱ فوریه ۱۹۶۹ در شرمن‌اوکس، کالیفرنیا) بازیگر آمریکایی و برنده جایزه امی است. او در یونان،کالیفرنیا و نیویورک بزرگ شده و بزرگ‌ترین موفقیت خود را در سریال تلویزیونی دوستان به دست آورده است. او همسر سابق برد پیت بود و در سال ۲۰۰۵ از او جدا شد.	6454                	elcidar@yahoo.com                                                               
آل پاچینو	1940-09-25	آمریکا	نیویورک	male  	آلفردو جیمز «اَل» پاچینو (زادهٔ ۲۵ آوریل ۱۹۴۰) بازیگر و کارگردان آمریکایی است. وی بیشتر برای شیوه بازیگری سبک متد، پرشور و برون گرا خود و با بازی در سه‌گانه پدرخوانده و فیلم‌های بعد از ظهر سگی، بوی خوش زن و صورت زخمی شناخته می‌شود. او تا به حال هشت بار نامزد دریافت جایزه اسکار شده است. پاچینو در سال ۱۹۹۲ با بازی درخشان خود در بوی خوش زن در نقش سرهنگ فرانک اسلید توانست جایزه اسکار بهترین بازیگر نقش اول مرد را به دست آورد. لقب پاچینو سلطان است و او را شاهکار بازیگری در تمام ادوار تاریخ سینمای جهان می دانند.	\N	\N
ژولی گیه	1976-09-13	فرانسه	پاریس	female	ژولی گیه (به فرانسوی: Julie Gayet) بازیگر و تهیه‌کننده سینما و تلویزیون فرانسوی است. وی تاکنون در بیش از ۵۰ فیلم بازی کرده است.	\N	\N
گاسپارد اولیل	1984-06-25	فرانسه	بولونیه-بیانکور	male  	از فیلم‌های معروف او می‌توان به بازی در طلوع هانیبال اشاره کرد،او در این فیلم نقش هانیبال لکتر را بازی کرد.	\N	\N
ابراهیم حاتمی‌کیا	1983-02-17	ایران	تهران	male  	ابراهیم حاتمی کیا در سال ۱۳۴۰ در یک خانواده مذهبی با اصالت آذربایجانی، در تهران متولد شد. باورها و اعتقادات مذهبی خانواده مانع از تماشای تلویزیون و راهیابی وی به سینما می‌شد. آزادی دوران جوانی و مصادف شدن با انقلاب اسلامی دو عاملی بود که او را به سوی سینما سوق داد. او فعالیت‌های سینمایی‌اش را از سال ۱۳۵۹ با نوشتن فیلمنامه و کارگردانی فیلم‌های کوتاه در فضای جبهه و جنگ آغاز کرد. حاتمی کیا در سال ۱۳۶۴ نخستین فیلم بلند خود را به نام هویت برای شبکه دوم سیما ساخت که می‌کوشید تصویری واقع گرایانه از گرایش‌های سیاسی آن دوران پرآشوب ارائه دهد. پس از ساخت این فیلم خسرو دهقان منتقد سینما استعداد حاتمی کیا را کشف کرد و در یکی از نشریات سینمایی نوشت:فیلمساز خوش قریحه‌ای دارد وارد سینما می‌شود.	0849                	\N
اصغر فرهادی	1988-11-18	ایران	خمینی‌شهر	male  	بنابر اظهارات فرهادی، وی فعالیت سینمایی خود را در سن ۱۳ سالگی و قبل از آنکه به صورت آکادمیک در این زمینه به تحصیل بپردازد، آغاز کرده بود. فرهادی پس از گذراندن دوره لیسانس در رشته تئاتر از دانشکده هنرهای زیبا دانشگاه تهران، مدرک فوق لیسانس خود در همین رشته را از دانشگاه تربیت مدرس دریافت کرد. او فعالیت در سینما را از سال ۱۳۶۵ در انجمن سینمای جوان اصفهان آغاز کرد. نخستین حضور حرفه‌ای او در سینما در فیلم ارتفاع پست ساخته ابراهیم حاتمی‌کیا در سال ۱۳۸۰ به عنوان فیلمنامه‌نویس بود. فرهادی اولین فیلمی که بر زندگی‌اش تاثیرگذار بوده است را فیلم دزد دوچرخه معرفی کرد. وی هنر خود را تاثیرپذیرفته از آثار ویتوریو دسیکا، فدریکو فلینی، اینگمار برگمان، میکل‌آنجلو آنتونیونی ، بیلی وایلدر و کریشتوف کیشلوفسکی می‌داند.	0849                	\N
داریوش مهرجویی	1985-06-06	ایران	تهران	male  	داریوش مهرجویی در ۱۷ آذر ۱۳۱۸ در تهران در خانواده‌ای از طبقه فرودست جامعه به‌دنیا آمد. در کودکی تحت تاثیر مادربزرگش که مسلمانی معتقد بود قرار می‌گیرد. خود در مصاحبه‌ای در سال ۱۳۵۱ در این باره می‌گوید: «مادر بزرگم از آن نمازخوان‌های دوآتشه بود؛ و تحت تأثیر فضای روحانی او، من هم از سن هفت تا پانزده‌سالگی، شده بودم یک مسلمان واقعی. نماز و روزه‌ام یک آن ترک نمی‌شد. [...] اما از پانزده سالگی به بعد، درست آن موقعی که نماز و روزه‌ام به حساب می‌آمد، شک در دلم نشست. چهره خدا تدریجاً کدر شد و ایمانم رفت از دست.» در نوجوانی به موسیقی علاقه‌مند می‌شود و مدت کوتاهی به کلاس آموزش موسیقیِ آقای زندی می‌رود. نزد پدرش که موسیقی ایرانی را خوب می‌شناخت به نواختن سنتور می‌پردازد و بعد به موسیقی کلاسیک غربی آشنا می‌شود و به نواختن پیانو و نوشتن قطعاتی برای پیانو می‌پردازد.	3223                	\N
\.


--
-- Data for Name: award_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY award_table (festival_title, festival_year, award_title, awarded_movie_title, awarded_movie_year, awarded_character_artist_name, awarded_character_profession, awarded_character_movie_title, awarded_character_movie_year) FROM stdin;
\.


--
-- Data for Name: character_candid_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY character_candid_table (festival_title, festival_year, award_title, candidate_character_artist_name, candidate_character_profession, candidate_character_movie_title, candidate_character_movie_year) FROM stdin;
\.


--
-- Data for Name: cinema_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cinema_table (cinema_code, address, title) FROM stdin;
124324    	تهران - اتوبان نیایش - روبروی کردستان	پردیس ملت
324645    	تهران - میدان انقلاب	سینما بهمن
456457    	تهران - میدان فلسطین، نبش خیابان مظفر	سینما فلسطین
\.


--
-- Data for Name: comment_comment_reply_to_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment_comment_reply_to_table (replier_comment_id, target_comment_id) FROM stdin;
\.


--
-- Data for Name: comment_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment_table (comment_auto_id, movie_title, movie_release_year, user_email, title, text) FROM stdin;
\.


--
-- Name: comment_table_comment_auto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comment_table_comment_auto_id_seq', 1, false);


--
-- Data for Name: dialogue_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dialogue_table (movie_title, movie_release_year, user_email, "character", second, text) FROM stdin;
\.


--
-- Data for Name: entertainment_company_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entertainment_company_table (title, address, account_number) FROM stdin;
استار تی‌وی                                                                     	خیابان رجایی نبش سیزده آبان نبش خ شیری پ 320	6767                
استودیو جیبلی                                                                   	میدان انقلاب ، ضلع شمال غربی ، جنب مسجدسیدالشهدا (ع) ، پلاک 64 ، طبقه اول	\N
پیکسار                                                                          	میدان انقلاب ابتدای خیابان آزادی پلاک15طبقه اول واحد2 طبقه فوقانی بانک کشاورزی	2301                
چینه‌چیتا                                                                       	میدان توحید خ فرصت شیرازی نرسیده به غریب نبش خ یوسف پ 119	3223                
خانه فیلم مخملباف                                                               	میدان خراسان ابتدای خیابان خاوران جنب فروشگاه قدس پاساژبرلیان طبقه اول	\N
دریم‌ورکس                                                                       	شهرری، ابتدای خیابان قم، ساختمان اداری امید، پلاک40، طبقه اول، واحد2	9874                
کانون پرورش فکری کودکان و نوجوانان                                              	میدان بسیج، ابتدای اتوبان افسریه، نبش هشت متری پنجم، پلاک 112	1123                
کلمبیا پیکچرز                                                                   	میدان انقلاب روبروی سینما بهمن خ منیری جاوید پ 225ط اول جنوبی	\N
گومون                                                                           	خیابان قلعه مرغی، خیابان 20 متری ابوذر، جنب مسجد، پلاک 336	5532                
لوکاس فیلم                                                                      	خیابان دماوند خ میرفخرایی (شهید طاهری ) پلاک 42	\N
وارنر برادرز                                                                    	خ شهید بهشتی بعد از تقاطع سهروردی جنب بانک تجارت ساختمان 146	8982                
والت دیزنی پیکچرز                                                               	خیابان آیت اله کاشانی ، بین رامین و گلستان ، پلاک 264 ، طبقه همکف ، واحد 2	6685                
ورنر هرتسوک                                                                     	خیابان آزادی  خیابان جیحون بعداز مالک اشتر پلاک275 طبقه اول واحد 3	6543                
یونیورسال استودیوز                                                              	شهرری خ فداییان اسلام خ امام حسین مسجد مرتضی علی طبقه اول	\N
\.


--
-- Data for Name: festival_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY festival_table (title, year, location, host_title) FROM stdin;
جشن سينمای ايران                                  	1391	تهران - شریعتی - بالاتراز خیابان دولت	کانون پرورش فکری کودکان و نوجوانان                                              
جشن سينمای ايران                                  	1392	تهران - شریعتی - بالاتراز خیابان دولت	کانون پرورش فکری کودکان و نوجوانان                                              
جشنواره بين المللی فیلم فجر                       	1389	تهران - خیابان شریعتی روبروی بهارشیراز	والت دیزنی پیکچرز                                                               
جشنواره بين المللی فیلم فجر                       	1393	تهران - خیابان شریعتی روبروی بهارشیراز	وارنر برادرز                                                                    
جشنواره بين المللي فيلم رشد                       	1390	تهران - میدان صادقیه - بلوار کاشانی - بلوار اباذر 	خانه فیلم مخملباف                                                               
جشنواره بين المللي فيلم رشد                       	1392	تهران - میدان صادقیه - بلوار کاشانی - بلوار اباذر 	پیکسار                                                                          
جشنواره فیلم روستا                                	1391	تهران - بزرگراه شهید ستاری - نبش پیامبر مرکزی	یونیورسال استودیوز                                                              
جشنواره فیلم روستا                                	1393	تهران - بزرگراه شهید ستاری - نبش پیامبر مرکزی	کانون پرورش فکری کودکان و نوجوانان                                              
جشنواره فیلم کوتاه نهال                           	1390	تهران - اتوبان نواب، بعدازپل حق شناس، بلوار چراغی، شماره 41	یونیورسال استودیوز                                                              
جشنواره فیلم ونیز                                 	1388	تهران - خیابان - رودکی نرسیده به چهارراه دامپرشکی	ورنر هرتسوک                                                                     
جشنواره فیلم برلین                                	1389	تهران - نارمک پایین تر از میدان هلال احمر خیابان گلستان	لوکاس فیلم                                                                      
جشنواره فیلم کن                                   	1392	تهران - نارمک پایین تر از میدان هلال احمر خیابان گلستان	دریم‌ورکس                                                                       
\.


--
-- Data for Name: fund_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fund_table (movie_title, movie_release_year, investor_account_number, amount) FROM stdin;
\.


--
-- Data for Name: investor_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY investor_table (account_number) FROM stdin;
6767                
2301                
1111                
9874                
4321                
0849                
4542                
5532                
3233                
1123                
8984                
4320                
6454                
5434                
8982                
6685                
6543                
3223                
\.


--
-- Data for Name: movie_artist_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie_artist_table (artist_name, movie_title, movie_release_year, profession) FROM stdin;
\.


--
-- Data for Name: movie_candid_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie_candid_table (festival_title, festival_year, award_title, candidate_movie_title, candidate_movie_year) FROM stdin;
\.


--
-- Data for Name: movie_genre_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie_genre_table (movie_title, movie_release_year, genre) FROM stdin;
۵۰ قدم آخر                                                                      	1392	اکشن
۵۷۸ روز انتظار                                                                  	1390	خونریزی قهرمانانه
آتيش بازي                                                                       	1392	ماجرایی
اخراجیها                                                                        	1385	اکشن
اخراجيها ۲                                                                      	1387	خونریزی قهرمانانه
آذر، شهدخت، پرويز و ديگران                                                      	1392	زندگی‌نامه‌ای
آرايش غليظ                                                                      	1392	اسکروبال
ارسال يك آگهي تسليت براي روزنامه                                                	1392	کمدی سیاه
اسب حیوان نجیبی است                                                             	1390	کمدی-درام
آسمان زرد كم عمق                                                                	1391	مستند درام
آسمان هشتم                                                                      	1390	حماسی
اشیا از آنچه در آینه می‌بینید به شما نزدیکترند                                  	1391	خیال‌پردازی معاصر
اشباح                                                                           	1392	تجربی
آشغال های دوست داشتنی                                                           	1391	فانتزی
افق عمودي است                                                                   	1392	شبه مستند
اگه می تونی منو بگیر                                                            	1385	خیال‌پردازی حماسی
گشت ارشاد                                                                       	1390	کمدی ترسناک
زندگی مشترک آقای محمودی و بانو                                                  	1391	اسلشر
زنان ونوسي، مردان مريخي                                                         	1389	موزیکال
زندگي خصوصي آقا و خانم ميم                                                      	1390	گونه هنری
چند متر مكعب عشق                                                                	1392	ابرقهرمانی
فقط چشم‌هاتو ببند                                                               	1385	ابرقهرمانی
گام های شیدایی                                                                  	1391	سرقت
زمانی برای دوست داشتن                                                           	1386	وسترن
در امتداد شهر                                                                   	1390	زوج هنری
نصف مال من، نصف مال تو                                                          	1385	جاسوسی
كلاه قرمزي و بچه ننه                                                            	1390	پویانمایی
چه خوبه كه برگشتی                                                               	1391	جنایی
سنتوری                                                                          	1385	جنایی
زندگی شیرین                                                                     	1387	گونه هنری
رسوایی                                                                          	1391	هنتای
طلا و مس                                                                        	1387	سه‌بعدی
چگونه میلیاردر شدم                                                              	1390	سه‌بعدی
میم مثل مادر                                                                    	1385	تریلر سیاسی
من مادر هستم                                                                    	1390	تریلر سیاسی
دایره زنگی                                                                      	1386	سایبرپانک
گیس بریده                                                                       	1385	وسترن اسپاگتی
نیوه مانگ                                                                       	1385	رزمی
جدایی نادر از سیمین                                                             	1390	وسترن
تنها دو بار زندگی می كنیم                                                       	1386	تریلر روانشناسانه
تهران انار ندارد                                                                	1388	پویانمایی رایانه‌ای
هیس! دخترها فریاد نمی زنند                                                      	1391	عکاسی سیاه و سفید
هیچ كجا هیچ كس                                                                  	1391	هنتای
همیشه پای یك زن در میان است                                                     	1386	وسترن اسپاگتی
ورود آقایان ممنوع                                                               	1390	جنایی
يكي مي خواد باهات حرف بزنه                                                      	1390	پویانمایی
بشارت به یك شهروند هزاره سوم                                                    	1391	جاسوسی
آنچه مردان درباره‌ي زنان نمي‌دانند                                              	1392	وسترن
انتهاي خيابان هشتم                                                              	1390	ابرقهرمانی
آواز گنجشك ها                                                                   	1386	گونه هنری
او خوب سنگ می زند                                                               	1391	رمانتیک
اينجا بدون من                                                                   	1389	رمانتیک
باد در علفزار می پیچد                                                           	1386	خیال‌پردازی حماسی
بوسيدن روي ماه                                                                  	1390	تجربی
اينجا شهر ديگري است                                                             	1390	گونه هنری
مهمان                                                                           	1385	تکنو تریلر
انارهاي نارس                                                                    	1392	کمدی-درام
بيداري براي سه روز                                                              	1392	زندگی‌نامه‌ای
پرتقال خونی                                                                     	1389	ماجرایی
پرسه در مه                                                                      	1388	اکشن
تلفن همراه رئيس جمهور                                                           	1390	خونریزی قهرمانانه
بدرود بغداد                                                                     	1388	پویانمایی رایانه‌ای
تلافی                                                                           	1386	فانتزی
\.


--
-- Data for Name: movie_list_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie_list_table (list_user_email, list_title, movie_title, movie_release_year) FROM stdin;
\.


--
-- Data for Name: movie_rate_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie_rate_table (movie_title, movie_release_year, user_email, rating) FROM stdin;
\.


--
-- Data for Name: movie_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie_table (title, release_year, country, main_language, story_line, min_age) FROM stdin;
يكي مي خواد باهات حرف بزنه                                                      	1390	ایران	فارسی	داستان این فیلم زنی به نام لیلا است یک هفته فرصت دارد برای امری حیاتی از شوهر سابق اش رضایت بگیرد.	12
من مادر هستم                                                                    	1390	ایران	فارسی	فیلم دربارۀ زندگی دو خانواده مرفه است که در حال فروپاشی است. در این میان حوادثی که برای دختر یکی از خانواده ها که نوزده سال دارد(باران کوثری) پدید می آید، سبب برملا شدن بسیاری از رازهای زندگی آدم های قصه می شود.	12
كلاه قرمزي و بچه ننه                                                            	1390	ایران	فارسی	داستان شیطنت‌های پسرعمه‌زاست که کلاه‌قرمزی و آقای مجری را به دردسر می‌اندازد و ماجرای جدیدی پیش می‌آید که منجر به ورود مهمان ناخوانده‌ای می‌شود	21
۵۰ قدم آخر                                                                      	1392	ایران	فارسی	این فیلم سینمایی سرگذشت واقعی یکی از نیروهای اطلاعات لشکر زرهی نجف اشرف در عملیات والفجر ۴ را نمایش می‌دهد که برای شناسایی به یک منطقه مین‌گذاری شده در خاک عراق می‌رود و ۱۷ روز تمام با پایی زخمی انتظار می‌کشد تا بالاخره به کمکش می‌آیند ولی…	13
آشغال های دوست داشتنی                                                           	1391	ایران	فارسی	درباره‌ خانواده‌اي است که يک شب فرصت دارند مشکل مادر خانواده را حل کنند.	18
آنچه مردان درباره‌ي زنان نمي‌دانند                                              	1392	ایران	فارسی	آنچه مردان درباره زنان نمی‌دانند فیلمی اجتماعی، ساخت ایران به کارگردانی و نویسندگی قربان محمدپور محصول سال ۱۳۹۲ است.	19
۵۷۸ روز انتظار                                                                  	1390	ایران	فارسی	در رابطه با عمليات بزرگ بيت المقدس و فتح خرمشهر است؛ در اين فيلم قبل و زمان آزادسازي به تصوير كشيده شده است	15
بيداري براي سه روز                                                              	1392	ایران	فارسی	پرویز پرستویی و سهیلا گلستانی تصمیم می‌گیرند سه روز بیدا بمانند و همزمان به کارهای عادی خود بپردازند	11
افق عمودي است                                                                   	1392	ایران	فارسی	در يك شب يلداي برفي، وقوع اتفاق‌هايي عجيب و غير منتظره، عروس و دامادي را در معرض تصميم گيري هاي گروتسك و متناقضي قرار مي دهد.	5
بشارت به یك شهروند هزاره سوم                                                    	1391	ایران	فارسی	داستان فيلم درباره ايمان و اعتقادات معنوي است ...	15
آرايش غليظ                                                                      	1392	ایران	فارسی	جوانی بار قاچاق ترقه و فشفشه‌های چهارشنبه سوری یکی از دوستانش را بالا می‌کشد و از طریق دختری که دوستش دارد تلاش می‌کند آنها را بفروشد.	11
اسب حیوان نجیبی است                                                             	1390	ایران	فارسی	داستان این فیلم درباره یک مجرم فراری است که به مدت ۲۴ ساعت از زندان مرخصی گرفته و در این مدت میکوشد به زعم خود، اسباب سوء استفاده از گروهی از مردم را فراهم آورد.	15
آسمان زرد كم عمق                                                                	1391	ایران	فارسی	زوج جوانی در مدتی کوتاه، لحظات زندگی گذشته‌شان را مرور می‌کنند و این مرور خاطرات، زندگی حال‌شان را تحت تأثیر قرار می‌دهد.	10
بوسيدن روي ماه                                                                  	1390	ایران	فارسی	این فیلم داستان احترام‌السادات و فروغ خانم که در همسایگی هم زندگی می کنند بیش از بیست سال است که در انتظار فرزندانشان هستند.	14
چگونه میلیاردر شدم                                                              	1390	ایران	فارسی	رضا شاكري مشكلات عديده اي با خانه و خانواده خود دارد و در حل آنها درمانده است. او براي رفع مشكلات خود در كوران حوادثي باورنكردني قرار مي گيرد و در سفري سخت و رويايي سر از دنياي ديگري درمي آورد. دنيايي كه بودن در آن آرزوي هر انساني است.	22
آتيش بازي                                                                       	1392	ایران	فارسی	قديمي‌يا مي‌گن طرف اين قدر شير داغ خورده دهنشو سوزنده، موقعي که مي‌خواد دوغ بخوره فوتش مي‌کنه.	16
در امتداد شهر                                                                   	1390	ایران	فارسی	در پی سرقت از یک جواهرفروشی، محمدرضا گلزار ستاره سینمای ایران به گروگان گرفته می‌شود. از این پس قصه‌های موازی آدم‌هایی را می‌بینیم که هر یک درگیر ماجراهایی خاص هستند...	11
زندگی مشترک آقای محمودی و بانو                                                  	1391	ایران	فارسی	ساناز (ترانه علیدوستی) به همراه همسرش رامتین (پیمان قاسم خانی) برای مرمت منزل خاله خود محدثه (هنگامه قاضیانی) چند روزی مهمان آنها هستند.	5
تنها دو بار زندگی می كنیم                                                       	1386	ایران	فارسی	سیامک راننده مینی‌بوس است. او تصمیم می‌گیرد در فرصتی چند روزه، کارهایی را که همیشه حسرت‌شان را داشته انجام دهد و در روز تولدش از دنیا برود.	16
سنتوری                                                                          	1385	ایران	فارسی	علی، نوازنده چیره‌دست سنتور و خواننده محبوب جوانان ناگهان در اوج شهرت و موفقیت افسار زندگی را از دست می‌دهد و به بیراهه می‌رود. او می‌گوید همه بدبختی‌ها از وقتی شروع شد که عشق بزرگ زندگی ام، هانیه مرا ترک کرد، اما هانیه زمانی می‌رود که علی مدت هاست در بند اعتیاد خانمان سوز خود گرفتار است...	7
گیس بریده                                                                       	1385	ایران	فارسی	روايتگر داستان دختر جواني به نام «مريم» است كه عليه انتظارات نامعقول پدر خود عصيان مي كند و اين سرآغاز كشمكشي است كه بقيه اعضاي خانواده را نيز درگير ماجراهايي مي كند.	14
مهمان                                                                           	1385	ایران	فارسی	این فیلم موضوعی عشقی و عاطفی دارد و به رابطه دو مرد و یک زن که به نوعی یک مثلث عشقی محسوب می‌شود، می‌پردازد.	19
همیشه پای یك زن در میان است                                                     	1386	ایران	فارسی	فیلم روایتگر زن و شوهری جوان است که به رغم یک ازدواج عاشقانه کارشان به طلاق خصمانه رسیده و در این میان پای افراد زیادی به ماجرا باز می‌شود.	16
اخراجيها ۲                                                                      	1387	ایران	فارسی	این داستان ادامه داستان اخراجی‌ها است و اینکه اخراجی‌ها اسیر شده و به اردوگاهی به سرپرستی حاج رسول می‌روند از طرفی خانواده آنها که قصد مسافرت به مشهد را داشتند با ربودن این هواپیما و نشستن رباینده در عراق، صدام حسین قصد سواستفاده تبلیغاتی دارد و به افراد درون اردوگاه دستور می‌دهد که در روزی آهنگ لیلی را در جلوی خبرنگاران بخوانند و برقصند و ربوده‌شدگان هم درخواست پناهندگی کنند در صورتی که در آخر برگه درخواست پناهندگی را پاره کرده و اسرا سرود ای ایران را می‌خوانند.	16
آذر، شهدخت، پرويز و ديگران                                                      	1392	ایران	فارسی	همسر خانه‌دار یک بازیگر مشهور سینما در آخرین فیلم او با وی همبازی می‌شود و آنچنان مورد توجه منتقدان قرار می‌گیرد که منجر به حسادت او می‌شود. روابط صمیمانه آنها تیره شده، زن قهر می‌کند و به باغچه خانوادگی دماوند می‌رود. با بازگشت دخترشان به ایران روابط آنها دستخوش تحولاتی می‌شود.	12
اخراجیها                                                                        	1385	ایران	فارسی	مجید از اراذل جنوب تهران عاشق دختر پیرمرد عارفی به نام میرزا می‌شود. میرزا شرط ازدواج مجید و دخترش را سر به راه شدن او می‌داند. مجید تصمیم می‌گیرد برای اثبات سر به راه شدن خود به جبهه برود که بقیه دوستانش نیز همراه او می‌شوند. برای حضور آنها در جبهه، مخالفت‌هایی وجود دارد اما باضمانت میرزا و یکی دیگر رزمنده‌ها آنها به پادگان آموزشی می‌رسند.	15
ارسال يك آگهي تسليت براي روزنامه                                                	1392	ایران	فارسی	طاها و ریحان مدتی است به خاطر یک آگهی در روزنامه مشغول مراقبت از پیرمردی به اسم منوچهر آصف هستند. به زودی در خانه آصف اتفاقاتی روی می‌دهد که طاها و ریحان را دچار مشکلاتی کرده و آنها را در سر در گمی قرار می‌دهد.	14
آسمان هشتم                                                                      	1390	ایران	فارسی	خالده زني باكويي است كه همراه با پسرش قربان و دختر كر و لالش زلفيه به مشهد سفر مي كنند تا ناراحتي قلبي قربان مداوا شود.	4
اشیا از آنچه در آینه می‌بینید به شما نزدیکترند                                  	1391	ایران	فارسی	اين فيلم در مورد زني باردار به اسم ليلاست. او با مشکلي دست به گريبان است که اگرچه کوچک و بي‌اهميت به نظر مي‌رسد اما براي او بزرگ است	19
اشباح                                                                           	1392	ایران	فارسی	تیمسار سلیمانی و همسرش در روابط خود به بن‌بست می‌رسند، تلاش‌های وكیل خانواده برای بهبود اوضاع زندگی آنها بی‌نتیجه می‌ماند. سال‌ها بعد گناهان تیمسار گریبان مازیار (پسر جوانش) را می‌گیرد و مسیر عشق و زندگی او را دشوار می‌سازد.	21
پرسه در مه                                                                      	1388	ایران	فارسی	امین که آهنگ‌ساز و نوازنده‌ی پیانو است، پس از ازدواج با رویا بازیگر تئاتر، با مشکلات زیادی روبه‌رو می‌شود که زندگی آنان را تحت‌الشعاع قرار می‌دهد تا جایی که کارش را رها می‌کند، همسرش را از دست می‌دهد و دچار وضعیت نامتعادلی می‌شود.	11
اگه می تونی منو بگیر                                                            	1385	آمریکا	انگلیسی	داستان فیلم «اگه میتنونی منو بگیر» مربوط به زندگی‌نامۀ «فرانک ابگنیل»(به انگلیسی: [William Abagnale]) است، کسی که شهرتش را به خاطر سابقه فعالیتش به عنوان جاعل چک، کلاهبرداری و حقه‌های فرارش از دست ماموران به‌دست آورد. او در دهه شصت میلادی و در 16 سالگی توانسته بود، چک‌های جعلی که مجموعاً به مبلغ ۴ میلیون دلار آمریکا ارزش داشت را در ۲۶ کشور جهان نقد کند، طوری که هیچ بانکی قادر به تشخیص جعلی‌بودن چکهای او نبود و تا هجده سالگی، بیش از ۲۵۰ پرواز انجام داد و در ۲۶ کشور جهان به این کلاهبرداری‌ها دست زد. اَبیگنِل به خاطر عضویت جعلی که در «خطوط هوایی سراسری آمریکا» داشت، می‌توانست به‌صورت رایگان در هتلها اقامت کند و تمام هزینه های غذا و تفریحش به‌طور مستقیم به شرکت ارسال می‌شد. حتی خودش را به عنوان وکیل جا زد و در چندین پروندۀ دادگاهی شرکت داشت. او سرانجام در سال ۱۹۶۹ در فرانسه دستگیر شد و به دوازده سال زندان محکوم شد که البته پس از گذراندن پنج سال از دوران محکومیت خود به خدمت سازمان «اف‌بی‌آی» در آمد تا در شناسایی چک های جعلی و سرقتی کمک کند.\nاَبیگنِل که هم اکنون رئیس شرکت «کارشناسی جعل و کلاهبرداری» اَبیگنِل و شرکا است در سال 2002، زندگی‌نامۀ خود را در اختیار «استیون اسپیلبرگ» (به انگلیسی: [Spielberg]) قرار داد و او نیز با استفاده از ماجرای زندگی اَبیگنِل فیلم «اگه میتونی منو بگیر!» را کارگردانی کرد. در این فیلم که «لئوناردو دی‌کاپریو» (به انگلیسی: [DiCaprio]) نقش اَبیگنِل را بازی می‌کند، مدام تحت تعقیب اف‌بی‌آی قرار دارد.\nاَبیگنِل به عنوان یک فرد دارای هوش بالا، به‌ویژه هوش هیجانی فوق العاده، پس از کلاهبرداری‌ها و جعل‌های فراوان به فرانسه می‌رود و در تمام مدت، «کارل هانرتی» (به انگلیسی: Carl Hanratty)، مأموری که او را تعقیب می‌کرد را به دنبال خود می‌کشد. پرسشی که هانرتی از خود می‌پرسید، این بود: « چرا گاه‌وبیگاه، این کلاهبردار جوان به مناسبت‌های مختلف با او تماس می‌گیرد؟» هانرتی، فهمیده بود که اَبیگنِل، چیزی می‌خواهد به او بگوید، چیزی که در یک بازی بروز یافته بود، اینکه: «اگه میتونی منو بگیر!» در واقع او به این روش می‌گفت: «اگه ممکنه با من همدلی کن!» وقتی پلیس فرانسه، اَبیگنِل را محاصره کرده بود، هانرتی می‌توانست اجازه دهد او را بکشند و از شر یک جاعل کلاهبردار، راحت شود اما او بدون اسلحه به نزد اَبیگنِل می‌رود و با او «همدلی» می‌کند و به این ترتیب، نجات ابیگنل از سقوط به ورطه، تنها به دلیل وجود کسی مانند هانرتی است که با هیجان‌رفتار همدلانه توانست، این نابغۀ کلاهبردار را نجات دهد. بسیاری رابطۀ بین هانرتی و اَبیگنِل را رمانتیک و احساسی‌گری می‌دانند، اما هانرتی به عنوان مأمور دستگیری جاعلان چک، دلش برای اَبیگنِل نمی‌سوخت، بلکه او تلاش می‌کرد علت تعارض عاطفی اَبیگنِل را بیابد و به او کمک کند تا با پذیرفتن خطاها و اشتباه‌هایش مسیر جدیدی را در زندگی شروع کند. به این ترتیب او نه تنها همدلی عاطفی را با تشویق و تحسین هوش اَبیگنِل پرورش می‌داد، بلکه موجب تصحیح خطاهای شناختی او شد (همدلی شناختی).	9
انارهاي نارس                                                                    	1392	ایران	فارسی	انسی و ذبیح در حاشیهٔ شهر و در خانه‌ای اجاره‌ای زندگی می‌کنند. انسی از زنی سالخورده پرستاری می‌کند و ذبیح در شمال شهر کارگر ساختمانی است. آنها آرزو دارند بچه‌دار شوند.	12
انتهاي خيابان هشتم                                                              	1390	ایران	فارسی	نیلوفر(ترانه علیدوستی) دختری که به همراه نامزدش بهرام(صابر ابر) طی سه روز به آب و آتش می زند تا تنها برادرش سعید را از اعدام نجات دهد، انها قصد فراهم کردن 100 میلیون پول نقد را دارند در حالی که فقط 30 میلیون آن را تهیه کرده اند، از طرفی موسی(حامد بهداد) که در استبلی مشغول کار و مسابقات زیرزمینیست می خواهد مبلغی را برای کمک به نیلوفر تهیه کند و دوستش سعید را نجات دهد، اما این تلاش شکل دیگری به خودش گرفته و منتهی به انتهای خیابان هشتم می شود !	13
آواز گنجشك ها                                                                   	1386	ایران	فارسی	این فیلم به داستان مرد ساده و میانسالی به نام کریم می‌پردازد. وی در یک مزرعه پرورش حیوانات کار می‌کند و شیفته شترمرغهاست و ارتباط روانی و عاطفی با آنها برقرار کرده است. برحسب اتفاق یکی از شترمرغها از مزرعه فرار می‌کند. کریم چند روزی او را جستجو می‌کند، اما موفق نمی‌شود بیابدش و در نتیجه از کار اخراج می‌شود. این بهانه‌ای می‌شود که برای اولین بار به شهر برود. در شهر از طریق مسافرکشی با موتورسیکلت امرار معاش می‌کند. در شهر با حوادث زیادی روبرو می‌شود و تجارب زیادی پیدا می‌کند. در کوران این حوادث، شاهد تحول کریم هستیم.	10
او خوب سنگ می زند                                                               	1391	ایران	فارسی	داستان نوجواني است به نام بردو که پدر خود را از دست داده و به همراه برادر ومادر خود زندگي ميکنند. بردو بخاطر اينکه بتواند زندگي خود را سرو سامان دهد راهي سفري ميشود که طلب پدر خودرا پس بگيرد که در ميانه راه در گير اتفاقاتي ناخواسته مي شود.	14
اينجا بدون من                                                                   	1389	ایران	فارسی	فیلم داستان خانواده‌ای ست متشکل از مادر (فاطمه معتمد آریا) و دو فرزندش، احسان (صابر ابر) و یلدا (نگار جواهریان) که در آرزوی دستیابی به رویاهای خود هستند و امیدوارانه تحولی را انتظار می‌کشند. یلدا معلول است و تمام دغدغه مادر تامین آینده اوست. ورود رضا دوست احسان با بازی (پارسا پیروزفر) زندگی آنان را دستخوش تغییراتی می‌کند...	15
اينجا شهر ديگري است                                                             	1390	ایران	فارسی	داستان زمان پس از ضربت خوردن حضرت علي عليه‌السّلام را روايت مي‌کند و ظلم‌هايي که به ايشان از سوي افراد مختلف روا شده در فيلم ديده مي‌شود. فيلم يک شب پس از ضربت خوردن حضرت‌علي تا زمان شهادت را به تصوير خواهد کشيد و قصه در مدت زمان 24 ساعت مي‌گذرد. داستان حول محور چهار شخصيت اصلي مي‌گذرد.	11
باد در علفزار می پیچد                                                           	1386	ایران	فارسی	شوکا دختر جوانی است که به علت فقر خانواده مجبور می شود به ازدواج با پسر عقب افتاده ای تن دهد تا کمی از بار مشکلات خانواده کم شود، اما جلیل شاگرد خیاط دل در گرو شوکا دارد و این موضوع اتفاقاتی را به وجود می آورد و...	19
بدرود بغداد                                                                     	1388	ایران	عربی	در خلاصه داستانِ «بدرود بغداد» آمده‌است: دانیِل دالکا بعد از شکست در مسابقه بوکس یکی از شرط بندها را به قتل می‌رساند و برای فرار از دست مافیا هیچ جایی را امن‌تر از ارتش نمی‌یابد...\n\nاین فیلم، داستان دو سرباز آمریکایی (دنیِل دالکا با بازی مزدک میرعابدینی) و عراقی (صالح المزروق با بازی مصطفی زمانی) است که هر یک با پیشینه‌ای تعریف شده به نوعی، به شرایط جنگ و رویارویی هل داده شده‌اند. اما همان پیشینه و به نوعی تحمیلی بودن موقعیت باعث می‌شود مسیری متفاوت را در جنگِ رو در رو انتخاب کنند و از تضاد و تقابل به همراهی برسند.\n\nمخالفان اشغال عراق، هشدار دادند که عراق و خاورمیانه باتلاق بزرگی است برای آمریکا. امّا سرکردگان آمریکایی گوش نکردند. پس در باتلاق هر چه دست و پا بزنی بیشتر فرو می‌روی و مادرانِ سربازهای هر دو طرف جنگ، هیچ وقت فرمانده‌هان را نمی‌بخشند.	13
پرتقال خونی                                                                     	1389	ایران	فارسی	پرتقال خونی روایت داستان مهندس میانسالی به نام والا است که در آستانه جدایی از همسرش است. در این بین دختر جوانی به نام ترمه برای طراحی دکور دفتر کارش می‌آید و رفته رفته این آشنایی به شکل‌گیری رابطه‌ای عاطفی می‌انجامد تا اینکه عکاس جوانی به نام سیاوش وارد زندگی ترمه می‌شودو...	11
تلافی                                                                           	1386	ایران	فارسی	یک زن وشوهرجوان به دلیل اختلاف های زیادتصمیم به جدایی می گیرند.امادرست روزپیش ازطلاق مردمتوجه میشودکه زنش سرطان داردونهایتاتا2ماه دیگرزنده است.بنابراین تصمیم می گیردتامانع طلاقشان شودوبعدازمرگ همسرش وارث اوباشد...	12
تلفن همراه رئيس جمهور                                                           	1390	ایران	فارسی	پیرمردی که شغلش باربری است و قصد خرید سیم‌کارت و تلفن همراه را دارد که دست بر قضا سیم کارت خاموش سالیان گذشته رئیس جمهور مورد معامله قرار می‌گیرد.	15
تهران انار ندارد                                                                	1388	ایران	فارسی	تهران انار ندارد مستندی انتقادی، سیاسی، اجتماعی و فرهنگی درباره تهران و تاریخچه آن است، که در عین حال به واسطه موزیکال و طنز بودن فیلم، وجهی سرگرم کننده نیز پیدا می‌کند. این فیلم را دو نفر روایت می‌کنند. یکی نصرت کریمی است که از تهران قدیم صحبت می‌کند و دیگری مسعود بخشی نویسنده و کارگردان فیلم که ظاهراً دارد گزارش تهیهٔ فیلم ناتمام خود را به مقامات می‌دهد و مشکلات بی شمارش را در جریان ساختن فیلم شرح می‌دهد از جمله اینکه پنج سال منتظر صدور اجازه فیلمبرداری بوده‌است.\n\nتهران انار ندارد به قول کارگردانش نه مستند است و نه داستانی بلکه فقط یک فیلم است ، فیلمی درباره وجوه مختلف شهر تهران، از تاریخ ۲۰۰ ساله‌اش گرفته تا مشکلات معاصرش، فیلم روایتی است از رشد قریه‌ای در شمال ری که بهترین محصولش اناری است که در هیچ شهر دیگری مثال و مانندی ندارد. فیلم با بیانی هجوآلود معضلات تهران امروز را پیش چشم مخاطب هدف خود یعنی ساکنان تهران می‌گذارد و مشکلات ریز و درشت شهر را در برهه‌های گوناگون زمانی بررسی و مقایسه می‌کند و تصویری پیش چشم بیننده می‌نهد که گویی ساختارهای مادی و اخلاقی جامعه‌ای روستایی در مقیاس یک متروپولیس غول آسا تکرار می‌شوند و این همه نه با بیان خشک و جدی معمول سینمای مستند بلکه با طنزی که بتوان مشکلات بزرگ ساکنان شهر را بیان کرد.\n\nموسیقی و طنز از قابلیت‌هایی است که کارگردان برای دوری از شیوه‌های مرسوم ساخت فیلم مستند از آن‌ها بهره برده‌است. به گفته مسعود بخشی در نظر گرفتن ملاحظات اقتصادی اکران نیز در به کار بردن این تمهیدات بی‌تاثیر نبوده‌است و البته طنز و موسیقی به جهت دهی وجه انتقادی فیلم کمک شایانی کرده‌است. از منظر منتقدین بیشتر طنز فیلم مسعود بخشی طنزی کلامی است، به عبارت بهتر بسیاری از صحنه‌هایی که بار طنز دارند به دلیل کلامی است که روی آن شنیده می‌شود.\n\nحضور سانسور چندین بار در طول فیلم یادآوری می‌شود به ویژه هنگام نمایش مستندهای قدیمی که به دلیل حساسیت سیاسی یا اخلاقی سانسورچی، فیلم‌های قدیمی قطع شده و تصویر لابراتوار فیلم و مرمت دو سر نوار سلولوئید قطع شده بر روی دستگاه مونتاژ نمایش داده می‌شود.	19
جدایی نادر از سیمین                                                             	1390	ایران	فارسی	سیمین (لیلا حاتمی) می‌خواهد به همراه همسرش نادر و دخترش ترمه (سارینا فرهادی) از ایران برود و همه مقدمات این کار را فراهم کرده. اما نادر (پیمان معادی) نمی‌خواهد پدرش را که از بیماری آلزایمر رنج می‌برد تنها رها کند. این اختلافات باعث می‌شود سیمین از دادگاه درخواست طلاق کند اما دادگاه درخواستش رادر مورد مالکیت فرزندش رد می‌کند و مجبور می‌شود به خانه پدرش برگردد. ترمه تصمیم می‌گیرد پیش پدرش نادر بماند به امید اینکه مادرش سیمین پیش آنها برگردد. نادر نمی‌تواند از عهده مراقبت از پدرش بر بیاید پس برای این کار یک مستخدم به نام راضیه (ساره بیات) استخدام می‌کند. این زن جوان که باردار است این کار را بدون اطلاع همسرش حجت (شهاب حسینی) قبول کرده‌است. یک روز نادر به خانه بر می‌گردد و پدرش را در حالی که دستش با روسری به تخت بسته شده و از روی تخت به زمین افتاده و تنها رها شده می‌بیند. وقتی راضیه به خانه بر می‌گردد دعوای شدیدی در می‌گیرد که عواقب تراژیک آن نه تنها زندگی نادر را زیر و رو می‌کند بلکه تصویر دخترش از او را دستخوش تغییر می‌کند. راضیه به دلیل مرگ جنینش به بیمارستان منتقل می‌شود او و همسرش دلیل مرگ جنین را هل دادن نادر میدانند و از نادر شکایت می‌کنند و ...	20
چند متر مكعب عشق                                                                	1392	ایران	فارسی	عبدالسلام که یک مهاجر افغان است، به همراه دخترش مرونا در یک کارگاه مشغول کار و زندگی است. عشقی در راه است عشق صابر به مرونا، عشقی که فرجامش را هیچ کس نمی‌داند، نه صابر، نه مرونا و نه حتی عبدالسلام...	10
چه خوبه كه برگشتی                                                               	1391	ایران	فارسی	فرزاد دندانپزشکی که پس از سال‌ها به ایران می‌آید تا دور از مسائل و آشفتگی زندگی‌اش به آرامش برسد. همزمان با ورود او به کشوریک شی مرموز شبه‌فضایی پدیدار می‌شود و پای خانم دکتر یاسمین و سنگ‌های جادویی‌اش را به ماجرایی باز می‌کند که رفاقت دیرینه فرزاد و کامبیز را که سالهاست در همسایگی هم کنار دریا زندگی می‌کنند، به جدالی بیهوده می‌کشاند ولی...	11
دایره زنگی                                                                      	1386	ایران	فارسی	محمد و شیرین تنها تا شب فرصت دارند پول مورد نیاز خود را تهیه کنند. آن‌ها راهی خانه‌ای در بالای شهر می‌شوند تا شاید بتوانند با کاری که انجام می‌دهند، هر چه سریع‌تر این مبلغ را تأمین کنند.	13
رسوایی                                                                          	1391	ایران	فارسی	افسانه دختری زیبارو و فقیر جنوب شهری است که به علاقه‌مند به حضور در جامعه با ظاهری متفاوت و جلب توجه مردان می‌باشد. خانواده وی از طرف آقاشریف که بدهکار و صاحبخانه ایشان است، تحت فشار هستند. آقاشریف که مردی میانسال و مجرد (به دلیل فوت همسر) است، علاقه‌مند به ازدواج با افسانه است و این مهم را شرط برداشتن فشارهای مالی از جانب خود به افسانه و خانواده وی عنوان کرده است. افسانه نیز تصمیم می‌گیرد برای کمک به خانواده خود، به آقا شریف نزدیک شود تا بتواند امتیازهایی از وی بگیرد. اما در یکی از دیدارهای خصوصی که بین وی و آقا شریف در دفتر کار آقا شریف انجام می‌شود ...	10
زمانی برای دوست داشتن                                                           	1386	ایران	فارسی	قصه این فیلم ارزشی و زیبا درباره کودکی معلول و استثنایی است که درکنار پدر و مادر و برادر کوچکش زندگی می کند. تلاش این کودک برای برقراری ارتباط با اطرافیان خود به خصوص اعضا اصلی خانواده‌اش شرایط و موقعیت‌های مختلفی را در زندگی این افراد به وجود می‌آورد.	9
زنان ونوسي، مردان مريخي                                                         	1389	ایران	فارسی	همسر مهندس جوانی به نام سعید وی را مجبور می‌کند مبلغ هنگفتی قرض کرده و او را برای اسکی و تفریح به فرانسه و کوه‌های آلپ بفرستد. در آلپ هنگام اسکی، زن در یک یخچال طبیعی سقوط کرده و می‌میرد. سعید پس از بیرون آمدن از بهت و حیرت ناشی از مرگ همسرش با دختر دیگری ازدواج می‌کند، اما بلافاصله بعد از ازدواج جسد یخ زده همسر قبلی در کوه آلپ پیدا می‌شود و در اثر اتفاقی زنده شده و به ایران برمی‌گردد.	6
زندگی شیرین                                                                     	1387	ایتالیا	ایتالیایی	زندگی شیرین در هفت بخش دنبال می‌شود:\n\n۱. عصری که مارچلو با مادالنا (آنوک امه) سپری می‌کند.\n\n۲. شب طولانی او با سیلویا (آنیتا اکبرگ) هنرپشه آمریکایی که با رسیدن سحر و در آبنمای تروی پایان میابد.\n\n۳. برخورد دوباره او با استینر (آلن کانی) روشنفکر. این ارتباط در سه بخش در طول فیلم صورت می‌گیرد. رویارویی، میهمانی و تراژدی استینر.\n\n۴. معجزه دروغین\n\n۵. دیدار با پدر/مهمانی استینر\n\n۶. مهمانی اشرافی/تراژدی استینر\n\n۷. مهمانی عیاشی در خانه ساحلی	7
زندگي خصوصي آقا و خانم ميم                                                      	1390	ایران	فارسی	محسن (با بازی حمید فرخ‌نژاد) که یک مدیر فروش در سطح شهرستان است ارتقا گرفته و به یک مدیر در سطح کشور تبدیل شده است. ولی دغدغه او داشتن همسری نه چندان مدرن است که ممکن است باعث سرافکندگی و تحقیر محسن در بین همکاران پایتخت‌نشین وی شود. پس سعی می‌کند به مرور وی را از زندگی خود بیرون کنذ. آوا (با بازی مهتاب کرامتی) به رفتارهای خارج از عرف همسرش با همکاران زنش بدبین شده است. پس تصمیم می‌گیرد خود را آن‌گونه که محسن تمایل دارد نشان دهد و بتواند در کنار همسر موفقش ادامه زندگی دهد. این‌کار با آرایش‌های‌ جدید و پوشیدن لباس‌های جلب توجه کننده آغاز می‌کند. این رفتار وی تا آنجا پیش می‌رود که ...	4
طلا و مس                                                                        	1387	ایران	فارسی	سیدرضاطلبه‌ای که به تازگی با خانواده اش به تهران آمده، تا در کلاس‌های استاد اخلاقی که وصف او را بسیار شنیده است شرکت کند. اما متوجه بیماری اسکلروز چندگانه همسرش زهرا می‌شود و به ناچار برای تهیه هزینه درمان او تغییراتی در شیوه زندگیش می‌دهد.	11
فقط چشم‌هاتو ببند                                                               	1385	ایران	فارسی	در این فیلم مینا احمدوند، محمود محکمی، بیتا سحرخیز، هاله گرجی، سعید روحانی، امیرحسین رستمی، پانته آ اصلانی و میترا ضیایی کیا به بازیگری می پردازند .	12
گام های شیدایی                                                                  	1391	ایران	فارسی	جوليا به خدمت ارتش ايالات متحده درآمده و تلاش دارد مداركي كه در حين انجام وظيفه در اين كشور به دست آورده به دوست خبرنگار خود برساند	14
گشت ارشاد                                                                       	1390	ایران	فارسی	این فیلم ماجرای سه جوان جنوب شهری است که برای بدست آوردن پول و گذراندن زندگی دست به کارهای خلاف می‌زنند. آنها با گیر دادن به دختر و پسرهای جوان با نام گشت ارشاد پول آنها را می‌گیرند و از این راه زندگی خود را می‌گذرانند.	14
میم مثل مادر                                                                    	1385	ایران	فارسی	پزشکان دلیل وضعیت سعید فرزند سپیده را ناشی از استنشاق گازهای شیمیایی در زمان جنگ توسط سپیده می‌دانند. سهیل (پدر سعید) اصرار دارد تا فرزند را به یک آسایشگاه تحویل دهند اما سپیده مخالفت می‌کند و ...\n\nاین فیلم به عنوان نماینده ایران در اسکار ۲۰۰۷ از سوی بنیاد فارابی انتخاب شد.	13
نصف مال من، نصف مال تو                                                          	1385	ایران	فارسی	سپيده و پونه دو دختر نه ساله، هر دو در يك كلاس هستند و مشخصات پدرشان يكي است. اين مسأله كنجكاوي ناظم مدرسه و همچنين خود آنها را برمي انگيزد. پس از آنكه پي اين قضيه را مي گيرند، معلوم مي شود پدر آنها ـ بهرام ـ دو همسر دارد كه موضوع را از هر دو مخفي نگه داشته است. بهرام كه از اين وضعيت پنهان كاري خسته شده به توصيه برادرش بهروز تلاش مي كند واقعيت را به همسرانش مهري (مادر سپيده) و پروين (مادر پونه) بگويد. اما هر بار كه سعي مي كند، سپيده و پونه نقشه او را ناتمام مي گذارند، چون مي ترسند مادرانشان از ترس سكته كنند. مهري و پروين به صورت اتفاقي با هم آشنا مي شوند و در اثر صحنه سازي كه بچه ها خلق كرده اند، هر يك فكر مي كند فقط آن ديگري هوو دارد، تا اين كه با نقشه بهروز، بهرام به دروغ خودش را در بيمارستان بستري مي كند و مهري و پروين موقع عيادت در آنجا مي فهمند خودشان هووي يكديگرند. آنها از دادگاه تقاضاي طلاق مي كنند ولي به علت بارداري شان، دادگاه اين درخواست را رد مي كند. از سوي ديگر بهرام مورد تعقيب طلب كارهايي است كه با عاشق شدن يكي از آنها نسبت به بهي ـ خواهر بهرام ـ همه طلب ها از جانب او پرداخت مي شود. مهري و پروين به اتاق بهرام مي روند تا او را بزنند كه بهرام پايش از لب پنجره ليز مي خورد و روي اتومبيل عروس (بهي و صرافي) سقوط مي كند و با آنها به ماه عسل مي رود. سرانجام مهري و پروين با اين قضيه كنار مي آيند و بهرام هم به اشتباه و تقصيري كه در اين جريان متوجه او بوده اقرار مي كند.	18
نفوذی                                                                           	1387	ایران	فارسی	سال ۱۳۸۲، فریدون کیان فر همراه با عده‌ای دیگر از اسیران جنگی به جا مانده در عراق، به ایران باز گردانده می‌شوند. دو نفر از نیروهای اطلاعاتی و امنیتی او را به دلیل این که مشهور به جاسوسی، پیوستن به سازمان مجاهدین و نقش داشتن در شهادت عده‌ای از اسیران ایرانی بوده، بازداشت و بازجویی می‌کنند. از سوی دیگر، بدنامی فریدون برای خانواده اش هم از قدیم مشکل درست کرده و حتی ازدواج پسرش فرهاد را تحت الشعاع قرار داده بود. مأموران اطلاعاتی در صحبت با برخی از هم‌بندهای فریدون، از جمله صادق جورابچی که اکنون سرمایه دار است، و نیز داریوش یحیوی که قبلاً در عراق عضو سازمان مجاهدین بوده و بعد توبه کرده گذشته او را جویا می‌شوند. به موازات تیم دو نفره بازجوی فریدون، جانبازی کم بینا به نام ماشاءالله هم وارد حوزه کاری آنها می‌شود و...	16
نیوه مانگ                                                                       	1385	ایران	فارسی	«مامو»، نوازنده پیر و سرشناس کردستان، همراه فرزندانش سفری را برای اجرای کنسرت در عراق پس از صدام آغاز می‌کند. در این سفر، کاکو مرد میان سالی که خود را ارادت مند مامو می‌داند، به عنوان راننده و با اتوبوسی که از دوستش قرض گرفته‌است، او را همراهی می‌کند. مامو یکی یکی فرزندانش را که در نواحی مختلف زندگی می‌کنند جمع می‌کند، اما آخرین پسرش پیش از سوارشدن به اتوبوس از پدر می‌خواهد دقایقی از ماشین پیاده شود. پسر به مامو می‌گوید که «پیر» روستا گفته که بهتر است مامو به این سفر نرود زیرا هنگامی که ماه کامل شود برای او اتفاقی خواهد افتاد. مامو می‌گوید به هر طریق که باشد این سفر را ادامه خواهد داد زیرا سال‌هاست جلوی کارش گرفته شده‌است. مامو به سراغ زن خواننده‌ای به نام هشو (به معنای خوشهٔ انگور) می‌رود که سال‌هاست همراه ۱۳۳۴زن دیگر در تبعید زندگی می‌کند اما هشو صدای پیشینش را همراه با اعتماد به نفس از دست داده‌است. آن‌ها در مسیر عبور از مرز با حوادث و موانع متفاوتی روبه رو می‌شوند.	14
هیچ كجا هیچ كس                                                                  	1391	ایران	فارسی	هيچ کجا هيچ کس قصه ي رابطه هاي دچار سوء تفاهم و به تبع آن به انزوا رسيده است. در اين فيلم انسان ها تنهايي را به حضور ديگراني گره مي زنند که نه تنها التيامي بر زخم شان نيست که افزاينده ي رنج ناشي از رها شدگي ست.فيلم هيچ کجا هيچ کس روايتي خطي و ساده ندارد چرا که شخصيت هاي فيلم نيز قرار نيست با هم رو راست باشند اين فيلم پاره پاره مخاطبش را به عمق اتفاق ها مي کشد و مدام به بيننده اش متذکر مي شود که هرکدام از اين کاراکترها مي تواني تو باشي و يا همين الان هستي پس درست تصميم بگير.هيچ کجا هيچ کس همه جا براي همه کس ممکن است اتفاق بيفتد.	19
هیس! دخترها فریاد نمی زنند                                                      	1391	ایران	فارسی	بی‌توجهی و سهل‌انگاری پدر و مادر شیرین هشت‌ساله، واقعه‌ای را برای او رقم می‌زند که زخمش سال‌ها بر روح او باقی می‌ماند و همهٔ زندگی‌اش را تحت‌الشعاع خود قرار می‌دهد. آنچه این زخم را عمیق‌تر می‌کند و واقعه را به فاجعه ختم می‌سازد، این است که دخترک هیچ‌کس را نمی‌یابد تا دردش را با او در میان بگذارد.	20
ورود آقایان ممنوع                                                               	1390	ایران	فارسی	مدیر یک دبیرستان دخترانه خصوصی با ورود آقایان به مدرسه خود شدیداً مخالف است. اما وقتی دبیر شیمی به علت زایمان شش ماه مرخصی می‌گیرد، مجبور می‌شود تا یک دبیر جایگزین به دبیرستان بیاورد. ولی تلاش وی برای یافتن دبیر زن در میانه سال تحصیلی بی‌فایده است و وی مجبور است یک مرد را به عنوان تنها گزینه بپذیرد. اما ...	15
يه حبه قند                                                                      	1388	ایران	فارسی	قرار است پسند (پسندیده) دختر کوچک یک خانواده یزدی با پسری به نام کیوان از خانواده متمولی در همسایگی، که حالا مقیم آمریکاست، ازدواج غیابی کند و به آمریکا برود. چهار خواهر بزرگ‌تر خانواده (که برخی ساکن یزد و برخی مقیم شهرهای دیگرند) و همسر و فرزندان‌شان برای مراسم ازدواج به خانه پدری می‌آیند. در این میان دایی خانواده که مخالف این ازدواج است و دلش می‌خواسته پسند با قاسم برادرزاده همسرش که حالا در خدمت سربازی است ازدواج کند، به شکل‌های مختلف بدقلقی می‌کند اما در نهایت تسلیم شده است. مهمانان – بچه‌ها و بزرگ‌ترها – هر کدام دنیا و دغدغه‌ای دارند و در میان هیاهوی جمع، پسند هم گاه‌وبی‌گاه با سکوت‌هایش انگار نشان می‌دهد که چندان در تصمیمش راسخ نیست. صبح روز پس از ضیافت شام با حضور خانواده و بستگان داماد، دایی که هنگام خوردن صبحانه به شکلی بازیگوشانه قند را در دهانش می‌اندازد بر اثر گیر کردن قند در مسیر تنفسش خفه می‌شود و می‌میرد. مجلس عروسی به عزا تبدیل می‌شود. قاسم هم که ندانسته به مرخصی می‌آید و پیداست که او هم پسند را دوست دارد، با واقعیت تلخ مرگ تنها حامی‌اش دایی‌عزت و ازدواج قریب‌الوقوع پسند روبه‌رو می‌شود. به همین دلیل پس از تعمیر رادیوی کهنه دایی، بی‌خبر خانه را ترک می‌کند و می‌رود؛ به این بهانه که مرخصی‌اش تمام شده. پسند که با مرگ دایی و دیدار دوباره قاسم تردیدهایش بیش‌تر شده، سر سفره شام در پاسخ به خواهرش که در واقع سؤال جمع را مطرح می‌کند و می‌پرسد حالا با حادثه مرگ دایی و پیشنهاد عقد غیابی و بی‌سروصدا (برای رسیدن به قرار تعیین‌شده سفارت آمریکا در کشوری دیگر) چه باید کرد، می‌گوید پس از چهلم دایی جواب خانواده داماد را خواهد داد. برق رفته بود که قاسم رادیو را تعمیر کرد و دوشاخش را به پریز زد. نیمه‌شب که همه در خواب هستند برق وصل می‌شود. پسند برمی‌خیزد تا چراغ اتاق‌ها را خاموش کند که آوای ترانه‌ای را می‌شنود. ردش را می‌گیرد و به اتاق دایی می‌رسد که رادیویش ترانه «بگو کجایی» کورس سرهنگ‌زاده پخش می‌شود.	9
\.


--
-- Data for Name: picture_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY picture_table (file_path, movie_title, movie_release_year, min_age) FROM stdin;
https://upload.wikimedia.org/wikipedia/fa/thumb/9/9c/50_Ghadame_Akhar_Movie_Poster.jpg/280px-50_Ghad	۵۰ قدم آخر                                                                      	1392	18
http://www.aftabir.com/news/2012/feb/18/images/1f2d033d9bacf0054798a4999ba96e21.jpg                 	۵۷۸ روز انتظار                                                                  	1390	18
https://upload.wikimedia.org/wikipedia/fa/thumb/5/55/Exraji_ha1.png/200px-Exraji_ha1.png            	اخراجیها                                                                        	1385	18
https://upload.wikimedia.org/wikipedia/fa/thumb/f/f6/Azarshahdokhtparvizvadigaran-Poster.jpg/220px-A	آذر، شهدخت، پرويز و ديگران                                                      	1392	18
https://upload.wikimedia.org/wikipedia/fa/thumb/b/ba/Aaraayesh-e-Qaliz.jpg/220px-Aaraayesh-e-Qaliz.j	آرايش غليظ                                                                      	1392	18
https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Ersal-e_Agahiye_Tasliat_Baray-e_Rooznameh_	ارسال يك آگهي تسليت براي روزنامه                                                	1392	18
https://upload.wikimedia.org/wikipedia/fa/thumb/4/40/Asb_Heyvan_Najibi_Ast.jpeg/220px-Asb_Heyvan_Naj	اسب حیوان نجیبی است                                                             	1390	18
https://upload.wikimedia.org/wikipedia/fa/thumb/9/95/Asemaan-e-zard.jpg/220px-Asemaan-e-zard.jpg    	آسمان زرد كم عمق                                                                	1391	18
https://upload.wikimedia.org/wikipedia/fa/thumb/4/4d/Catch_Me_If_You_Can_2002_movie.jpg/220px-Catch_	اگه می تونی منو بگیر                                                            	1385	18
http://cdn.collider.com/wp-content/uploads/catch-me-if-you-can-leonardo-dicaprio.jpg                	اگه می تونی منو بگیر                                                            	1385	18
https://upload.wikimedia.org/wikipedia/fa/4/4f/Anarhay_naras_poster_film_1392.jpg                   	انارهاي نارس                                                                    	1392	19
https://upload.wikimedia.org/wikipedia/fa/thumb/1/1e/Entehaye_khiabane_hashtom.jpg/220px-Entehaye_kh	انتهاي خيابان هشتم                                                              	1390	18
https://upload.wikimedia.org/wikipedia/fa/thumb/d/da/The_Song_of_Sparrows.jpg/220px-The_Song_of_Spar	آواز گنجشك ها                                                                   	1386	18
https://upload.wikimedia.org/wikipedia/fa/thumb/8/81/%D8%A7%DB%8C%D9%86%D8%AC%D8%A7_%D8%A8%D8%AF%D9%	اينجا بدون من                                                                   	1389	19
https://upload.wikimedia.org/wikipedia/fa/thumb/4/40/Farewell-baghdad-poster.JPG/220px-Farewell-bagh	بدرود بغداد                                                                     	1388	18
https://upload.wikimedia.org/wikipedia/fa/thumb/c/cc/Bosidanroyemah.jpg/250px-Bosidanroyemah.jpg    	بوسيدن روي ماه                                                                  	1390	18
https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Bosidan_Roye_Mah_photos.jpg/116px-Bosidan_	بوسيدن روي ماه                                                                  	1390	19
http://www.cinema-theatre.com/site/domain%5Bcinema-theatre.com%5Dfiles/userupload/2014/10/07/Bidari-	بيداري براي سه روز                                                              	1392	18
https://upload.wikimedia.org/wikipedia/fa/thumb/1/10/Parseh_dar_meh.jpg/220px-Parseh_dar_meh.jpg    	پرسه در مه                                                                      	1388	19
https://upload.wikimedia.org/wikipedia/fa/thumb/b/be/Cinemanegar_Photo-_Telephone_Hamrahe_Raeis_Jomh	تلفن همراه رئيس جمهور                                                           	1390	20
https://upload.wikimedia.org/wikipedia/fa/thumb/1/18/Tehran_Has_No_More_Pomegranates.jpg/220px-Tehra	تهران انار ندارد                                                                	1388	19
https://upload.wikimedia.org/wikipedia/fa/thumb/0/00/A_Separation.jpg/220px-A_Separation.jpg        	جدایی نادر از سیمین                                                             	1390	18
https://upload.wikimedia.org/wikipedia/fa/thumb/0/0c/A_FEW_CUBE_METERS_LOVE_1.jpg/220px-A_FEW_CUBE_M	چند متر مكعب عشق                                                                	1392	18
https://upload.wikimedia.org/wikipedia/fa/thumb/1/14/Dayere_zangi_1.jpg/220px-Dayere_zangi_1.jpg    	دایره زنگی                                                                      	1386	17
https://upload.wikimedia.org/wikipedia/fa/thumb/8/87/Rosvaee-22958.jpg/220px-Rosvaee-22958.jpg      	رسوایی                                                                          	1391	18
https://upload.wikimedia.org/wikipedia/fa/thumb/f/f6/Zamani-Baryee-Dost.jpg/236px-Zamani-Baryee-Dost	زمانی برای دوست داشتن                                                           	1386	19
https://upload.wikimedia.org/wikipedia/fa/thumb/c/c1/La_Dolce_Vita_%281960_film%29_coverart.jpg/220p	زندگی شیرین                                                                     	1387	17
https://upload.wikimedia.org/wikipedia/fa/thumb/c/c3/Te-WedLock.jpg/220px-Te-WedLock.jpg            	زندگی مشترک آقای محمودی و بانو                                                  	1391	19
https://upload.wikimedia.org/wikipedia/fa/thumb/3/35/The_private_life_of_Mr._and_Mrs._M_Cover.jpg/22	زندگي خصوصي آقا و خانم ميم                                                      	1390	17
https://upload.wikimedia.org/wikipedia/fa/thumb/7/73/Santori.jpg/220px-Santori.jpg                  	سنتوری                                                                          	1385	18
https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Tala_va_Mes_photos.jpg/220px-Tala_va_Mes_p	طلا و مس                                                                        	1387	19
https://upload.wikimedia.org/wikipedia/fa/thumb/6/6c/%D9%BE%D9%88%D8%B3%D8%AA%D8%B1_%D9%81%DB%8C%D9%	كلاه قرمزي و بچه ننه                                                            	1390	16
https://upload.wikimedia.org/wikipedia/fa/thumb/2/2a/Gashte_Ershad.jpg/220px-Gashte_Ershad.jpg      	گشت ارشاد                                                                       	1390	17
https://upload.wikimedia.org/wikipedia/fa/thumb/4/43/Mim_Mesle_Madar.jpg/220px-Mim_Mesle_Madar.jpg  	میم مثل مادر                                                                    	1385	15
https://upload.wikimedia.org/wikipedia/fa/thumb/e/eb/Man_madar_hastam.jpg/220px-Man_madar_hastam.jpg	من مادر هستم                                                                    	1390	16
https://upload.wikimedia.org/wikipedia/fa/thumb/2/25/Nofuzi.jpg/220px-Nofuzi.jpg                    	نفوذی                                                                           	1387	18
https://upload.wikimedia.org/wikipedia/fa/thumb/5/51/Half_Moon_poster.jpg/220px-Half_Moon_poster.jpg	نیوه مانگ                                                                       	1385	17
https://upload.wikimedia.org/wikipedia/fa/thumb/3/3e/PosterHissNew2S.jpg/220px-PosterHissNew2S.jpg  	هیس! دخترها فریاد نمی زنند                                                      	1391	18
https://upload.wikimedia.org/wikipedia/fa/thumb/e/ec/Hamishe_poster.jpg/220px-Hamishe_poster.jpg    	همیشه پای یك زن در میان است                                                     	1386	17
https://upload.wikimedia.org/wikipedia/fa/9/9f/Vorod_Aghayan.gif                                    	ورود آقایان ممنوع                                                               	1390	18
\.


--
-- Data for Name: review_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY review_table (movie_title, movie_release_year, writer_fullname, last_change, context) FROM stdin;
\.


--
-- Data for Name: saloon_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY saloon_table (container_cinema_code, saloon_id, rows_num, columns_num) FROM stdin;
124324    	1	20	20
124324    	2	20	40
124324    	3	10	10
124324    	4	40	100
324645    	1	20	30
324645    	2	30	50
456457    	1	20	20
\.


--
-- Data for Name: show_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY show_table (saloon_container_cinema_code, saloon_id, movie_title, movie_release_year, show_date, stage, price) FROM stdin;
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12424
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	123
\.


--
-- Data for Name: tag_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tag_table (artist_name, picture_path, x, y, radius) FROM stdin;
\.


--
-- Data for Name: ticket_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ticket_table (saloon_container_cinema_code, saloon_id, movie_title, movie_release_year, show_date, stage, chair_row, chair_column, owner_email) FROM stdin;
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	20	moinfar@ce.sharif.edu                                                           
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	19	moinfar@ce.sharif.edu                                                           
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	25	moinfar@ce.sharif.edu                                                           
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	2	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	3	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	4	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	5	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	6	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	7	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	8	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	9	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	10	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	11	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	12	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	13	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	14	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	15	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	16	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	17	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	18	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	19	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	20	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	21	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	22	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	23	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	24	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	25	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	26	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	27	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	28	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	29	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	30	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	31	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	32	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	33	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	34	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	35	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	36	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	37	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	38	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	39	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	1	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	2	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	3	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	4	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	5	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	6	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	7	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	8	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	9	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	10	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	11	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	12	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	13	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	14	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	15	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	16	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	17	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	18	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	19	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	20	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	21	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	22	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	23	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	24	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	25	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	26	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	27	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	28	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	29	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	30	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	31	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	32	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	33	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	34	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	35	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	36	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	37	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	38	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	39	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	40	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	41	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	42	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	43	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	44	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	45	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	46	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	47	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	48	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	49	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	50	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	51	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	52	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	53	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	54	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	55	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	56	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	57	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	58	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	59	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	60	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	61	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	62	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	63	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	64	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	65	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	66	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	67	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	68	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	69	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	70	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	71	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	72	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	73	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	74	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	75	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	76	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	77	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	78	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	79	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	80	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	81	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	82	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	83	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	84	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	85	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	86	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	87	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	88	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	89	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	90	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	91	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	92	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	93	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	94	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	95	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	96	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	97	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	98	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	99	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	40	100	\N
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	17	moinfar@ce.sharif.edu                                                           
124324    	4	كلاه قرمزي و بچه ننه                                                            	1390	2014-01-01	2	1	18	moinfar@ce.sharif.edu                                                           
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	1	1	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	1	3	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	1	4	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	1	5	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	1	6	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	1	7	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	1	9	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	1	10	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	2	1	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	2	2	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	2	3	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	1	8	moinfar@ce.sharif.edu                                                           
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	2	4	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	2	5	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	2	6	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	2	7	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	2	8	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	2	9	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	2	10	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	3	1	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	3	2	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	3	3	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	3	4	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	3	5	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	3	6	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	3	7	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	3	8	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	3	9	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	3	10	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	4	1	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	4	2	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	4	4	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	4	5	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	4	6	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	4	7	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	4	8	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	4	9	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	4	10	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	5	1	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	5	2	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	5	3	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	5	4	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	5	5	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	5	6	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	5	7	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	5	8	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	5	9	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	5	10	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	6	1	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	6	2	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	6	3	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	6	4	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	6	5	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	6	6	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	6	7	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	6	8	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	6	9	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	6	10	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	7	1	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	7	2	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	7	3	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	7	4	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	7	5	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	7	6	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	7	7	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	7	8	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	7	9	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	7	10	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	8	1	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	8	2	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	8	3	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	8	4	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	8	5	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	8	6	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	8	7	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	8	8	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	8	9	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	8	10	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	9	1	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	9	2	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	9	3	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	9	4	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	9	5	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	9	6	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	9	7	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	9	8	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	9	9	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	9	10	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	10	1	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	10	3	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	10	4	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	10	5	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	10	6	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	10	7	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	10	8	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	10	9	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	10	10	\N
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	4	3	moinfar@ce.sharif.edu                                                           
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	1	2	moinfar@ce.sharif.edu                                                           
124324    	3	سنتوری                                                                          	1385	2015-02-02	2	10	2	moinfar@ce.sharif.edu                                                           
\.


--
-- Data for Name: user_list_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_list_table (user_email, list_title, description) FROM stdin;
farhadi.asghar@gmail.com                                                        	بهترین فیلمها	توضیحات هفت
farnush_khosi70@gmail.com                                                       	بهترین فیلمهای کمدی	توضیحات هشت
jafari@gmail.com                                                                	فیلمهایی که باید قبل از مرگ ببینید	توضیحات نه
jafari@gmail.com                                                                	واچ لیست	توضیحات ده
katebi@ce.sharif.edu                                                            	به یادماندنی ترین فیلمها	توضیحات یازده
katebi@ce.sharif.edu                                                            	بهترین فیلمهای ایرانی	توضیحات دوازده
mehran.akhavan.1994@gmail.com                                                   	فیلم های در حال پخش در تلوزیون	توضیحات سیزده
smmsadrnezh@gmail.com                                                           	۱۰ تا از بهترین اپیزودهای سریالها	توضیحات چهارده
abdi1999@chmail.com                                                             	فیلم های در حال اکران	توضیحات یک
afshar@yahoo.com                                                                	فیلمهای جشنواره ساندنس ۲۰۱۵	توضیحات دو
eftekhari.ali@gmail.com                                                         	۱۰ تا از بهترین اپیزودهای سریالها	توضیحات سه
eftekhari.ali@gmail.com                                                         	بهترین فیلمهای قدیمی	توضیحات چهار
farazan9920@yahoo.com                                                           	انتخاب‌های آی‌ام‌دی‌بی	توضیحات پنج
farhadi.asghar@gmail.com                                                        	آخرین فیلمهای اضافه شده به سایت	توضیحات شش
\.


--
-- Data for Name: user_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_table (email, fullname, password, birthday, sex, superuser) FROM stdin;
mehran.akhavan.1994@gmail.com                                                   	مهران اخوان	mehran94	1993-11-05	male  	f
bahaaaar@gmail.com                                                              	محمد تقی بهار	bahaaarpass	1940-01-01	male  	f
katebi@ce.sharif.edu                                                            	محسن کاتبی	katebi	1993-11-25	male  	f
smmsadrnezh@gmail.com                                                           	سید محمد مسعود صدرنژاد	smms	1994-02-15	male  	f
akbar111@gmail.com                                                              	اکبر هاشمی	akbar_pass	1930-02-05	male  	f
mmmdamin@gmail.com                                                              	محمدامین صباغیان	sabagh.72	1994-03-11	male  	f
jafari@gmail.com                                                                	مرضیه جعفری	jafarjafar	1985-12-24	female	f
elisha.am@gmail.com                                                             	 الیشا امیری	bbbaaa	1972-05-12	female	f
dehnamak@yahoo.com                                                              	مسعود ده نمکی	dehnamak123	1971-01-01	male  	f
farhadi.asghar@gmail.com                                                        	اصغر فرهادی	fafa1233	1974-02-02	male  	f
milani@hotmail.com                                                              	تهمینه میلانی	mi#q213	1970-12-05	female	f
farnush_khosi70@gmail.com                                                       	فرنوش خسروی	987aaa	1994-01-12	female	f
alireza.alireza@gmail.com                                                       	علیرضا صادقی	43211234	1995-01-03	male  	f
mohsen.katebi72@gmail.com                                                       	محسن کاتبی	mmm49	1993-11-25	male  	t
moinfar@ce.sharif.edu                                                           	امیرعلی معین‌فر	pass	1993-11-20	male  	t
eftekhari.ali@gmail.com                                                         	علیرضا افتخاری	123456	1970-08-22	male  	t
angelina.jolie@gmail.com                                                        	آنجلینا جولی	alh123df	1975-05-04	female	t
farazan9920@yahoo.com                                                           	یاسمن فرازان	faraz_#$%	1990-02-12	female	t
elcidar@yahoo.com                                                               	محمد کیوان‌مرز	mma12%	1980-02-29	male  	t
r.javan@gmail.com                                                               	رامبد جوان	2468	1978-05-12	male  	t
abdi1999@chmail.com                                                             	زهرا عبدی آباده	abcdAAA99	1999-01-05	female	t
afshar@yahoo.com                                                                	مهناز افشار	bbm$21	1977-01-24	female	t
\.


--
-- Name: address_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cinema_table
    ADD CONSTRAINT address_unique UNIQUE (address);


--
-- Name: artist_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY artist_table
    ADD CONSTRAINT artist_table_pkey PRIMARY KEY (fullname);


--
-- Name: award_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY award_table
    ADD CONSTRAINT award_table_pkey PRIMARY KEY (festival_title, festival_year, award_title);


--
-- Name: character_candid_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY character_candid_table
    ADD CONSTRAINT character_candid_table_pkey PRIMARY KEY (festival_title, festival_year, award_title, candidate_character_artist_name, candidate_character_profession, candidate_character_movie_title, candidate_character_movie_year);


--
-- Name: cinema_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cinema_table
    ADD CONSTRAINT cinema_table_pkey PRIMARY KEY (cinema_code);


--
-- Name: comment_comment_reply_to_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comment_comment_reply_to_table
    ADD CONSTRAINT comment_comment_reply_to_table_pkey PRIMARY KEY (replier_comment_id);


--
-- Name: comment_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comment_table
    ADD CONSTRAINT comment_table_pkey PRIMARY KEY (comment_auto_id);


--
-- Name: dialogue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dialogue_table
    ADD CONSTRAINT dialogue_pkey PRIMARY KEY (movie_title, movie_release_year, user_email, "character", second);


--
-- Name: entertainment_company_table_account_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entertainment_company_table
    ADD CONSTRAINT entertainment_company_table_account_number_key UNIQUE (account_number);


--
-- Name: entertainment_company_table_address_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entertainment_company_table
    ADD CONSTRAINT entertainment_company_table_address_key UNIQUE (address);


--
-- Name: entertainment_company_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entertainment_company_table
    ADD CONSTRAINT entertainment_company_table_pkey PRIMARY KEY (title);


--
-- Name: festival_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY festival_table
    ADD CONSTRAINT festival_table_pkey PRIMARY KEY (title, year);


--
-- Name: fund_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fund_table
    ADD CONSTRAINT fund_table_pkey PRIMARY KEY (movie_title, movie_release_year, investor_account_number);


--
-- Name: investor_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY investor_table
    ADD CONSTRAINT investor_table_pkey PRIMARY KEY (account_number);


--
-- Name: movie_art_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movie_artist_table
    ADD CONSTRAINT movie_art_table_pkey PRIMARY KEY (artist_name, movie_title, movie_release_year, profession);


--
-- Name: movie_candid_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movie_candid_table
    ADD CONSTRAINT movie_candid_table_pkey PRIMARY KEY (festival_title, festival_year, award_title, candidate_movie_title, candidate_movie_year);


--
-- Name: movie_genre_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movie_genre_table
    ADD CONSTRAINT movie_genre_table_pkey PRIMARY KEY (movie_title, movie_release_year, genre);


--
-- Name: movie_list_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movie_list_table
    ADD CONSTRAINT movie_list_table_pkey PRIMARY KEY (list_user_email, list_title, movie_title, movie_release_year);


--
-- Name: movie_rate_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movie_rate_table
    ADD CONSTRAINT movie_rate_table_pkey PRIMARY KEY (movie_title, movie_release_year, user_email);


--
-- Name: movie_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movie_table
    ADD CONSTRAINT movie_table_pkey PRIMARY KEY (title, release_year);


--
-- Name: picture_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY picture_table
    ADD CONSTRAINT picture_table_pkey PRIMARY KEY (file_path);


--
-- Name: review_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY review_table
    ADD CONSTRAINT review_table_pkey PRIMARY KEY (movie_title, movie_release_year, writer_fullname);


--
-- Name: saloon_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY saloon_table
    ADD CONSTRAINT saloon_table_pkey PRIMARY KEY (container_cinema_code, saloon_id);


--
-- Name: show_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY show_table
    ADD CONSTRAINT show_table_pkey PRIMARY KEY (saloon_container_cinema_code, saloon_id, show_date, stage);


--
-- Name: tag_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tag_table
    ADD CONSTRAINT tag_table_pkey PRIMARY KEY (artist_name, picture_path);


--
-- Name: ticket_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ticket_table
    ADD CONSTRAINT ticket_table_pkey PRIMARY KEY (saloon_container_cinema_code, saloon_id, show_date, stage, chair_row, chair_column);


--
-- Name: user_list_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_list_table
    ADD CONSTRAINT user_list_table_pkey PRIMARY KEY (user_email, list_title);


--
-- Name: user_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (email);


--
-- Name: artist_table_fullname_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX artist_table_fullname_idx ON artist_table USING btree (fullname);


--
-- Name: comment_comment_reply_to_table_replier_comment_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX comment_comment_reply_to_table_replier_comment_id_idx ON comment_comment_reply_to_table USING btree (replier_comment_id);


--
-- Name: comment_table_comment_auto_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX comment_table_comment_auto_id_idx ON comment_table USING btree (comment_auto_id);


--
-- Name: artist_table_account_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY artist_table
    ADD CONSTRAINT artist_table_account_number_fkey FOREIGN KEY (account_number) REFERENCES investor_table(account_number);


--
-- Name: artist_table_user_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY artist_table
    ADD CONSTRAINT artist_table_user_email_fkey FOREIGN KEY (user_email) REFERENCES user_table(email);


--
-- Name: award_table_awarded_character_artist_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY award_table
    ADD CONSTRAINT award_table_awarded_character_artist_name_fkey FOREIGN KEY (awarded_character_artist_name, awarded_character_profession, awarded_character_movie_title, awarded_character_movie_year) REFERENCES movie_artist_table(artist_name, profession, movie_title, movie_release_year);


--
-- Name: award_table_awarded_movie_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY award_table
    ADD CONSTRAINT award_table_awarded_movie_title_fkey FOREIGN KEY (awarded_movie_title, awarded_movie_year) REFERENCES movie_table(title, release_year);


--
-- Name: award_table_festival_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY award_table
    ADD CONSTRAINT award_table_festival_title_fkey FOREIGN KEY (festival_title, festival_year) REFERENCES festival_table(title, year);


--
-- Name: character_candid_table_candidate_character_artist_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_candid_table
    ADD CONSTRAINT character_candid_table_candidate_character_artist_name_fkey FOREIGN KEY (candidate_character_artist_name, candidate_character_profession, candidate_character_movie_title, candidate_character_movie_year) REFERENCES movie_artist_table(artist_name, profession, movie_title, movie_release_year);


--
-- Name: character_candid_table_festival_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_candid_table
    ADD CONSTRAINT character_candid_table_festival_title_fkey FOREIGN KEY (festival_title, festival_year, award_title) REFERENCES award_table(festival_title, festival_year, award_title);


--
-- Name: comment_comment_reply_to_table_replier_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_comment_reply_to_table
    ADD CONSTRAINT comment_comment_reply_to_table_replier_comment_id_fkey FOREIGN KEY (replier_comment_id) REFERENCES comment_table(comment_auto_id);


--
-- Name: comment_comment_reply_to_table_target_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_comment_reply_to_table
    ADD CONSTRAINT comment_comment_reply_to_table_target_comment_id_fkey FOREIGN KEY (target_comment_id) REFERENCES comment_table(comment_auto_id);


--
-- Name: comment_table_mtitle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_table
    ADD CONSTRAINT comment_table_mtitle_fkey FOREIGN KEY (movie_title, movie_release_year) REFERENCES movie_table(title, release_year);


--
-- Name: comment_table_user_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_table
    ADD CONSTRAINT comment_table_user_email_fkey FOREIGN KEY (user_email) REFERENCES user_table(email);


--
-- Name: dialogue_mtitle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dialogue_table
    ADD CONSTRAINT dialogue_mtitle_fkey FOREIGN KEY (movie_title, movie_release_year) REFERENCES movie_table(title, release_year);


--
-- Name: dialogue_user_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dialogue_table
    ADD CONSTRAINT dialogue_user_email_fkey FOREIGN KEY (user_email) REFERENCES user_table(email);


--
-- Name: entertainment_company_table_account_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entertainment_company_table
    ADD CONSTRAINT entertainment_company_table_account_number_fkey FOREIGN KEY (account_number) REFERENCES investor_table(account_number);


--
-- Name: festival_table_host_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY festival_table
    ADD CONSTRAINT festival_table_host_title_fkey FOREIGN KEY (host_title) REFERENCES entertainment_company_table(title);


--
-- Name: fund_table_investor_account_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fund_table
    ADD CONSTRAINT fund_table_investor_account_number_fkey FOREIGN KEY (investor_account_number) REFERENCES investor_table(account_number);


--
-- Name: fund_table_movie_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fund_table
    ADD CONSTRAINT fund_table_movie_title_fkey FOREIGN KEY (movie_title, movie_release_year) REFERENCES movie_table(title, release_year);


--
-- Name: movie_art_table_artist_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_artist_table
    ADD CONSTRAINT movie_art_table_artist_name_fkey FOREIGN KEY (artist_name) REFERENCES artist_table(fullname);


--
-- Name: movie_art_table_movie_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_artist_table
    ADD CONSTRAINT movie_art_table_movie_title_fkey FOREIGN KEY (movie_title, movie_release_year) REFERENCES movie_table(title, release_year);


--
-- Name: movie_candid_table_candidate_movie_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_candid_table
    ADD CONSTRAINT movie_candid_table_candidate_movie_title_fkey FOREIGN KEY (candidate_movie_title, candidate_movie_year) REFERENCES movie_table(title, release_year);


--
-- Name: movie_candid_table_festival_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_candid_table
    ADD CONSTRAINT movie_candid_table_festival_title_fkey FOREIGN KEY (festival_title, festival_year, award_title) REFERENCES award_table(festival_title, festival_year, award_title);


--
-- Name: movie_genre_table_movie_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_genre_table
    ADD CONSTRAINT movie_genre_table_movie_title_fkey FOREIGN KEY (movie_title, movie_release_year) REFERENCES movie_table(title, release_year);


--
-- Name: movie_list_table_list_user_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_list_table
    ADD CONSTRAINT movie_list_table_list_user_email_fkey FOREIGN KEY (list_user_email, list_title) REFERENCES user_list_table(user_email, list_title);


--
-- Name: movie_list_table_movie_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_list_table
    ADD CONSTRAINT movie_list_table_movie_title_fkey FOREIGN KEY (movie_title, movie_release_year) REFERENCES movie_table(title, release_year);


--
-- Name: movie_rate_table_movie_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_rate_table
    ADD CONSTRAINT movie_rate_table_movie_title_fkey FOREIGN KEY (movie_title, movie_release_year) REFERENCES movie_table(title, release_year);


--
-- Name: movie_rate_table_user_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_rate_table
    ADD CONSTRAINT movie_rate_table_user_email_fkey FOREIGN KEY (user_email) REFERENCES user_table(email);


--
-- Name: picture_table_movie_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY picture_table
    ADD CONSTRAINT picture_table_movie_title_fkey FOREIGN KEY (movie_title, movie_release_year) REFERENCES movie_table(title, release_year);


--
-- Name: review_table_movie_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY review_table
    ADD CONSTRAINT review_table_movie_title_fkey FOREIGN KEY (movie_title, movie_release_year) REFERENCES movie_table(title, release_year);


--
-- Name: review_table_writer_fullname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY review_table
    ADD CONSTRAINT review_table_writer_fullname_fkey FOREIGN KEY (writer_fullname) REFERENCES artist_table(fullname);


--
-- Name: saloon_table_container_cinema_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY saloon_table
    ADD CONSTRAINT saloon_table_container_cinema_code_fkey FOREIGN KEY (container_cinema_code) REFERENCES cinema_table(cinema_code);


--
-- Name: show_table_movie_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY show_table
    ADD CONSTRAINT show_table_movie_title_fkey FOREIGN KEY (movie_title, movie_release_year) REFERENCES movie_table(title, release_year);


--
-- Name: show_table_saloon_container_cinema_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY show_table
    ADD CONSTRAINT show_table_saloon_container_cinema_code_fkey FOREIGN KEY (saloon_container_cinema_code, saloon_id) REFERENCES saloon_table(container_cinema_code, saloon_id);


--
-- Name: tag_table_artist_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tag_table
    ADD CONSTRAINT tag_table_artist_name_fkey FOREIGN KEY (artist_name) REFERENCES artist_table(fullname);


--
-- Name: tag_table_picture_path_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tag_table
    ADD CONSTRAINT tag_table_picture_path_fkey FOREIGN KEY (picture_path) REFERENCES picture_table(file_path);


--
-- Name: ticket_table_owner_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ticket_table
    ADD CONSTRAINT ticket_table_owner_email_fkey FOREIGN KEY (owner_email) REFERENCES user_table(email);


--
-- Name: ticket_table_saloon_container_cinema_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ticket_table
    ADD CONSTRAINT ticket_table_saloon_container_cinema_code_fkey FOREIGN KEY (saloon_container_cinema_code, saloon_id, show_date, stage) REFERENCES show_table(saloon_container_cinema_code, saloon_id, show_date, stage);


--
-- Name: user_list_table_user_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_list_table
    ADD CONSTRAINT user_list_table_user_email_fkey FOREIGN KEY (user_email) REFERENCES user_table(email);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

