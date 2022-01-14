--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: cart_cartitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_cartitems (
    id bigint NOT NULL,
    anonymous_user character varying(50),
    quantity integer,
    sub_total integer,
    is_active boolean NOT NULL,
    buy_now boolean NOT NULL,
    products_id_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.cart_cartitems OWNER TO postgres;

--
-- Name: cart_cartitems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_cartitems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_cartitems_id_seq OWNER TO postgres;

--
-- Name: cart_cartitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_cartitems_id_seq OWNED BY public.cart_cartitems.id;


--
-- Name: cart_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_order (
    id bigint NOT NULL,
    order_id character varying(50) NOT NULL,
    payment_method character varying(50) NOT NULL,
    delivered_address character varying(200) NOT NULL,
    grand_total integer,
    delivery_status character varying(50) NOT NULL,
    payment_status character varying(50) NOT NULL,
    ordered_date date,
    user_id bigint NOT NULL
);


ALTER TABLE public.cart_order OWNER TO postgres;

--
-- Name: cart_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_order_id_seq OWNER TO postgres;

--
-- Name: cart_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_order_id_seq OWNED BY public.cart_order.id;


--
-- Name: cart_orderitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_orderitems (
    id bigint NOT NULL,
    anonymous_user character varying(50) NOT NULL,
    quantity integer,
    sub_total integer,
    is_active boolean NOT NULL,
    order_id bigint NOT NULL,
    products_id_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.cart_orderitems OWNER TO postgres;

--
-- Name: cart_orderitems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_orderitems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_orderitems_id_seq OWNER TO postgres;

--
-- Name: cart_orderitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_orderitems_id_seq OWNED BY public.cart_orderitems.id;


--
-- Name: cart_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_payment (
    id bigint NOT NULL,
    payment_id character varying(100) NOT NULL,
    payment_method character varying(50) NOT NULL,
    amount_paid integer,
    status character varying(100) NOT NULL,
    order_id bigint,
    user_id bigint NOT NULL
);


ALTER TABLE public.cart_payment OWNER TO postgres;

--
-- Name: cart_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_payment_id_seq OWNER TO postgres;

--
-- Name: cart_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_payment_id_seq OWNED BY public.cart_payment.id;


--
-- Name: cart_useraddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_useraddress (
    id bigint NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    address character varying(100) NOT NULL,
    city character varying(50) NOT NULL,
    post_code integer,
    country character varying(50) NOT NULL,
    state character varying(50) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.cart_useraddress OWNER TO postgres;

--
-- Name: cart_useraddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_useraddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_useraddress_id_seq OWNER TO postgres;

--
-- Name: cart_useraddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_useraddress_id_seq OWNED BY public.cart_useraddress.id;


--
-- Name: cart_wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_wishlist (
    id bigint NOT NULL,
    is_active boolean NOT NULL,
    products_id_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.cart_wishlist OWNER TO postgres;

--
-- Name: cart_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_wishlist_id_seq OWNER TO postgres;

--
-- Name: cart_wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_wishlist_id_seq OWNED BY public.cart_wishlist.id;


--
-- Name: categorymanagement_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorymanagement_category (
    id bigint NOT NULL,
    category_name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description text NOT NULL,
    offer_name character varying(200),
    offer_percent integer,
    expiry_date date,
    offer_status character varying(100)
);


ALTER TABLE public.categorymanagement_category OWNER TO postgres;

--
-- Name: categorymanagement_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorymanagement_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorymanagement_category_id_seq OWNER TO postgres;

--
-- Name: categorymanagement_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorymanagement_category_id_seq OWNED BY public.categorymanagement_category.id;


--
-- Name: categorymanagement_offer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorymanagement_offer (
    id bigint NOT NULL,
    offer_name character varying(100),
    offer_percent integer NOT NULL,
    expiry_date date NOT NULL,
    expiry_time time without time zone,
    offer_status character varying(100)
);


ALTER TABLE public.categorymanagement_offer OWNER TO postgres;

--
-- Name: categorymanagement_offer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorymanagement_offer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorymanagement_offer_id_seq OWNER TO postgres;

--
-- Name: categorymanagement_offer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorymanagement_offer_id_seq OWNED BY public.categorymanagement_offer.id;


--
-- Name: categorymanagement_subcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorymanagement_subcategory (
    id bigint NOT NULL,
    sub_category_name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description text NOT NULL,
    catergory_id_id bigint NOT NULL
);


ALTER TABLE public.categorymanagement_subcategory OWNER TO postgres;

--
-- Name: categorymanagement_subcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorymanagement_subcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorymanagement_subcategory_id_seq OWNER TO postgres;

--
-- Name: categorymanagement_subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorymanagement_subcategory_id_seq OWNED BY public.categorymanagement_subcategory.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: productmanagement_banner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productmanagement_banner (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    description text NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.productmanagement_banner OWNER TO postgres;

--
-- Name: productmanagement_banner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productmanagement_banner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productmanagement_banner_id_seq OWNER TO postgres;

--
-- Name: productmanagement_banner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productmanagement_banner_id_seq OWNED BY public.productmanagement_banner.id;


--
-- Name: productmanagement_coupon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productmanagement_coupon (
    id bigint NOT NULL,
    coupon_id character varying(50) NOT NULL,
    coupon_name character varying(50) NOT NULL,
    coupon_percent integer NOT NULL,
    expiry_date date,
    coupon_status boolean NOT NULL,
    expiry_time time without time zone
);


ALTER TABLE public.productmanagement_coupon OWNER TO postgres;

--
-- Name: productmanagement_coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productmanagement_coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productmanagement_coupon_id_seq OWNER TO postgres;

--
-- Name: productmanagement_coupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productmanagement_coupon_id_seq OWNED BY public.productmanagement_coupon.id;


--
-- Name: productmanagement_expiredcoupon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productmanagement_expiredcoupon (
    id bigint NOT NULL,
    coupon_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.productmanagement_expiredcoupon OWNER TO postgres;

--
-- Name: productmanagement_expiredcoupon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productmanagement_expiredcoupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productmanagement_expiredcoupon_id_seq OWNER TO postgres;

--
-- Name: productmanagement_expiredcoupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productmanagement_expiredcoupon_id_seq OWNED BY public.productmanagement_expiredcoupon.id;


--
-- Name: productmanagement_imagegallery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productmanagement_imagegallery (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    product_id_id bigint NOT NULL
);


ALTER TABLE public.productmanagement_imagegallery OWNER TO postgres;

--
-- Name: productmanagement_imagegallery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productmanagement_imagegallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productmanagement_imagegallery_id_seq OWNER TO postgres;

--
-- Name: productmanagement_imagegallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productmanagement_imagegallery_id_seq OWNED BY public.productmanagement_imagegallery.id;


--
-- Name: productmanagement_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productmanagement_products (
    id bigint NOT NULL,
    product_name character varying(200) NOT NULL,
    slug character varying(250) NOT NULL,
    description text NOT NULL,
    mrp double precision NOT NULL,
    sale_price integer NOT NULL,
    stocks integer NOT NULL,
    product_cover character varying(100) NOT NULL,
    is_available boolean NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    old_sale_price integer,
    offer_name character varying(200),
    offer_percent integer,
    expiry_date date,
    offer_status character varying(100),
    offer_applied character varying(200),
    category_id bigint,
    sub_category_id bigint NOT NULL
);


ALTER TABLE public.productmanagement_products OWNER TO postgres;

--
-- Name: productmanagement_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productmanagement_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productmanagement_products_id_seq OWNER TO postgres;

--
-- Name: productmanagement_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productmanagement_products_id_seq OWNED BY public.productmanagement_products.id;


--
-- Name: useraccount_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.useraccount_accounts (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    last_joined timestamp with time zone NOT NULL,
    is_admin boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superadmin boolean NOT NULL,
    wallet_amount integer,
    referral_code character varying(50)
);


ALTER TABLE public.useraccount_accounts OWNER TO postgres;

--
-- Name: useraccount_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.useraccount_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.useraccount_accounts_id_seq OWNER TO postgres;

--
-- Name: useraccount_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.useraccount_accounts_id_seq OWNED BY public.useraccount_accounts.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: cart_cartitems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_cartitems ALTER COLUMN id SET DEFAULT nextval('public.cart_cartitems_id_seq'::regclass);


--
-- Name: cart_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_order ALTER COLUMN id SET DEFAULT nextval('public.cart_order_id_seq'::regclass);


--
-- Name: cart_orderitems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_orderitems ALTER COLUMN id SET DEFAULT nextval('public.cart_orderitems_id_seq'::regclass);


--
-- Name: cart_payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_payment ALTER COLUMN id SET DEFAULT nextval('public.cart_payment_id_seq'::regclass);


--
-- Name: cart_useraddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_useraddress ALTER COLUMN id SET DEFAULT nextval('public.cart_useraddress_id_seq'::regclass);


--
-- Name: cart_wishlist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_wishlist ALTER COLUMN id SET DEFAULT nextval('public.cart_wishlist_id_seq'::regclass);


--
-- Name: categorymanagement_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorymanagement_category ALTER COLUMN id SET DEFAULT nextval('public.categorymanagement_category_id_seq'::regclass);


--
-- Name: categorymanagement_offer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorymanagement_offer ALTER COLUMN id SET DEFAULT nextval('public.categorymanagement_offer_id_seq'::regclass);


--
-- Name: categorymanagement_subcategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorymanagement_subcategory ALTER COLUMN id SET DEFAULT nextval('public.categorymanagement_subcategory_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: productmanagement_banner id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_banner ALTER COLUMN id SET DEFAULT nextval('public.productmanagement_banner_id_seq'::regclass);


--
-- Name: productmanagement_coupon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_coupon ALTER COLUMN id SET DEFAULT nextval('public.productmanagement_coupon_id_seq'::regclass);


--
-- Name: productmanagement_expiredcoupon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_expiredcoupon ALTER COLUMN id SET DEFAULT nextval('public.productmanagement_expiredcoupon_id_seq'::regclass);


--
-- Name: productmanagement_imagegallery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_imagegallery ALTER COLUMN id SET DEFAULT nextval('public.productmanagement_imagegallery_id_seq'::regclass);


--
-- Name: productmanagement_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_products ALTER COLUMN id SET DEFAULT nextval('public.productmanagement_products_id_seq'::regclass);


--
-- Name: useraccount_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.useraccount_accounts ALTER COLUMN id SET DEFAULT nextval('public.useraccount_accounts_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add content type	3	add_contenttype
10	Can change content type	3	change_contenttype
11	Can delete content type	3	delete_contenttype
12	Can view content type	3	view_contenttype
13	Can add session	4	add_session
14	Can change session	4	change_session
15	Can delete session	4	delete_session
16	Can view session	4	view_session
17	Can add accounts	5	add_accounts
18	Can change accounts	5	change_accounts
19	Can delete accounts	5	delete_accounts
20	Can view accounts	5	view_accounts
21	Can add category	6	add_category
22	Can change category	6	change_category
23	Can delete category	6	delete_category
24	Can view category	6	view_category
25	Can add offer	7	add_offer
26	Can change offer	7	change_offer
27	Can delete offer	7	delete_offer
28	Can view offer	7	view_offer
29	Can add sub category	8	add_subcategory
30	Can change sub category	8	change_subcategory
31	Can delete sub category	8	delete_subcategory
32	Can view sub category	8	view_subcategory
33	Can add coupon	9	add_coupon
34	Can change coupon	9	change_coupon
35	Can delete coupon	9	delete_coupon
36	Can view coupon	9	view_coupon
37	Can add products	10	add_products
38	Can change products	10	change_products
39	Can delete products	10	delete_products
40	Can view products	10	view_products
41	Can add image gallery	11	add_imagegallery
42	Can change image gallery	11	change_imagegallery
43	Can delete image gallery	11	delete_imagegallery
44	Can view image gallery	11	view_imagegallery
45	Can add expired coupon	12	add_expiredcoupon
46	Can change expired coupon	12	change_expiredcoupon
47	Can delete expired coupon	12	delete_expiredcoupon
48	Can view expired coupon	12	view_expiredcoupon
49	Can add banner	13	add_banner
50	Can change banner	13	change_banner
51	Can delete banner	13	delete_banner
52	Can view banner	13	view_banner
53	Can add order	14	add_order
54	Can change order	14	change_order
55	Can delete order	14	delete_order
56	Can view order	14	view_order
57	Can add wishlist	15	add_wishlist
58	Can change wishlist	15	change_wishlist
59	Can delete wishlist	15	delete_wishlist
60	Can view wishlist	15	view_wishlist
61	Can add user address	16	add_useraddress
62	Can change user address	16	change_useraddress
63	Can delete user address	16	delete_useraddress
64	Can view user address	16	view_useraddress
65	Can add payment	17	add_payment
66	Can change payment	17	change_payment
67	Can delete payment	17	delete_payment
68	Can view payment	17	view_payment
69	Can add order items	18	add_orderitems
70	Can change order items	18	change_orderitems
71	Can delete order items	18	delete_orderitems
72	Can view order items	18	view_orderitems
73	Can add cart items	19	add_cartitems
74	Can change cart items	19	change_cartitems
75	Can delete cart items	19	delete_cartitems
76	Can view cart items	19	view_cartitems
\.


--
-- Data for Name: cart_cartitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_cartitems (id, anonymous_user, quantity, sub_total, is_active, buy_now, products_id_id, user_id) FROM stdin;
126	g5sh1dl4dn2kiaxt3tcrckgupnfa0swd	1	44	t	f	3	\N
147	8oft1esowbkw2mq7h6thsidntgehebng	2	88	t	f	8	\N
150	yq9pwwqm2pc25f0a6ohmei07t6sa7abh	1	35	t	f	7	\N
97	046u615hvyolfj99tsaq1mcct3qv9gcw	1	44	t	f	3	\N
102	m4r1lgxy1ezdcpr2ek7foztt8ismws9a	1	44	t	f	3	\N
106	\N	1	44	t	f	3	\N
109	ukj3fbpp065hwyxaqwbj7ypd8rni8qtf	1	44	t	f	3	\N
110	ukj3fbpp065hwyxaqwbj7ypd8rni8qtf	1	80	t	f	6	\N
111	ukj3fbpp065hwyxaqwbj7ypd8rni8qtf	1	35	t	f	7	\N
\.


--
-- Data for Name: cart_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_order (id, order_id, payment_method, delivered_address, grand_total, delivery_status, payment_status, ordered_date, user_id) FROM stdin;
35	4a103a38-bf8e-4d33-b043-c2195da0fb7b	cash_on_delivery	trip, \nkolkata nagar india\nMaharashtra, 456323\nindia ,\n2334455533	70	ordered	pending	2022-01-05	5
36	6aa1ebab-c94e-4bb2-910b-0ebe776c2560	cash_on_delivery	ARJUN, \nkochi trinity flat \nkerala, 242424\nIndia ,\n7356502642	73	ordered	pending	2022-01-05	2
8	504d7fd2-d26c-4ab4-9cb0-315d22939c72	cash_on_delivery	ARJUN, \nkochi trinity flat \nkerala, 242424\nIndia ,\n7356502642	52	ordered	pending	2022-01-01	2
9	c400061f-6b44-48ed-9cbc-04ec82fa9045	razor_pay	ajas, \najas@gmail.com\nkarnataka, 777357\nindia ,\n9497745709	114	ordered	pending	2022-01-01	5
10	722ea862-6e44-4677-9cea-c4c1f5e7deb7	PayPal		44	ordered	COMPLETED	2022-01-01	2
11	57d3229f-2f78-4134-9487-c36efe1a61a6	razor_pay	afzal, \ntrinity kochi kakannad\ntamilnadu, 564454\nindia ,\n7736873733	1017	delivered	pending	2022-01-01	7
12	6c8be5f3-6fbd-4e67-ab32-51d93a546f85	cash_on_delivery	ajas, \najas@gmail.com\nkarnataka, 777357\nindia ,\n9497745709	60	ordered	pending	2022-01-03	5
37	239d3cac-1b54-4e3d-ba06-0175f26e1f17	wallet_pay	ARJUN, \nkochi trinity flat \nkerala, 242424\nIndia ,\n7356502642	34	cancelled	pending	2022-01-06	2
14	7dcdfc2c-f2f0-483d-9a64-a2f93da5ce17	cash_on_delivery	ARJUN, \nkochi trinity flat \nkerala, 242424\nIndia ,\n7356502642	35	ordered	pending	2022-01-04	2
15	b011e044-b4de-45b6-897f-c6045a7dfe6f	razor_pay	ajas, \najas@gmail.com\nkarnataka, 777357\nindia ,\n9497745709	44	ordered	pending	2022-01-04	5
13	92079eae-9c8c-4016-926b-048fbe1718bf	razor_pay	ajas, \najas@gmail.com\nkarnataka, 777357\nindia ,\n9497745709	70	delivered	pending	2022-01-04	5
16	a5b20662-f0d2-4c94-a1f9-027266991774	cash_on_delivery	ajas, \najas@gmail.com\nkarnataka, 777357\nindia ,\n9497745709	70	ordered	pending	2022-01-04	5
17	eb606508-849e-47b0-9d68-281b0e905186	cash_on_delivery	ajas, \najas@gmail.com\nkarnataka, 777357\nindia ,\n9497745709	44	ordered	pending	2022-01-04	5
18	30d45216-b9a2-4414-a74a-ee8447741b66	cash_on_delivery	ajas, \najas@gmail.com\nkarnataka, 777357\nindia ,\n9497745709	30	ordered	pending	2022-01-04	5
19	173e543a-c8cf-4bfc-b69d-8fc3f060c0a0	cash_on_delivery	ajas, \najas@gmail.com\nkarnataka, 777357\nindia ,\n9497745709	60	ordered	pending	2022-01-04	5
20	07637cba-ff0c-4d88-9f7c-d2dc905c6d88	cash_on_delivery	ajas, \najas@gmail.com\nkarnataka, 777357\nindia ,\n9497745709	60	ordered	pending	2022-01-04	5
21	da6491f4-7d17-41ad-a845-9224bb79821c	cash_on_delivery	ajas, \najas@gmail.com\nkarnataka, 777357\nindia ,\n9497745709	35	ordered	pending	2022-01-04	5
22	871409a3-b7f7-4b3c-878c-901795cf0015	cash_on_delivery	ajas, \najas@gmail.com\nkarnataka, 777357\nindia ,\n9497745709	35	cancelled	pending	2022-01-04	5
23	b7fb1d8d-6ecc-404a-8b43-b1fd6b166e61	razor_pay	ajas, \najas@gmail.com\nkarnataka, 777357\nindia ,\n9497745709	35	ordered	pending	2022-01-05	5
24	a8952d7b-221e-4d4e-8840-225c3b09fa8c	PayPal	ajas, \najas@gmail.com\nkarnataka, 777357\nindia ,\n9497745709	70	ordered	COMPLETED	2022-01-05	5
25	e31eae0f-78a5-43ab-aa83-6dc210733bae	cash_on_delivery	trip, \nkolkata nagar india\nMaharashtra, 456323\nindia ,\n2334455533	34	ordered	pending	2022-01-05	5
26	3013ced4-00fe-4248-bcf4-705f33cb4461	cash_on_delivery	trip, \nkolkata nagar india\nMaharashtra, 456323\nindia ,\n2334455533	65	ordered	pending	2022-01-05	5
27	432bd388-c439-401e-880c-ee3c3e28d3be	cash_on_delivery	trip, \nkolkata nagar india\nMaharashtra, 456323\nindia ,\n2334455533	65	ordered	pending	2022-01-05	5
28	10094ce5-be65-41b1-84df-7cee8c2a4473	cash_on_delivery	trip, \nkolkata nagar india\nMaharashtra, 456323\nindia ,\n2334455533	65	ordered	pending	2022-01-05	5
29	8e0a8946-455a-4142-a59d-7cd3cbeebb6d	cash_on_delivery	trip, \nkolkata nagar india\nMaharashtra, 456323\nindia ,\n2334455533	65	ordered	pending	2022-01-05	5
30	42c6a703-c3cf-4df8-8203-f6b154e3e824	cash_on_delivery	trip, \nkolkata nagar india\nMaharashtra, 456323\nindia ,\n2334455533	65	ordered	pending	2022-01-05	5
31	f6ece518-896c-413f-9b05-07edb567d964	cash_on_delivery	trip, \nkolkata nagar india\nMaharashtra, 456323\nindia ,\n2334455533	65	ordered	pending	2022-01-05	5
32	6480cd8f-f7c8-4630-8a6e-0d959653525b	cash_on_delivery	trip, \nkolkata nagar india\nMaharashtra, 456323\nindia ,\n2334455533	75	ordered	pending	2022-01-05	5
33	cf61f515-61a9-4002-8913-bcefe9d04cfd	cash_on_delivery	trip, \nkolkata nagar india\nMaharashtra, 456323\nindia ,\n2334455533	65	ordered	pending	2022-01-05	5
34	b972c260-8d37-48d9-9f2d-ff36385a1d56	cash_on_delivery	trip, \nkolkata nagar india\nMaharashtra, 456323\nindia ,\n2334455533	65	ordered	pending	2022-01-05	5
38	c826397d-da2f-4fc9-991d-8f5e27284e9b	cash_on_delivery	vishnu, \nvarkala cliff road\nkerala, 474747\nindia ,\n9061657828	45	ordered	pending	2022-01-07	6
39	0d471a9e-e7a7-4a84-8e6c-8c2abad46739	razor_pay	vishnu, \nvarkala cliff road\nkerala, 474747\nindia ,\n9061657828	35	ordered	pending	2022-01-07	6
40	55eb7eae-ea91-4225-b2ed-66a654659142	PayPal	vishnu, \nvarkala cliff road\nkerala, 474747\nindia ,\n9061657828	60	ordered	COMPLETED	2022-01-07	6
41	7a3751cc-150e-4f6b-8709-bba9b37bf23f	PayPal	vishnu, \nvarkala cliff road\nkerala, 474747\nindia ,\n9061657828	28	ordered	COMPLETED	2022-01-07	6
42	19144573-73dc-4b6d-b9bb-c309c8888058	cash_on_delivery	vishnu, \nvarkala cliff road\nkerala, 474747\nindia ,\n9061657828	178	ordered	pending	2022-01-07	6
43	9acae4de-9aed-4cda-9aee-6c5b46b1c085	cash_on_delivery	vishnu, \nvarkala cliff road\nkerala, 474747\nindia ,\n9061657828	50	ordered	pending	2022-01-07	6
44	8543dfb9-617a-47c1-bc6b-473ea8f242de	razor_pay	trip, \nkolkata nagar india\nMaharashtra, 456323\nindia ,\n2334455533	170	ordered	pending	2022-01-08	5
45	a1f3ff97-9d1a-4fb8-8063-294602b3de86	razor_pay	trip, \nkolkata nagar india\nMaharashtra, 456323\nindia ,\n2334455533	180	ordered	pending	2022-01-11	5
\.


--
-- Data for Name: cart_orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_orderitems (id, anonymous_user, quantity, sub_total, is_active, order_id, products_id_id, user_id) FROM stdin;
7		2	88	t	8	3	2
8		3	114	t	9	4	5
10		2	150	t	10	2	2
11		1	38	t	11	4	7
12		1	35	t	11	7	7
13		1	44	t	11	3	7
14		12	900	t	11	2	7
15		1	60	t	12	5	5
16		2	70	t	13	7	5
17		2	76	t	14	4	2
18		1	35	t	14	7	2
19		1	44	t	15	3	5
20		2	88	t	16	3	5
21		1	44	t	17	3	5
22		1	38	t	18	4	5
23		1	75	t	19	2	5
24		1	75	t	20	2	5
25		1	44	t	21	3	5
26		1	44	t	22	3	5
27		1	44	t	23	8	5
28		2	70	t	24	7	5
29		1	44	t	25	3	5
30		1	75	t	26	2	5
31		1	75	t	27	2	5
32		1	75	t	29	2	5
33		1	75	t	30	2	5
34		1	75	t	31	2	5
35		1	75	t	32	2	5
36		1	75	t	33	2	5
37		1	75	t	34	2	5
38		1	80	t	35	6	5
39		1	35	t	36	7	2
40		1	38	t	36	4	2
41		1	44	t	37	3	2
42		1	55	t	38	11	6
43		1	35	t	39	7	6
44		1	60	t	40	5	6
45		1	38	t	41	4	6
46		2	178	t	42	10	6
47		1	60	t	43	5	6
48		2	180	t	44	13	5
49		2	180	t	45	13	5
\.


--
-- Data for Name: cart_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_payment (id, payment_id, payment_method, amount_paid, status, order_id, user_id) FROM stdin;
8	0	cash_on_delivery	52	ordered	8	2
9	order_IeSOwAlBCwV83o	razor_pay	114	ordered	9	5
11	order_IeVJx2N1JTmkD6	razor_pay	1017	ordered	11	7
12	0	cash_on_delivery	60	ordered	12	5
13	order_IfEJMYo5n3Fosx	razor_pay	70	ordered	13	5
14	0	cash_on_delivery	35	ordered	14	2
15	order_IfaADMRP5G7PBO	razor_pay	44	ordered	15	5
16	0	cash_on_delivery	70	ordered	16	5
17	0	cash_on_delivery	44	ordered	17	5
18	0	cash_on_delivery	30	ordered	18	5
19	0	cash_on_delivery	60	ordered	19	5
20	0	cash_on_delivery	60	ordered	20	5
21	0	cash_on_delivery	35	ordered	21	5
22	0	cash_on_delivery	35	ordered	22	5
23	order_IfuxG1oNQXidO8	razor_pay	35	ordered	23	5
24	6NB3709141324803A	PayPal	70	COMPLETED	24	5
25	0	cash_on_delivery	34	ordered	25	5
26	0	cash_on_delivery	65	ordered	26	5
27	0	cash_on_delivery	65	ordered	27	5
28	0	cash_on_delivery	65	ordered	28	5
29	0	cash_on_delivery	65	ordered	29	5
30	0	cash_on_delivery	65	ordered	30	5
31	0	cash_on_delivery	65	ordered	31	5
32	0	cash_on_delivery	75	ordered	32	5
33	0	cash_on_delivery	65	ordered	33	5
34	0	cash_on_delivery	65	ordered	34	5
35	0	cash_on_delivery	70	ordered	35	5
36	0	cash_on_delivery	73	ordered	36	2
37	0	wallet_pay	34	ordered	37	2
38	0	cash_on_delivery	45	ordered	38	6
39	order_IgiTbPISH2TANB	razor_pay	35	ordered	39	6
40	4GY68004LE018094V	PayPal	60	COMPLETED	40	6
41	74766705UV324954J	PayPal	28	COMPLETED	41	6
42	0	cash_on_delivery	178	ordered	42	6
43	0	cash_on_delivery	50	ordered	43	6
44	order_Ih9VQQJlhcqu41	razor_pay	170	ordered	44	5
45	order_IiSTNofYjaotIK	razor_pay	180	ordered	45	5
\.


--
-- Data for Name: cart_useraddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_useraddress (id, first_name, last_name, email, phone_number, address, city, post_code, country, state, user_id) FROM stdin;
3	ARJUN	KURUP	arjunkurup@gmail.com	7356502642	kochi trinity flat 	KOCHI	242424	India	kerala	2
4	ajas	sps	ajas@gmail.com	9497745709	ajas@gmail.com	bombay  street 	777357	india	karnataka	5
5	afzal	sps	afzal@gmail.com	7736873733	trinity kochi kakannad	sfldajlkj	564454	india	tamilnadu	7
6	trip	sps	trip@gmail.com	2334455533	kolkata nagar india	kolkata	456323	india	Maharashtra	5
7	vishnu	sps	vishnu@gmail.com	9061657828	varkala cliff road	kerala	474747	india	kerala	6
\.


--
-- Data for Name: cart_wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_wishlist (id, is_active, products_id_id, user_id) FROM stdin;
\.


--
-- Data for Name: categorymanagement_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorymanagement_category (id, category_name, slug, description, offer_name, offer_percent, expiry_date, offer_status) FROM stdin;
2	vegetables	vegetables	vegetables are parts of plants that are consumed by humans or other animals as food. the original meaning is still commonly used and is applied to plants collectively to refer to all edible plant matter, including the flowers, fruits, stems, leaves, roots, and seeds. an alternate definition of the term is applied somewhat arbitrarily, often by culinary and cultural tradition. it may exclude foods derived from some plants that are fruits, flowers, nuts, and cereal grains, but include savoury fruits such as tomatoes and courgettes, flowers such as broccoli, and seeds such as pulses.	\N	\N	\N	False
1	fruits	fruits	fruits are the means by which flowering plants disseminate their seeds. edible fruits in particular have long propagated using the movements of humans and animals in a symbiotic relationship that is the means for seed dispersal for the one group and nutrition for the other; in fact, humans and many animals have become dependent on fruits as a source of food. consequently, fruits account for a substantial fraction of the world's agricultural output, and some have acquired extensive cultural and symbolic meanings.	\N	\N	\N	False
\.


--
-- Data for Name: categorymanagement_offer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorymanagement_offer (id, offer_name, offer_percent, expiry_date, expiry_time, offer_status) FROM stdin;
\.


--
-- Data for Name: categorymanagement_subcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorymanagement_subcategory (id, sub_category_name, slug, description, catergory_id_id) FROM stdin;
1	organic fruits	organic-fruits	fresh organic fruits	1
2	organic vegetables	organic-vegetables	fresh organic vegetables 	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	useraccount	accounts
6	categorymanagement	category
7	categorymanagement	offer
8	categorymanagement	subcategory
9	productmanagement	coupon
10	productmanagement	products
11	productmanagement	imagegallery
12	productmanagement	expiredcoupon
13	productmanagement	banner
14	cart	order
15	cart	wishlist
16	cart	useraddress
17	cart	payment
18	cart	orderitems
19	cart	cartitems
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-12-27 00:36:11.849474+05:30
2	contenttypes	0002_remove_content_type_name	2021-12-27 00:36:11.878342+05:30
3	auth	0001_initial	2021-12-27 00:36:11.976052+05:30
4	auth	0002_alter_permission_name_max_length	2021-12-27 00:36:11.988046+05:30
5	auth	0003_alter_user_email_max_length	2021-12-27 00:36:11.997959+05:30
6	auth	0004_alter_user_username_opts	2021-12-27 00:36:12.007423+05:30
7	auth	0005_alter_user_last_login_null	2021-12-27 00:36:12.016427+05:30
8	auth	0006_require_contenttypes_0002	2021-12-27 00:36:12.019566+05:30
9	auth	0007_alter_validators_add_error_messages	2021-12-27 00:36:12.028338+05:30
10	auth	0008_alter_user_username_max_length	2021-12-27 00:36:12.03979+05:30
11	auth	0009_alter_user_last_name_max_length	2021-12-27 00:36:12.049544+05:30
12	auth	0010_alter_group_name_max_length	2021-12-27 00:36:12.066388+05:30
13	auth	0011_update_proxy_permissions	2021-12-27 00:36:12.076867+05:30
14	auth	0012_alter_user_first_name_max_length	2021-12-27 00:36:12.087544+05:30
15	useraccount	0001_initial	2021-12-27 00:36:12.116534+05:30
16	categorymanagement	0001_initial	2021-12-27 00:36:12.198844+05:30
17	productmanagement	0001_initial	2021-12-27 00:36:12.37579+05:30
18	cart	0001_initial	2021-12-27 00:36:12.552994+05:30
19	sessions	0001_initial	2021-12-27 00:36:12.572638+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
tpug9r8gjxyqht8700oi6yvvstxxutdm	.eJxVjDsOwyAQRO-ydYQwHyO7TJ8zoF1YgvPBEoYqyt0TS27cjea9mQ9gfC8F5lY7X8Bjb9n3jatfIsyg4NQRhieXHcQHlvsqwlpaXUjsijjoJm5r5Nf1cE8HGbe8r7WykzUOdaJxQhekdC45hSaxJRqC0oGmhIM0bK2UTMH8oxq1MSlKhu8P-dc8Xw:1n4K60:VSr5e59lwqz-owIQ394P4caG34uo90vSPFhmmzHL21Y	2022-01-17 15:27:40.279243+05:30
q5gqt2l4o9p29jy0c1q2wsmfofge1zqh	.eJxVjDsOgzAQBe-ydWTZGP8o03MGtPYunwTZEoYqyt0TJBramXnvA0flbS3TkqHbt4MfMOCxz8OJh4WgAws3FjG9OZ-CXpinIlLJ-7ZEcSbislX0hXh9Xu3tYMY6_9fKNl4rGShyQ0yNHzl5Z7zUsjVuRBODUs7ZEFppotKJTNCWHSGSTlLD9wc0hT2O:1n5kIs:AmK7QzGiMuA3rvd9pJPDavoGafBMKp1ZF0k7oXwbdp4	2022-01-21 13:38:50.004468+05:30
n2jv5sfqqfjlnojzlp5paiek7sbuo6s4	e30:1n1kxz:Ij7bSNa-a01lko4bFLhnaLY6J0J3WUN1z-M8IIuHzpc	2022-01-10 13:32:47.466671+05:30
rxuk8puqzzneiysw1gorj9kvgtgf96sm	e30:1n1ky2:7nDQhmU-Si-SPyPIy1WWpuJvrTAstJstQkd9undMyrE	2022-01-10 13:32:50.982306+05:30
yj8ze2ovgjkyjc9lt0zqzd48i92530tk	e30:1n1ky7:eguVJRf_-4JeAxcz4pLBesgvn-gc1fCbrcmuF5uunwo	2022-01-10 13:32:55.641693+05:30
rubnls8iqo267k5idtis9edra3uxfgpz	e30:1n1kyC:jjAfD9VAEC9XKhdJgSZTA2LsyiZ_UQ_MpRxuSz_72JY	2022-01-10 13:33:00.471081+05:30
fnon9j9i4jgt1zer58xr7b6exiknlqdc	e30:1n3cA6:wBtom8HBWB-CwkMih5n8TC0-rWBEzwqWXriyJ7L24m0	2022-01-15 16:32:58.733633+05:30
5i09vllje98fpp5rmylfzgsn15hiuw6b	e30:1n3cAP:z27VCQWurSKSuqBMInPNTUKbMYVFP6s7XS8G3Ur-u_Y	2022-01-15 16:33:17.907049+05:30
tnb4lbkn8cjlgnbf23y55ved8ewfsbmp	e30:1n3cE8:iRReBsyI6SS0hKbyP-EEKG5f2MIDQP3SvDCD6zYFIfA	2022-01-15 16:37:08.087107+05:30
ajmdr10cjxo8w5tw4rg8nuhr9ygfzg7q	e30:1n3cEC:XwBqnufkFZ0bQvKGypImLb5qM_kknHpchvM0bQ2EKGw	2022-01-15 16:37:12.040279+05:30
5rh997bec7h77qs22ihvwidjsdx7xk7a	.eJxVjDEOgzAMRe_iuYpIMIEydu8ZkOPYQIsSicBU9e4tEgvre-__D-xF1iWPc4J-W3e5wUD7Ng0HHuYIPTRwYYH4LekQ8UVpzIZz2tY5mCMxpy3mmaMsj7O9HExUpv_aW1apHLZNcGqRPGvQGG3dIaITb_HeVLUyshDFyC0rWS_aqbMaOoLvD2VBP1s:1n65OV:fasut1NESn8ym-2pl5oxtXLh5VTWqy91Ew6xiOBnOPQ	2022-01-22 12:10:03.738086+05:30
nclli00eigyp6iewm2uaq4pgx6mkjg5e	.eJxVjDEOgzAMRe_iuYpIMIEydu8ZkOPYQIsSicBU9e4tEgvre-__D-xF1iWPc4J-W3e5wUD7Ng0HHuYIPTRwYYH4LekQ8UVpzIZz2tY5mCMxpy3mmaMsj7O9HExUpv_aW1apHLZNcGqRPGvQGG3dIaITb_HeVLUyshDFyC0rWS_aqbMaOoLvD2VBP1s:1n7HYg:2qc_g9pBFd4OjmviyRvV1Fk1G-ZhE7K2Ijh72XT9rfY	2022-01-25 19:21:30.112106+05:30
viof37a6i8eqp3vw497yxxtx3woixrqz	e30:1n51A6:D3IW46bIoiqMnAHwrUhycBoWPNWsMzYchn5ti5WAcg4	2022-01-19 13:26:46.150959+05:30
ofoit45oez1hckeog84ursfo62xuwfze	e30:1n51AA:ogE2F7yvIaZ6VEYySVBDJJYibclksctVKq3oblHt02s	2022-01-19 13:26:50.674806+05:30
wdq504pzj03dftesdrndgszuulb6cizg	e30:1n51AB:Z2FVvaIliwAKn-EKDgH0o60fHZHEjZQ-08FZp_FD1l4	2022-01-19 13:26:51.507752+05:30
m7spuppuy56nbqu14t6x8k7da8utaab6	e30:1n51AI:LSeHq1jiAclWmyf779wyGbQt3Rvdn1ODy2KvdvLj3bM	2022-01-19 13:26:58.960267+05:30
5x3n3ikmb3e9b5iobcdhmp0f4tcrps4w	e30:1n51CU:ZBwXJLX8DU-atrvZo9-vaaJrDCvSdlM3IAszpV6nfcQ	2022-01-19 13:29:14.573991+05:30
20mcwkkx2rghtufp6jlu7kfg99v8295q	e30:1n51CW:OBgMKJhLYybwR3YS4E91R_bNZbOMxSk7rcAbC2eI3So	2022-01-19 13:29:16.173437+05:30
68ydijr2l3n5ozltyqvfvso8iswp12il	e30:1n51Ca:tsWTLb1FoWwsL_A5CfzCaltodxyVLA7J-DrCzT2SZ6g	2022-01-19 13:29:20.421355+05:30
2b1y4mgjzomfn8bf3ohq0ki5wcvygxau	e30:1n51Ch:KFVn-h0eEqrpNXnJYy-mBRgzamJzEcsJjr3QGShke3w	2022-01-19 13:29:27.576758+05:30
j7j9lbth8i7w2esdx2uvfpm893kgc42h	e30:1n51KF:_fFP46BK_-gsyeNV9DTodsVzpMunUrBuYb5lAvxqmnw	2022-01-19 13:37:15.917552+05:30
cyktw4g37yho4w9xvppdhizlw00banle	e30:1n51KU:h6pmjrYVKEdwrAep3VDa-8DhHSSGUwPgrVVOXTyCQpk	2022-01-19 13:37:30.765388+05:30
hx9hni9ggusxqy0inzb4mdwt6qqg16fd	e30:1n51Kk:_zNd33_pDViN8wXDNy2Jq8yiZTOQLrGCKCluvbwkl0g	2022-01-19 13:37:46.558722+05:30
\.


--
-- Data for Name: productmanagement_banner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productmanagement_banner (id, image, description, product_id) FROM stdin;
2	photos/banners/pexels-nghĩa-phạm-1206597_1.jpg	Fresh organic Pineapples are stocks are now available	3
7	photos/banners/pexels-dimitri-dim-4726008.jpg	Fresh organic Kiwi available in stock . HURRY UP! purchase it and make the day healthy before stock ends.	10
8	photos/banners/pexels-karolina-grabowska-4033112.jpg	Fresh organic TOMATO are now available in stock. HURRY UP ! purchase before stocks end.	6
\.


--
-- Data for Name: productmanagement_coupon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productmanagement_coupon (id, coupon_id, coupon_name, coupon_percent, expiry_date, coupon_status, expiry_time) FROM stdin;
\.


--
-- Data for Name: productmanagement_expiredcoupon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productmanagement_expiredcoupon (id, coupon_id, user_id) FROM stdin;
\.


--
-- Data for Name: productmanagement_imagegallery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productmanagement_imagegallery (id, image, product_id_id) FROM stdin;
5	photos/products/RED_APPLE1_R98qsaT.png	2
6	photos/products/RED_APPLE2.png	2
7	photos/products/RED_APPLE3.png	2
8	photos/products/RED_APPLE4.png	2
9	photos/products/PINEPAPPLE1_MrhiJBT.png	3
10	photos/products/PINEPAPPLE2.png	3
11	photos/products/PINEPAPPLE3.png	3
12	photos/products/PINEPAPPLE4.png	3
13	photos/products/WATER_MELON1_t76EWDk.png	4
14	photos/products/WATER_MELON2_46jDf9V.png	4
15	photos/products/WATER_MELON3_qMg7zrF.png	4
16	photos/products/WATER_MELON4_ewOS5Bk.png	4
17	photos/products/POMEGRANATE1_NpqQFDP.png	5
18	photos/products/POMEGRANATE2.png	5
19	photos/products/POMEGRANATE3.png	5
20	photos/products/POMEGRANATE4.png	5
21	photos/products/Tomato1_RUmmsIa.png	6
22	photos/products/Tomato2.png	6
23	photos/products/Tomato3.png	6
24	photos/products/Tomato4.png	6
25	photos/products/Carrots1_hHGC8zj.png	7
26	photos/products/Carrots2.png	7
27	photos/products/Carrots3.png	7
28	photos/products/Carrots4.png	7
29	photos/products/Onions1_TolsvyY.png	8
30	photos/products/Onions2.png	8
31	photos/products/Onions3.png	8
32	photos/products/Onions4.png	8
33	photos/products/Cabbage1_sC5jRtp.png	9
34	photos/products/Cabbage2.png	9
35	photos/products/Cabbage3.png	9
36	photos/products/Cabbage4.png	9
37	photos/products/Kiwi1_4brdACJ.png	10
38	photos/products/Kiwi2.png	10
39	photos/products/Kiwi3.png	10
40	photos/products/Kiwi4.png	10
41	photos/products/Blueberries1_ppZPu25.png	11
42	photos/products/Blueberries2.png	11
43	photos/products/Blueberries3.png	11
44	photos/products/Blueberries4.png	11
45	photos/products/Coconuts1_LK4ezio.png	12
46	photos/products/Coconuts2.png	12
47	photos/products/Coconuts3.png	12
48	photos/products/Coconuts4.png	12
49	photos/products/Citrus1_kCTJ5K2.png	13
50	photos/products/Citrus2.png	13
51	photos/products/Citrus3.png	13
52	photos/products/Citrus4.png	13
53	photos/products/Beet_Root1_ezUXPYw.png	14
54	photos/products/Beet_Root2.png	14
55	photos/products/Beet_Root3.png	14
56	photos/products/Beet_Root4.png	14
57	photos/products/Pumpkin1_KCF8Ndw.png	15
58	photos/products/Pumpkin2.png	15
59	photos/products/Pumpkin3.png	15
60	photos/products/Pumpkin4.png	15
\.


--
-- Data for Name: productmanagement_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productmanagement_products (id, product_name, slug, description, mrp, sale_price, stocks, product_cover, is_available, created_date, modified_date, old_sale_price, offer_name, offer_percent, expiry_date, offer_status, offer_applied, category_id, sub_category_id) FROM stdin;
3	PINEPAPPLE	PINEPAPPLE	The refreshing & tangy flavour of Pineapples is cherished by all! Moreover, these fruits are low in calories & are packed with essential nutrients, which makes them even better! Get healthier by eating fresh & delicious Pineapples, it simply doesn't get better than this! \r\n\r\n To ensure that you get the best experience, we deliver the pineapple in a semi-ripe condition. We advise you to store the pineapple at room temperature for at least 1-3 days before consumption.	34	44	24	photos/products/PINEPAPPLE1.png	t	2021-12-30 16:53:35.047168+05:30	2021-12-30 16:53:35.047168+05:30	\N	\N	\N	\N	False	\N	1	1
4	WATER MELON	WATER-MELON	Watermelon fruit is 91% water, contains 6% sugars, and is low in fat .\r\n\r\nIn a 100-gram (3+1⁄2-ounce) serving, watermelon fruit supplies 125 kilojoules (30 kilocalories) of food energy and low amounts of essential nutrients . Only vitamin C is present in appreciable content at 10% of the Daily Value . Watermelon pulp contains carotenoids, including lycopene. It is good as an energy drink for preventing dehydration	30	38	24	photos/products/WATER_MELON1_dvC0GFF.png	t	2021-12-30 17:21:07.692379+05:30	2021-12-30 17:21:07.692379+05:30	\N	\N	\N	\N	False	\N	1	1
6	Tomato	Tomato	"                                          The versatile tomato is everybody's favorite!   \r\nGet healthy skin & get rid of bad cholesterol with this fresh vegetable from our online vegetable store.                      \r\n\r\nYou can order fresh tomatoes from our vegetable store & we will deliver them to your doorstep through our online vegetable delivery service. \r\n\r\nIdeally, tomatoes should be kept at room temperature. Keep them refrigerated by storing them away from other produce & in a dry cloth or perforated plastic bag. Use within one week of storage. \r\n\r\nPerfectly ripe tomatoes should be kept on the counter away from sunlight. Make sure they're layered & are not touching one another, and stem side up.                                                                                                                                 "	60	80	24	photos/products/Tomato1.png	t	2021-12-31 12:09:50.684155+05:30	2021-12-31 12:09:50.684155+05:30	\N	\N	\N	\N	False	\N	2	2
7	Carrots	Carrots	"  Highly nutritious & crunchy, our fresh Carrots are a must-have in your healthy diet! Purchase vegetables online through our vegetable store & you can get fresh Carrots delivered conveniently through our online vegetable delivery service!             \r\n \r\nPlace carrots in a containers with lid and cover completely in water. Keep container in the refrigerator."   \r\n 	25	35	24	photos/products/Carrots1.png	t	2021-12-31 12:33:41.525753+05:30	2021-12-31 12:33:41.525753+05:30	\N	\N	\N	\N	False	\N	2	2
8	Onions	Onions	Shop for fresh Big Onions from our online vegetable store! Your kitchen is just incomplete without this essential vegetable. \r\n\r\nBuy vegetables online & get them home delivered through our online vegetable delivery service.      \r\n     \r\n\r\n 	33	44	24	photos/products/Onions1.png	t	2021-12-31 14:01:45.741656+05:30	2021-12-31 14:01:45.741656+05:30	\N	\N	\N	\N	False	\N	2	2
9	Cabbage	Cabbage	Add some crunch to your salad along with the goodness of vital nutrients.         \r\n       Cabbage gives you doses of fiber , folate, potassium, magnesium, vitamins A, C, and K. It may help protect against radiation, prevent cancer, and reduce heart disease risk.	25	37	24	photos/products/Cabbage1.png	t	2021-12-31 14:42:39.66352+05:30	2021-12-31 14:42:39.664537+05:30	\N	\N	\N	\N	False	\N	2	2
2	RED APPLE	RED-APPLE	Lower high cholesterol, Support your immune system, control your diabetes & replenish your nutrient intake with our safe-to-eat Kinnaur Apples. It is a  succulent, juicy & pure organic Indian Kinnaur Apples that are locally sourced, pesticide-free & full of essential nutrients.\r\n\r\nOne cup of Apple (125g) has approximate:\r\n65 Calories\r\n0.2g Fat\r\n17g Carbs\r\n3g Fiber\r\n13g Sugar\r\n0.3g Protein	65	75	24	photos/products/RED_APPLE1.png	t	2021-12-30 16:36:03.087339+05:30	2021-12-30 16:36:03.087339+05:30	\N	\N	\N	\N	False	\N	1	1
11	Blueberries	Blueberries	Maintain healthy eyes, prevent heart diseases, regulate blood sugar & get your daily dose of antioxidants with our farm-fresh Blueberries.	66	55	23	photos/products/Blueberries1.png	t	2022-01-06 12:51:43.624636+05:30	2022-01-06 12:51:43.624636+05:30	\N	\N	\N	\N	False	\N	1	1
10	Kiwi	Kiwi	Packed with Vitamin C to build a stronger immunity & revitalize your system with the goodness of antioxidants with these fresh Kiwis!	77	89	24	photos/products/Kiwi1.png	t	2022-01-05 19:06:57.837535+05:30	2022-01-05 19:06:57.837535+05:30	\N	\N	\N	\N	False	\N	1	1
12	Coconuts	Coconuts	Enrich your lifestyle with the goodness of tender coconut, packed with essential nutrients, it is your one-stop-shop for your daily dose of vitamins and minerals. 	55	44	24	photos/products/Coconuts1.png	t	2022-01-08 10:12:42.321153+05:30	2022-01-08 10:12:42.322151+05:30	\N	\N	\N	\N	False	\N	1	1
13	Citrus	Citrus	Protect your cells against cell damage, boost your immune system & get smoother skin by including these delicious Oranges in your diet. Oranges are rich in antioxidants that help in eliminating free radicles within the body & reduce the risk of contracting deadly diseases like Cancer.  An orange a day can help you look young & keep your skin free from damage! \r\n\r\nOrder fresh exotic fruits from our online fruits & vegetable store & get them delivered to your doorstep with our online fruit & vegetable delivery service.	80	90	20	photos/products/Citrus1.png	t	2022-01-08 10:19:42.748855+05:30	2022-01-08 10:19:42.748855+05:30	\N	\N	\N	\N	False	\N	1	1
5	POMEGRANATE	POMEGRANATE	Other names – \r\nHindi - Anar\r\nMalayalam  - Mathalam, Mathalanaranga\r\nTamil - Matulai\r\nTelugu - Danimma\r\nKannada - Dalimbe\r\nNutritional Information\r\nPomegranates have a high nutritional profile, with one cup of arils (174 grams) containing (2):\r\n7 grams of fiber\r\n3-gram protein\r\n30 percent of the RDI (Recommended Daily Intake) for vitamin C\r\n36 percent of the RDI for vitamin K\r\n16 percent of the RDI for folate\r\nPotassium: 12% of the RDI\r\n\r\nPomegranate arils are quite sweet, with 24 grams of sugar and 144 calories in one cup. Pomegranates stand out for their abundance of strong plant components, some of which have great therapeutic effects. Pomegranates contain two distinct compounds that are responsible for the majority of their health benefits. Punicalagins is the first. Punicalagins, which are present in pomegranate juice and peel, are highly powerful antioxidants. They are so potent that pomegranate juice has three times the antioxidant activity of red wine and green tea. Because of its high antioxidant and punicalagin content, pomegranate extract and powder are generally produced from the peel. Punicic Acid is the second component that makes pomegranates particularly healthful. The primary fatty acid in the arils is punicic acid, which is present in pomegranate seed oil. It is a kind of conjugated linoleic acid that has powerful biological effects. \r\n\r\n	46	60	24	photos/products/POMEGRANATE1.png	t	2021-12-30 17:43:18.867476+05:30	2021-12-30 17:43:18.86785+05:30	\N	\N	\N	\N	False	\N	1	1
14	Beet Root	Beet-Root	Beetroots contain a potent plant compounds that aid in cell formation, growth & function. Fresh Beetroots are full of fiber, folate, manganese, potassium, iron & vitamin C. Regular consumption of beetroots improve blood flow, lower blood pressure & also increase physical performance.\r\n\r\nThis vegetable is one of the few vegetables that contain important bioactive pigments known as betalains which protects numerous systems in the body, including cardiovascular health. \r\n 	35	45	24	photos/products/Beet_Root1.png	t	2022-01-11 19:44:24.359497+05:30	2022-01-11 19:44:24.359497+05:30	\N	\N	\N	\N	False	\N	2	2
15	Pumpkin	Pumpkin	Just like its huge size, pumpkin has a lot of health benefits! The vegetable is also good for improper digestion and helps in removing intestinal worms from the digestive system. It contains valuable nutrients like fiber and potassium and helps in controlling blood pressure and sugar and curing skin diseases.\r\n 	33	46	24	photos/products/Pumpkin1.png	t	2022-01-11 20:09:01.273961+05:30	2022-01-11 20:09:01.273961+05:30	\N	\N	\N	\N	False	\N	2	2
\.


--
-- Data for Name: useraccount_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.useraccount_accounts (id, password, last_login, first_name, last_name, username, email, phone_number, date_joined, last_joined, is_admin, is_staff, is_active, is_superadmin, wallet_amount, referral_code) FROM stdin;
5	pbkdf2_sha256$260000$y9gTqNBBkHNMcmUAnR83dc$MkeY1iATvNTIJU4JPSYBbwXjWxVOpHMQQrgJrQHlFrc=	2022-01-11 19:21:30.102798+05:30	ajas	sps	ajassps	ajas@gmail.com	9497745709	2021-12-27 13:33:27.204879+05:30	2021-12-27 13:33:27.204879+05:30	f	f	t	f	0	\N
8	pbkdf2_sha256$260000$3zLcVdxiE69izmyZJYaBId$dmTNG5GqcR8x/gChlDQe/t315ySiVln5xLKNW8LFFTI=	2022-01-07 11:30:15.584489+05:30	aleema	sps	aleemasps	aleema@gmail.com	8590541551	2022-01-07 11:29:49.588306+05:30	2022-01-07 11:29:49.588306+05:30	f	f	t	f	10	be081362
7	pbkdf2_sha256$260000$HOqB5CByaGY0rCfHcXB8Fv$CyQpWzLd+TotIzchnqItbpv/SiAeuRefobxSkpp85MQ=	2022-01-01 19:39:52.531518+05:30	afzal	sps	afzal	afzal@gmail.com	7736873733	2022-01-01 19:12:25.203834+05:30	2022-01-01 19:12:25.203834+05:30	f	f	t	f	10	d18e33db
2	pbkdf2_sha256$260000$PYHGd5vSDKLIM0yYD6alfl$qRzBcGp30IX9RWw66866H6twODmuD+URAW9iNbNftRY=	2022-01-07 15:33:43.492664+05:30	ARJUN	KURUP	arjun	arjunkurup24@gmail.com	7356502642	2021-12-27 12:23:42.393263+05:30	2021-12-27 12:23:42.393263+05:30	f	t	t	t	0	199944a5
6	pbkdf2_sha256$260000$dZ8BFduomeV54SVqQ8W1U2$MC9M7lgLQr3YZVeOpLLMJ4v2siq/T0oUMGH0yY41ZCc=	2022-01-07 15:33:59.49319+05:30	vishnu	sps	vishnusps	vishnu@gmail.com	9061657828	2021-12-28 18:17:03.876388+05:30	2021-12-28 18:17:03.876388+05:30	f	f	t	f	0	941f6eb7
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: cart_cartitems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_cartitems_id_seq', 161, true);


--
-- Name: cart_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_order_id_seq', 45, true);


--
-- Name: cart_orderitems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_orderitems_id_seq', 49, true);


--
-- Name: cart_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_payment_id_seq', 45, true);


--
-- Name: cart_useraddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_useraddress_id_seq', 7, true);


--
-- Name: cart_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_wishlist_id_seq', 16, true);


--
-- Name: categorymanagement_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorymanagement_category_id_seq', 2, true);


--
-- Name: categorymanagement_offer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorymanagement_offer_id_seq', 8, true);


--
-- Name: categorymanagement_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorymanagement_subcategory_id_seq', 2, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: productmanagement_banner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productmanagement_banner_id_seq', 8, true);


--
-- Name: productmanagement_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productmanagement_coupon_id_seq', 16, true);


--
-- Name: productmanagement_expiredcoupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productmanagement_expiredcoupon_id_seq', 8, true);


--
-- Name: productmanagement_imagegallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productmanagement_imagegallery_id_seq', 60, true);


--
-- Name: productmanagement_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productmanagement_products_id_seq', 15, true);


--
-- Name: useraccount_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.useraccount_accounts_id_seq', 8, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: cart_cartitems cart_cartitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_cartitems
    ADD CONSTRAINT cart_cartitems_pkey PRIMARY KEY (id);


--
-- Name: cart_order cart_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_order
    ADD CONSTRAINT cart_order_pkey PRIMARY KEY (id);


--
-- Name: cart_orderitems cart_orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_orderitems
    ADD CONSTRAINT cart_orderitems_pkey PRIMARY KEY (id);


--
-- Name: cart_payment cart_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_payment
    ADD CONSTRAINT cart_payment_pkey PRIMARY KEY (id);


--
-- Name: cart_useraddress cart_useraddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_useraddress
    ADD CONSTRAINT cart_useraddress_email_key UNIQUE (email);


--
-- Name: cart_useraddress cart_useraddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_useraddress
    ADD CONSTRAINT cart_useraddress_pkey PRIMARY KEY (id);


--
-- Name: cart_wishlist cart_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_wishlist
    ADD CONSTRAINT cart_wishlist_pkey PRIMARY KEY (id);


--
-- Name: categorymanagement_category categorymanagement_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorymanagement_category
    ADD CONSTRAINT categorymanagement_category_pkey PRIMARY KEY (id);


--
-- Name: categorymanagement_category categorymanagement_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorymanagement_category
    ADD CONSTRAINT categorymanagement_category_slug_key UNIQUE (slug);


--
-- Name: categorymanagement_offer categorymanagement_offer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorymanagement_offer
    ADD CONSTRAINT categorymanagement_offer_pkey PRIMARY KEY (id);


--
-- Name: categorymanagement_subcategory categorymanagement_subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorymanagement_subcategory
    ADD CONSTRAINT categorymanagement_subcategory_pkey PRIMARY KEY (id);


--
-- Name: categorymanagement_subcategory categorymanagement_subcategory_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorymanagement_subcategory
    ADD CONSTRAINT categorymanagement_subcategory_slug_key UNIQUE (slug);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: productmanagement_banner productmanagement_banner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_banner
    ADD CONSTRAINT productmanagement_banner_pkey PRIMARY KEY (id);


--
-- Name: productmanagement_coupon productmanagement_coupon_coupon_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_coupon
    ADD CONSTRAINT productmanagement_coupon_coupon_id_key UNIQUE (coupon_id);


--
-- Name: productmanagement_coupon productmanagement_coupon_coupon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_coupon
    ADD CONSTRAINT productmanagement_coupon_coupon_name_key UNIQUE (coupon_name);


--
-- Name: productmanagement_coupon productmanagement_coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_coupon
    ADD CONSTRAINT productmanagement_coupon_pkey PRIMARY KEY (id);


--
-- Name: productmanagement_expiredcoupon productmanagement_expiredcoupon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_expiredcoupon
    ADD CONSTRAINT productmanagement_expiredcoupon_pkey PRIMARY KEY (id);


--
-- Name: productmanagement_imagegallery productmanagement_imagegallery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_imagegallery
    ADD CONSTRAINT productmanagement_imagegallery_pkey PRIMARY KEY (id);


--
-- Name: productmanagement_products productmanagement_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_products
    ADD CONSTRAINT productmanagement_products_pkey PRIMARY KEY (id);


--
-- Name: productmanagement_products productmanagement_products_product_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_products
    ADD CONSTRAINT productmanagement_products_product_name_key UNIQUE (product_name);


--
-- Name: productmanagement_products productmanagement_products_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_products
    ADD CONSTRAINT productmanagement_products_slug_key UNIQUE (slug);


--
-- Name: useraccount_accounts useraccount_accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.useraccount_accounts
    ADD CONSTRAINT useraccount_accounts_email_key UNIQUE (email);


--
-- Name: useraccount_accounts useraccount_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.useraccount_accounts
    ADD CONSTRAINT useraccount_accounts_pkey PRIMARY KEY (id);


--
-- Name: useraccount_accounts useraccount_accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.useraccount_accounts
    ADD CONSTRAINT useraccount_accounts_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: cart_cartitems_products_id_id_d1a35567; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_cartitems_products_id_id_d1a35567 ON public.cart_cartitems USING btree (products_id_id);


--
-- Name: cart_cartitems_user_id_9647bf4e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_cartitems_user_id_9647bf4e ON public.cart_cartitems USING btree (user_id);


--
-- Name: cart_order_user_id_279b5d53; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_order_user_id_279b5d53 ON public.cart_order USING btree (user_id);


--
-- Name: cart_orderitems_order_id_6f7c3092; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_orderitems_order_id_6f7c3092 ON public.cart_orderitems USING btree (order_id);


--
-- Name: cart_orderitems_products_id_id_e065597d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_orderitems_products_id_id_e065597d ON public.cart_orderitems USING btree (products_id_id);


--
-- Name: cart_orderitems_user_id_cbe17fea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_orderitems_user_id_cbe17fea ON public.cart_orderitems USING btree (user_id);


--
-- Name: cart_payment_order_id_1c722b45; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_payment_order_id_1c722b45 ON public.cart_payment USING btree (order_id);


--
-- Name: cart_payment_user_id_8292ee31; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_payment_user_id_8292ee31 ON public.cart_payment USING btree (user_id);


--
-- Name: cart_useraddress_email_3701f3d4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_useraddress_email_3701f3d4_like ON public.cart_useraddress USING btree (email varchar_pattern_ops);


--
-- Name: cart_useraddress_user_id_8b5f4943; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_useraddress_user_id_8b5f4943 ON public.cart_useraddress USING btree (user_id);


--
-- Name: cart_wishlist_products_id_id_28f07206; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_wishlist_products_id_id_28f07206 ON public.cart_wishlist USING btree (products_id_id);


--
-- Name: cart_wishlist_user_id_c35eec54; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_wishlist_user_id_c35eec54 ON public.cart_wishlist USING btree (user_id);


--
-- Name: categorymanagement_category_slug_0204e825_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categorymanagement_category_slug_0204e825_like ON public.categorymanagement_category USING btree (slug varchar_pattern_ops);


--
-- Name: categorymanagement_subcategory_catergory_id_id_4b57f64a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categorymanagement_subcategory_catergory_id_id_4b57f64a ON public.categorymanagement_subcategory USING btree (catergory_id_id);


--
-- Name: categorymanagement_subcategory_slug_34294104_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categorymanagement_subcategory_slug_34294104_like ON public.categorymanagement_subcategory USING btree (slug varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: productmanagement_banner_product_id_9bbfdcc0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX productmanagement_banner_product_id_9bbfdcc0 ON public.productmanagement_banner USING btree (product_id);


--
-- Name: productmanagement_coupon_coupon_id_73e51531_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX productmanagement_coupon_coupon_id_73e51531_like ON public.productmanagement_coupon USING btree (coupon_id varchar_pattern_ops);


--
-- Name: productmanagement_coupon_coupon_name_e812af40_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX productmanagement_coupon_coupon_name_e812af40_like ON public.productmanagement_coupon USING btree (coupon_name varchar_pattern_ops);


--
-- Name: productmanagement_expiredcoupon_coupon_id_a7833acc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX productmanagement_expiredcoupon_coupon_id_a7833acc ON public.productmanagement_expiredcoupon USING btree (coupon_id);


--
-- Name: productmanagement_expiredcoupon_user_id_e91931ee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX productmanagement_expiredcoupon_user_id_e91931ee ON public.productmanagement_expiredcoupon USING btree (user_id);


--
-- Name: productmanagement_imagegallery_product_id_id_e722c849; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX productmanagement_imagegallery_product_id_id_e722c849 ON public.productmanagement_imagegallery USING btree (product_id_id);


--
-- Name: productmanagement_products_category_id_1d77ad65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX productmanagement_products_category_id_1d77ad65 ON public.productmanagement_products USING btree (category_id);


--
-- Name: productmanagement_products_product_name_ffb02240_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX productmanagement_products_product_name_ffb02240_like ON public.productmanagement_products USING btree (product_name varchar_pattern_ops);


--
-- Name: productmanagement_products_slug_3a3a8443_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX productmanagement_products_slug_3a3a8443_like ON public.productmanagement_products USING btree (slug varchar_pattern_ops);


--
-- Name: productmanagement_products_sub_category_id_555a7e2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX productmanagement_products_sub_category_id_555a7e2c ON public.productmanagement_products USING btree (sub_category_id);


--
-- Name: useraccount_accounts_email_fd64abdb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX useraccount_accounts_email_fd64abdb_like ON public.useraccount_accounts USING btree (email varchar_pattern_ops);


--
-- Name: useraccount_accounts_username_e27d5bd1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX useraccount_accounts_username_e27d5bd1_like ON public.useraccount_accounts USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_cartitems cart_cartitems_products_id_id_d1a35567_fk_productma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_cartitems
    ADD CONSTRAINT cart_cartitems_products_id_id_d1a35567_fk_productma FOREIGN KEY (products_id_id) REFERENCES public.productmanagement_products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_cartitems cart_cartitems_user_id_9647bf4e_fk_useraccount_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_cartitems
    ADD CONSTRAINT cart_cartitems_user_id_9647bf4e_fk_useraccount_accounts_id FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_order cart_order_user_id_279b5d53_fk_useraccount_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_order
    ADD CONSTRAINT cart_order_user_id_279b5d53_fk_useraccount_accounts_id FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_orderitems cart_orderitems_order_id_6f7c3092_fk_cart_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_orderitems
    ADD CONSTRAINT cart_orderitems_order_id_6f7c3092_fk_cart_order_id FOREIGN KEY (order_id) REFERENCES public.cart_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_orderitems cart_orderitems_products_id_id_e065597d_fk_productma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_orderitems
    ADD CONSTRAINT cart_orderitems_products_id_id_e065597d_fk_productma FOREIGN KEY (products_id_id) REFERENCES public.productmanagement_products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_orderitems cart_orderitems_user_id_cbe17fea_fk_useraccount_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_orderitems
    ADD CONSTRAINT cart_orderitems_user_id_cbe17fea_fk_useraccount_accounts_id FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_payment cart_payment_order_id_1c722b45_fk_cart_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_payment
    ADD CONSTRAINT cart_payment_order_id_1c722b45_fk_cart_order_id FOREIGN KEY (order_id) REFERENCES public.cart_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_payment cart_payment_user_id_8292ee31_fk_useraccount_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_payment
    ADD CONSTRAINT cart_payment_user_id_8292ee31_fk_useraccount_accounts_id FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_useraddress cart_useraddress_user_id_8b5f4943_fk_useraccount_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_useraddress
    ADD CONSTRAINT cart_useraddress_user_id_8b5f4943_fk_useraccount_accounts_id FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_wishlist cart_wishlist_products_id_id_28f07206_fk_productma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_wishlist
    ADD CONSTRAINT cart_wishlist_products_id_id_28f07206_fk_productma FOREIGN KEY (products_id_id) REFERENCES public.productmanagement_products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_wishlist cart_wishlist_user_id_c35eec54_fk_useraccount_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_wishlist
    ADD CONSTRAINT cart_wishlist_user_id_c35eec54_fk_useraccount_accounts_id FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: categorymanagement_subcategory categorymanagement_s_catergory_id_id_4b57f64a_fk_categorym; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorymanagement_subcategory
    ADD CONSTRAINT categorymanagement_s_catergory_id_id_4b57f64a_fk_categorym FOREIGN KEY (catergory_id_id) REFERENCES public.categorymanagement_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productmanagement_banner productmanagement_ba_product_id_9bbfdcc0_fk_productma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_banner
    ADD CONSTRAINT productmanagement_ba_product_id_9bbfdcc0_fk_productma FOREIGN KEY (product_id) REFERENCES public.productmanagement_products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productmanagement_expiredcoupon productmanagement_ex_coupon_id_a7833acc_fk_productma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_expiredcoupon
    ADD CONSTRAINT productmanagement_ex_coupon_id_a7833acc_fk_productma FOREIGN KEY (coupon_id) REFERENCES public.productmanagement_coupon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productmanagement_expiredcoupon productmanagement_ex_user_id_e91931ee_fk_useraccou; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_expiredcoupon
    ADD CONSTRAINT productmanagement_ex_user_id_e91931ee_fk_useraccou FOREIGN KEY (user_id) REFERENCES public.useraccount_accounts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productmanagement_imagegallery productmanagement_im_product_id_id_e722c849_fk_productma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_imagegallery
    ADD CONSTRAINT productmanagement_im_product_id_id_e722c849_fk_productma FOREIGN KEY (product_id_id) REFERENCES public.productmanagement_products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productmanagement_products productmanagement_pr_category_id_1d77ad65_fk_categorym; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_products
    ADD CONSTRAINT productmanagement_pr_category_id_1d77ad65_fk_categorym FOREIGN KEY (category_id) REFERENCES public.categorymanagement_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productmanagement_products productmanagement_pr_sub_category_id_555a7e2c_fk_categorym; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmanagement_products
    ADD CONSTRAINT productmanagement_pr_sub_category_id_555a7e2c_fk_categorym FOREIGN KEY (sub_category_id) REFERENCES public.categorymanagement_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

