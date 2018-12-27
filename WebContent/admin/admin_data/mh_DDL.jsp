<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

DROP TABLE mh_address_coords CASCADE CONSTRAINTS;
DROP TABLE mh_admin_member CASCADE CONSTRAINTS;
DROP TABLE mh_analysis_sales CASCADE CONSTRAINTS;
DROP TABLE mh_black_member CASCADE CONSTRAINTS;
DROP TABLE mh_car CASCADE CONSTRAINTS;
DROP TABLE mh_order_history CASCADE CONSTRAINTS;
DROP TABLE mh_report CASCADE CONSTRAINTS;
DROP TABLE mh_review CASCADE CONSTRAINTS;
DROP TABLE mh_customer_member CASCADE CONSTRAINTS;
DROP TABLE mh_menu CASCADE CONSTRAINTS;
DROP TABLE mh_notice CASCADE CONSTRAINTS;
DROP TABLE mh_store_member CASCADE CONSTRAINTS;
DROP TABLE mh_regression CASCADE CONSTRAINTS;

CREATE TABLE mh_regression
(
	coefficients varchar2(20),
	weight number
);

CREATE TABLE mh_address_coords
(
	store_id varchar2(20) NOT NULL,
	store_lon number,
	store_lat number
);


CREATE TABLE mh_admin_member
(
	admin_id varchar2(20) NOT NULL,
	admin_pw varchar2(20) NOT NULL,
	PRIMARY KEY (admin_id)
);


CREATE TABLE mh_analysis_sales
(
	sales_year_month varchar2(21) NOT NULL,
	sales number NOT NULL,
	PRIMARY KEY (sales_year_month)
);


CREATE TABLE mh_black_member
(
	cus_id varchar2(20) NOT NULL UNIQUE
);


CREATE TABLE mh_car
(
	car_id varchar2(20) NOT NULL,
	order_no number NOT NULL,
	car_x number NOT NULL,
	car_y number NOT NULL,
	car_date timestamp NOT NULL
);


CREATE TABLE mh_customer_member
(
	cus_id varchar2(20) NOT NULL,
	cus_pw varchar2(20) NOT NULL,
	cus_nickname varchar2(30) NOT NULL,
	cus_address varchar2(150) NOT NULL,
	cus_address2 varchar2(90),
	cus_email varchar2(40) NOT NULL,
	cus_tel varchar2(13) NOT NULL,
	cus_reg_date timestamp NOT NULL,
	cus_gender number(1) NOT NULL,
	cus_birth date NOT NULL,
	PRIMARY KEY (cus_id)
);


CREATE TABLE mh_menu
(
	menu_id number(4,0) NOT NULL,
	menu_name varchar2(60) NOT NULL UNIQUE,
	menu_price number NOT NULL,
	menu_image varchar2(300),
	menu_category number(1) NOT NULL,
	menu_detail varchar2(4000),
	PRIMARY KEY (menu_id)
);


CREATE TABLE mh_notice
(
	notice_no number NOT NULL,
	notice_subject varchar2(90) NOT NULL,
	notice_content varchar2(4000),
	notice_write_date timestamp NOT NULL,
	notice_hits number NOT NULL,
	PRIMARY KEY (notice_no)
);


CREATE TABLE mh_order_history
(
	order_no number NOT NULL,
	order_qnt number(2,0) NOT NULL,
	order_date timestamp NOT NULL,
	menu_id number(4,0) NOT NULL,
	cus_id varchar2(20) NOT NULL,
	store_id varchar2(20) NOT NULL,
	order_status number(1) NOT NULL
);


CREATE TABLE mh_report
(
	report_no number NOT NULL,
	review_no number NOT NULL,
	report_reason number(1) NOT NULL,
	cus_id varchar2(20) NOT NULL,
	PRIMARY KEY (report_no)
);


CREATE TABLE mh_review
(
	review_no number NOT NULL,
	review_subject varchar2(90) NOT NULL,
	review_write_date timestamp NOT NULL,
	review_hits number,
	review_score number(1),
	review_content varchar2(4000) NOT NULL,
	review_image varchar2(300),
	ref_id number,
	re_step number,
	re_level number,
	cus_id varchar2(20) NOT NULL,
	PRIMARY KEY (review_no)
);


CREATE TABLE mh_store_member
(
	store_id varchar2(20) NOT NULL,
	store_pw varchar2(20) NOT NULL,
	store_address varchar2(150) NOT NULL,
	store_name varchar2(60) NOT NULL,
	store_tel varchar2(13) NOT NULL,
	owner_name varchar2(15) NOT NULL,
	owner_tel varchar2(13) NOT NULL,
	owner_reg_date timestamp NOT NULL,
	owner_email varchar2(40) NOT NULL,
	PRIMARY KEY (store_id)
);

CREATE TABLE mh_recommendation
(
	cus_id varchar2(20) NOT NULL,
	menu_result varchar2(40) NOT NULL
);



