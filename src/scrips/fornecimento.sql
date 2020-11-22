
CREATE SEQUENCE public.dim_tempo_sk_tempo_seq;

CREATE TABLE public.dim_tempo (
                sk_tempo INTEGER NOT NULL DEFAULT nextval('public.dim_tempo_sk_tempo_seq'),
                nk_tempo INTEGER NOT NULL,
                ano_tempo INTEGER NOT NULL,
                dt_completa DATE NOT NULL,
                dia_tempo INTEGER NOT NULL,
                mes_tempo INTEGER NOT NULL,
                CONSTRAINT dim_tempo_pk PRIMARY KEY (sk_tempo)
);


ALTER SEQUENCE public.dim_tempo_sk_tempo_seq OWNED BY public.dim_tempo.sk_tempo;

CREATE SEQUENCE public.dim_mercadoria_sk_mercadoria_seq;

CREATE TABLE public.dim_mercadoria (
                sk_mercadoria INTEGER NOT NULL DEFAULT nextval('public.dim_mercadoria_sk_mercadoria_seq'),
                nk_mercadoria VARCHAR(60) NOT NULL,
                nm_mercadoria VARCHAR(120) NOT NULL,
                CONSTRAINT dim_mercadoria_pk PRIMARY KEY (sk_mercadoria)
);


ALTER SEQUENCE public.dim_mercadoria_sk_mercadoria_seq OWNED BY public.dim_mercadoria.sk_mercadoria;

CREATE SEQUENCE public.dim_fornecedor_sk_fornecedor_seq;

CREATE TABLE public.dim_fornecedor (
                sk_fornecedor INTEGER NOT NULL DEFAULT nextval('public.dim_fornecedor_sk_fornecedor_seq'),
                nk_fornecedor VARCHAR(60) NOT NULL,
                cidade_fornecedor VARCHAR(60) NOT NULL,
                uf_fornecedor CHAR(2) NOT NULL,
                nm_fornecedor VARCHAR(60) NOT NULL,
                CONSTRAINT dim_fornecedor_pk PRIMARY KEY (sk_fornecedor)
);


ALTER SEQUENCE public.dim_fornecedor_sk_fornecedor_seq OWNED BY public.dim_fornecedor.sk_fornecedor;

CREATE SEQUENCE public.dim_filial_sk_filial_seq;

CREATE TABLE public.dim_filial (
                sk_filial INTEGER NOT NULL DEFAULT nextval('public.dim_filial_sk_filial_seq'),
                nk_filial VARCHAR NOT NULL,
                nm_filial VARCHAR(60) NOT NULL,
                CONSTRAINT dim_filial_pk PRIMARY KEY (sk_filial)
);


ALTER SEQUENCE public.dim_filial_sk_filial_seq OWNED BY public.dim_filial.sk_filial;

CREATE TABLE public.fato_fornercimento (
                sk_fornecedor INTEGER NOT NULL,
                sk_filial INTEGER NOT NULL,
                sk_mercadoria INTEGER NOT NULL,
                sk_tempo INTEGER NOT NULL,
                qtd INTEGER NOT NULL
);


ALTER TABLE public.fato_fornercimento ADD CONSTRAINT dim_tempo_fato_fornercimento_fk
FOREIGN KEY (sk_tempo)
REFERENCES public.dim_tempo (sk_tempo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.fato_fornercimento ADD CONSTRAINT dim_mercadoria_fato_fornercimento_fk
FOREIGN KEY (sk_mercadoria)
REFERENCES public.dim_mercadoria (sk_mercadoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.fato_fornercimento ADD CONSTRAINT dim_fornecedor_fato_fornercimento_fk
FOREIGN KEY (sk_fornecedor)
REFERENCES public.dim_fornecedor (sk_fornecedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.fato_fornercimento ADD CONSTRAINT dim_filial_fato_fornercimento_fk
FOREIGN KEY (sk_filial)
REFERENCES public.dim_filial (sk_filial)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;