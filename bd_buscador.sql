PGDMP  !                    }            Buscador_Libros    16.6    16.6 .    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24590    Buscador_Libros    DATABASE     �   CREATE DATABASE "Buscador_Libros" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
 !   DROP DATABASE "Buscador_Libros";
                postgres    false            �            1259    24648    calificaciones    TABLE     �  CREATE TABLE public.calificaciones (
    "id_calificación" integer NOT NULL,
    id_usuario integer NOT NULL,
    id_libro integer NOT NULL,
    "puntuación" smallint NOT NULL,
    comentario text,
    "fecha_calificación" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "calificaciones_puntuación_check" CHECK ((("puntuación" >= 1) AND ("puntuación" <= 5)))
);
 "   DROP TABLE public.calificaciones;
       public         heap    postgres    false            �            1259    24647 #   calificaciones_id_calificación_seq    SEQUENCE     �   CREATE SEQUENCE public."calificaciones_id_calificación_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."calificaciones_id_calificación_seq";
       public          postgres    false    220            �           0    0 #   calificaciones_id_calificación_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public."calificaciones_id_calificación_seq" OWNED BY public.calificaciones."id_calificación";
          public          postgres    false    219            �            1259    24689    interacciones    TABLE       CREATE TABLE public.interacciones (
    "id_interacción" integer NOT NULL,
    id_usuario integer NOT NULL,
    id_libro integer NOT NULL,
    "tipo_interacción" character varying(50),
    "fecha_interacción" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.interacciones;
       public         heap    postgres    false            �            1259    24688 !   interacciones_id_interacción_seq    SEQUENCE     �   CREATE SEQUENCE public."interacciones_id_interacción_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."interacciones_id_interacción_seq";
       public          postgres    false    224            �           0    0 !   interacciones_id_interacción_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."interacciones_id_interacción_seq" OWNED BY public.interacciones."id_interacción";
          public          postgres    false    223            �            1259    24638    libros    TABLE     -  CREATE TABLE public.libros (
    id_libro integer NOT NULL,
    "título" character varying(200) NOT NULL,
    autor character varying(100) NOT NULL,
    "género" character varying(50),
    "año_publicación" integer,
    "descripción" text,
    "puntuación_promedio" numeric(3,2) DEFAULT 0.00
);
    DROP TABLE public.libros;
       public         heap    postgres    false            �            1259    24637    libros_id_libro_seq    SEQUENCE     �   CREATE SEQUENCE public.libros_id_libro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.libros_id_libro_seq;
       public          postgres    false    218            �           0    0    libros_id_libro_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.libros_id_libro_seq OWNED BY public.libros.id_libro;
          public          postgres    false    217            �            1259    24669    recomendaciones    TABLE       CREATE TABLE public.recomendaciones (
    "id_recomendación" integer NOT NULL,
    id_usuario integer NOT NULL,
    id_libro integer NOT NULL,
    "razón_recomendación" text,
    "fecha_recomendación" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.recomendaciones;
       public         heap    postgres    false            �            1259    24668 %   recomendaciones_id_recomendación_seq    SEQUENCE     �   CREATE SEQUENCE public."recomendaciones_id_recomendación_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."recomendaciones_id_recomendación_seq";
       public          postgres    false    222            �           0    0 %   recomendaciones_id_recomendación_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."recomendaciones_id_recomendación_seq" OWNED BY public.recomendaciones."id_recomendación";
          public          postgres    false    221            �            1259    24627    usuarios    TABLE     J  CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre_usuario character varying(100) NOT NULL,
    "correo_electrónico" character varying(150) NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "Última_actividad" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    24626    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public          postgres    false    216            �           0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;
          public          postgres    false    215            3           2604    24651    calificaciones id_calificación    DEFAULT     �   ALTER TABLE ONLY public.calificaciones ALTER COLUMN "id_calificación" SET DEFAULT nextval('public."calificaciones_id_calificación_seq"'::regclass);
 P   ALTER TABLE public.calificaciones ALTER COLUMN "id_calificación" DROP DEFAULT;
       public          postgres    false    220    219    220            7           2604    24692    interacciones id_interacción    DEFAULT     �   ALTER TABLE ONLY public.interacciones ALTER COLUMN "id_interacción" SET DEFAULT nextval('public."interacciones_id_interacción_seq"'::regclass);
 N   ALTER TABLE public.interacciones ALTER COLUMN "id_interacción" DROP DEFAULT;
       public          postgres    false    224    223    224            1           2604    24641    libros id_libro    DEFAULT     r   ALTER TABLE ONLY public.libros ALTER COLUMN id_libro SET DEFAULT nextval('public.libros_id_libro_seq'::regclass);
 >   ALTER TABLE public.libros ALTER COLUMN id_libro DROP DEFAULT;
       public          postgres    false    217    218    218            5           2604    24672 !   recomendaciones id_recomendación    DEFAULT     �   ALTER TABLE ONLY public.recomendaciones ALTER COLUMN "id_recomendación" SET DEFAULT nextval('public."recomendaciones_id_recomendación_seq"'::regclass);
 R   ALTER TABLE public.recomendaciones ALTER COLUMN "id_recomendación" DROP DEFAULT;
       public          postgres    false    222    221    222            .           2604    24630    usuarios id_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    24648    calificaciones 
   TABLE DATA           �   COPY public.calificaciones ("id_calificación", id_usuario, id_libro, "puntuación", comentario, "fecha_calificación") FROM stdin;
    public          postgres    false    220   =       �          0    24689    interacciones 
   TABLE DATA           {   COPY public.interacciones ("id_interacción", id_usuario, id_libro, "tipo_interacción", "fecha_interacción") FROM stdin;
    public          postgres    false    224   <=       �          0    24638    libros 
   TABLE DATA           �   COPY public.libros (id_libro, "título", autor, "género", "año_publicación", "descripción", "puntuación_promedio") FROM stdin;
    public          postgres    false    218   Y=       �          0    24669    recomendaciones 
   TABLE DATA           �   COPY public.recomendaciones ("id_recomendación", id_usuario, id_libro, "razón_recomendación", "fecha_recomendación") FROM stdin;
    public          postgres    false    222   v=       �          0    24627    usuarios 
   TABLE DATA           z   COPY public.usuarios (id_usuario, nombre_usuario, "correo_electrónico", fecha_registro, "Última_actividad") FROM stdin;
    public          postgres    false    216   �=       �           0    0 #   calificaciones_id_calificación_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."calificaciones_id_calificación_seq"', 1, false);
          public          postgres    false    219            �           0    0 !   interacciones_id_interacción_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."interacciones_id_interacción_seq"', 1, false);
          public          postgres    false    223            �           0    0    libros_id_libro_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.libros_id_libro_seq', 1, false);
          public          postgres    false    217            �           0    0 %   recomendaciones_id_recomendación_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."recomendaciones_id_recomendación_seq"', 1, false);
          public          postgres    false    221            �           0    0    usuarios_id_usuario_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, false);
          public          postgres    false    215            A           2606    24657 "   calificaciones calificaciones_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY ("id_calificación");
 L   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_pkey;
       public            postgres    false    220            E           2606    24695     interacciones interacciones_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.interacciones
    ADD CONSTRAINT interacciones_pkey PRIMARY KEY ("id_interacción");
 J   ALTER TABLE ONLY public.interacciones DROP CONSTRAINT interacciones_pkey;
       public            postgres    false    224            ?           2606    24646    libros libros_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id_libro);
 <   ALTER TABLE ONLY public.libros DROP CONSTRAINT libros_pkey;
       public            postgres    false    218            C           2606    24677 $   recomendaciones recomendaciones_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_pkey PRIMARY KEY ("id_recomendación");
 N   ALTER TABLE ONLY public.recomendaciones DROP CONSTRAINT recomendaciones_pkey;
       public            postgres    false    222            ;           2606    24636 )   usuarios usuarios_correo_electrónico_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT "usuarios_correo_electrónico_key" UNIQUE ("correo_electrónico");
 U   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT "usuarios_correo_electrónico_key";
       public            postgres    false    216            =           2606    24634    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    216            F           2606    24663 +   calificaciones calificaciones_id_libro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_id_libro_fkey FOREIGN KEY (id_libro) REFERENCES public.libros(id_libro) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_id_libro_fkey;
       public          postgres    false    4671    218    220            G           2606    24658 -   calificaciones calificaciones_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_id_usuario_fkey;
       public          postgres    false    220    4669    216            J           2606    24701 )   interacciones interacciones_id_libro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.interacciones
    ADD CONSTRAINT interacciones_id_libro_fkey FOREIGN KEY (id_libro) REFERENCES public.libros(id_libro) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.interacciones DROP CONSTRAINT interacciones_id_libro_fkey;
       public          postgres    false    4671    218    224            K           2606    24696 +   interacciones interacciones_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.interacciones
    ADD CONSTRAINT interacciones_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.interacciones DROP CONSTRAINT interacciones_id_usuario_fkey;
       public          postgres    false    4669    216    224            H           2606    24683 -   recomendaciones recomendaciones_id_libro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_id_libro_fkey FOREIGN KEY (id_libro) REFERENCES public.libros(id_libro) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.recomendaciones DROP CONSTRAINT recomendaciones_id_libro_fkey;
       public          postgres    false    218    222    4671            I           2606    24678 /   recomendaciones recomendaciones_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.recomendaciones DROP CONSTRAINT recomendaciones_id_usuario_fkey;
       public          postgres    false    4669    216    222            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     