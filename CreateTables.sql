-- Database: testinvoicedb

DROP DATABASE invoicedb;

CREATE DATABASE invoicedb
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;



-- Table: public.invoices
--DROP TABLE public.invoices;
CREATE TABLE public.invoices
(
	id bigserial NOT NULL PRIMARY KEY,
    cust_name character varying(50) COLLATE pg_catalog."default",
    date_created timestamp without time zone
)

TABLESPACE pg_default;

ALTER TABLE public.invoices
    OWNER to postgres;


-- Table: public.invoice_items

--DROP TABLE public.invoice_items;

CREATE TABLE public.invoice_items
(
	id bigserial NOT NULL PRIMARY KEY,
    invoice_id integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    description character varying(200) COLLATE pg_catalog."default",
    CONSTRAINT invoice_items_invoice_id_fkey FOREIGN KEY (invoice_id)
        REFERENCES public.invoices (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.invoice_items
    OWNER to postgres;
	