PGDMP      ,                }            Libreria    17.4    17.4 +    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16387    Libreria    DATABASE     p   CREATE DATABASE "Libreria" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-ES';
    DROP DATABASE "Libreria";
                     postgres    false            �            1259    16388    calificaciones    TABLE     �  CREATE TABLE public.calificaciones (
    "id_calificación" integer NOT NULL,
    id_usuario integer NOT NULL,
    id_libro integer NOT NULL,
    "puntuación" smallint NOT NULL,
    comentario text,
    "fecha_calificación" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "calificaciones_puntuación_check" CHECK ((("puntuación" >= 1) AND ("puntuación" <= 5)))
);
 "   DROP TABLE public.calificaciones;
       public         heap r       postgres    false            �            1259    16395 #   calificaciones_id_calificación_seq    SEQUENCE     �   CREATE SEQUENCE public."calificaciones_id_calificación_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."calificaciones_id_calificación_seq";
       public               postgres    false    217            �           0    0 #   calificaciones_id_calificación_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public."calificaciones_id_calificación_seq" OWNED BY public.calificaciones."id_calificación";
          public               postgres    false    218            �            1259    16396    interacciones    TABLE       CREATE TABLE public.interacciones (
    "id_interacción" integer NOT NULL,
    id_usuario integer NOT NULL,
    id_libro integer NOT NULL,
    "tipo_interacción" character varying(50),
    "fecha_interacción" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.interacciones;
       public         heap r       postgres    false            �            1259    16400 !   interacciones_id_interacción_seq    SEQUENCE     �   CREATE SEQUENCE public."interacciones_id_interacción_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."interacciones_id_interacción_seq";
       public               postgres    false    219            �           0    0 !   interacciones_id_interacción_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."interacciones_id_interacción_seq" OWNED BY public.interacciones."id_interacción";
          public               postgres    false    220            �            1259    16401    libros    TABLE     -  CREATE TABLE public.libros (
    id_libro integer NOT NULL,
    "título" character varying(200) NOT NULL,
    autor character varying(100) NOT NULL,
    "género" character varying(50),
    "año_publicación" integer,
    "descripción" text,
    "puntuación_promedio" numeric(3,2) DEFAULT 0.00
);
    DROP TABLE public.libros;
       public         heap r       postgres    false            �            1259    16407    libros_id_libro_seq    SEQUENCE     �   CREATE SEQUENCE public.libros_id_libro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.libros_id_libro_seq;
       public               postgres    false    221            �           0    0    libros_id_libro_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.libros_id_libro_seq OWNED BY public.libros.id_libro;
          public               postgres    false    222            �            1259    16408    recomendaciones    TABLE       CREATE TABLE public.recomendaciones (
    "id_recomendación" integer NOT NULL,
    id_usuario integer NOT NULL,
    id_libro integer NOT NULL,
    "razón_recomendación" text,
    "fecha_recomendación" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.recomendaciones;
       public         heap r       postgres    false            �            1259    16414 %   recomendaciones_id_recomendación_seq    SEQUENCE     �   CREATE SEQUENCE public."recomendaciones_id_recomendación_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."recomendaciones_id_recomendación_seq";
       public               postgres    false    223            �           0    0 %   recomendaciones_id_recomendación_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."recomendaciones_id_recomendación_seq" OWNED BY public.recomendaciones."id_recomendación";
          public               postgres    false    224            �            1259    16481    usuario    TABLE       CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nombre_usuario character varying(100) NOT NULL,
    correo character varying(150) NOT NULL,
    "contraseña" character varying NOT NULL,
    genero_uno character varying NOT NULL,
    genero_dos character varying
);
    DROP TABLE public.usuario;
       public         heap r       postgres    false            �            1259    16480    usuario_id_usuario_seq    SEQUENCE     �   ALTER TABLE public.usuario ALTER COLUMN id_usuario ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 500
    CACHE 1
);
            public               postgres    false    226            5           2604    16421    calificaciones id_calificación    DEFAULT     �   ALTER TABLE ONLY public.calificaciones ALTER COLUMN "id_calificación" SET DEFAULT nextval('public."calificaciones_id_calificación_seq"'::regclass);
 P   ALTER TABLE public.calificaciones ALTER COLUMN "id_calificación" DROP DEFAULT;
       public               postgres    false    218    217            7           2604    16422    interacciones id_interacción    DEFAULT     �   ALTER TABLE ONLY public.interacciones ALTER COLUMN "id_interacción" SET DEFAULT nextval('public."interacciones_id_interacción_seq"'::regclass);
 N   ALTER TABLE public.interacciones ALTER COLUMN "id_interacción" DROP DEFAULT;
       public               postgres    false    220    219            9           2604    16423    libros id_libro    DEFAULT     r   ALTER TABLE ONLY public.libros ALTER COLUMN id_libro SET DEFAULT nextval('public.libros_id_libro_seq'::regclass);
 >   ALTER TABLE public.libros ALTER COLUMN id_libro DROP DEFAULT;
       public               postgres    false    222    221            ;           2604    16424 !   recomendaciones id_recomendación    DEFAULT     �   ALTER TABLE ONLY public.recomendaciones ALTER COLUMN "id_recomendación" SET DEFAULT nextval('public."recomendaciones_id_recomendación_seq"'::regclass);
 R   ALTER TABLE public.recomendaciones ALTER COLUMN "id_recomendación" DROP DEFAULT;
       public               postgres    false    224    223            �          0    16388    calificaciones 
   TABLE DATA           �   COPY public.calificaciones ("id_calificación", id_usuario, id_libro, "puntuación", comentario, "fecha_calificación") FROM stdin;
    public               postgres    false    217   �9       �          0    16396    interacciones 
   TABLE DATA           {   COPY public.interacciones ("id_interacción", id_usuario, id_libro, "tipo_interacción", "fecha_interacción") FROM stdin;
    public               postgres    false    219   �9       �          0    16401    libros 
   TABLE DATA           �   COPY public.libros (id_libro, "título", autor, "género", "año_publicación", "descripción", "puntuación_promedio") FROM stdin;
    public               postgres    false    221   �9       �          0    16408    recomendaciones 
   TABLE DATA           �   COPY public.recomendaciones ("id_recomendación", id_usuario, id_libro, "razón_recomendación", "fecha_recomendación") FROM stdin;
    public               postgres    false    223   �9       �          0    16481    usuario 
   TABLE DATA           l   COPY public.usuario (id_usuario, nombre_usuario, correo, "contraseña", genero_uno, genero_dos) FROM stdin;
    public               postgres    false    226   �9       �           0    0 #   calificaciones_id_calificación_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."calificaciones_id_calificación_seq"', 1, false);
          public               postgres    false    218            �           0    0 !   interacciones_id_interacción_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."interacciones_id_interacción_seq"', 1, false);
          public               postgres    false    220            �           0    0    libros_id_libro_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.libros_id_libro_seq', 1, false);
          public               postgres    false    222            �           0    0 %   recomendaciones_id_recomendación_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."recomendaciones_id_recomendación_seq"', 1, false);
          public               postgres    false    224            �           0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1, false);
          public               postgres    false    225            ?           2606    16427 "   calificaciones calificaciones_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY ("id_calificación");
 L   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_pkey;
       public                 postgres    false    217            A           2606    16429     interacciones interacciones_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.interacciones
    ADD CONSTRAINT interacciones_pkey PRIMARY KEY ("id_interacción");
 J   ALTER TABLE ONLY public.interacciones DROP CONSTRAINT interacciones_pkey;
       public                 postgres    false    219            C           2606    16431    libros libros_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id_libro);
 <   ALTER TABLE ONLY public.libros DROP CONSTRAINT libros_pkey;
       public                 postgres    false    221            E           2606    16433 $   recomendaciones recomendaciones_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_pkey PRIMARY KEY ("id_recomendación");
 N   ALTER TABLE ONLY public.recomendaciones DROP CONSTRAINT recomendaciones_pkey;
       public                 postgres    false    223            G           2606    16487    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public                 postgres    false    226            H           2606    16438 +   calificaciones calificaciones_id_libro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_id_libro_fkey FOREIGN KEY (id_libro) REFERENCES public.libros(id_libro) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_id_libro_fkey;
       public               postgres    false    4675    221    217            I           2606    16488 )   calificaciones calificaciones_id_usu_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_id_usu_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) NOT VALID;
 S   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_id_usu_fkey;
       public               postgres    false    226    4679    217            J           2606    16448 )   interacciones interacciones_id_libro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.interacciones
    ADD CONSTRAINT interacciones_id_libro_fkey FOREIGN KEY (id_libro) REFERENCES public.libros(id_libro) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.interacciones DROP CONSTRAINT interacciones_id_libro_fkey;
       public               postgres    false    219    4675    221            K           2606    16493 '   interacciones interacciones_id_usu_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.interacciones
    ADD CONSTRAINT interacciones_id_usu_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) NOT VALID;
 Q   ALTER TABLE ONLY public.interacciones DROP CONSTRAINT interacciones_id_usu_fkey;
       public               postgres    false    219    226    4679            L           2606    16458 -   recomendaciones recomendaciones_id_libro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_id_libro_fkey FOREIGN KEY (id_libro) REFERENCES public.libros(id_libro) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.recomendaciones DROP CONSTRAINT recomendaciones_id_libro_fkey;
       public               postgres    false    221    223    4675            M           2606    16498 /   recomendaciones recomendaciones_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) NOT VALID;
 Y   ALTER TABLE ONLY public.recomendaciones DROP CONSTRAINT recomendaciones_id_usuario_fkey;
       public               postgres    false    226    223    4679            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     