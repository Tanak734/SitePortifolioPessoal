CREATE TABLE "Projetos" (
                            "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
                            "nome" varchar(255) NOT NULL,
                            "categoria" varchar(100) NOT NULL DEFAULT 'Estudo',
                            "descricao" text NOT NULL,
                            "is_visivel" boolean NOT NULL DEFAULT true,
                            "is_destaque" boolean NOT NULL DEFAULT false,
                            "ordem_exibicao" integer NOT NULL DEFAULT 0,
                            "path_video" varchar(500),
                            "data_inicio" date NOT NULL,
                            "data_fim" date,
                            "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

                            CONSTRAINT "chk_projetos_nome_not_blank"
                                CHECK (char_length(trim("nome")) > 0),
                            CONSTRAINT "chk_projetos_categoria_not_blank"
                                CHECK (char_length(trim("categoria")) > 0),
                            CONSTRAINT "chk_projetos_descricao_not_blank"
                                CHECK (char_length(trim("descricao")) > 0),
                            CONSTRAINT "chk_projetos_ordem_exibicao_non_negative"
                                CHECK ("ordem_exibicao" >= 0),
                            CONSTRAINT "chk_projetos_data_fim_valida"
                                CHECK ("data_fim" IS NULL OR "data_fim" >= "data_inicio")
);

CREATE TABLE "Topicos_projeto" (
                                   "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
                                   "projeto_id" bigint NOT NULL,
                                   "topico_aprendido" varchar(255) NOT NULL,
                                   "ordem_exibicao" integer NOT NULL DEFAULT 0,
                                   "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

                                   CONSTRAINT "chk_topicos_projeto_topico_not_blank"
                                       CHECK (char_length(trim("topico_aprendido")) > 0),
                                   CONSTRAINT "chk_topicos_projeto_ordem_exibicao_non_negative"
                                       CHECK ("ordem_exibicao" >= 0)
);

CREATE TABLE "Imagens_projeto" (
                                   "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
                                   "projeto_id" bigint NOT NULL,
                                   "nome" varchar(255) NOT NULL,
                                   "path" varchar(500) NOT NULL,
                                   "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

                                   CONSTRAINT "chk_imagens_projeto_nome_not_blank"
                                       CHECK (char_length(trim("nome")) > 0),
                                   CONSTRAINT "chk_imagens_projeto_path_not_blank"
                                       CHECK (char_length(trim("path")) > 0)
);

CREATE TABLE "Links_projeto" (
                                 "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
                                 "projeto_id" bigint NOT NULL,
                                 "url" varchar(500) NOT NULL,
                                 "titulo_link" varchar(255) NOT NULL,
                                 "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

                                 CONSTRAINT "chk_links_projeto_url_not_blank"
                                     CHECK (char_length(trim("url")) > 0),
                                 CONSTRAINT "chk_links_projeto_titulo_not_blank"
                                     CHECK (char_length(trim("titulo_link")) > 0)
);

CREATE TABLE "Infos_homepage" (
                                  "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
                                  "nome" varchar(255) NOT NULL,
                                  "resumo_sobre" text NOT NULL,
                                  "cargo_atual" varchar(255) NOT NULL,
                                  "nome_empresa" varchar(255) NOT NULL,
                                  "sobre" text NOT NULL,
                                  "is_disponivel" boolean NOT NULL DEFAULT false,
                                  "local" varchar(255) NOT NULL DEFAULT 'Campinas',
                                  "estado" varchar(100) NOT NULL DEFAULT 'SP',
                                  "pais" varchar(100) NOT NULL DEFAULT 'Brasil',
                                  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

                                  CONSTRAINT "chk_infos_homepage_nome_not_blank"
                                      CHECK (char_length(trim("nome")) > 0),
                                  CONSTRAINT "chk_infos_homepage_resumo_sobre_not_blank"
                                      CHECK (char_length(trim("resumo_sobre")) > 0),
                                  CONSTRAINT "chk_infos_homepage_cargo_atual_not_blank"
                                      CHECK (char_length(trim("cargo_atual")) > 0),
                                  CONSTRAINT "chk_infos_homepage_nome_empresa_not_blank"
                                      CHECK (char_length(trim("nome_empresa")) > 0),
                                  CONSTRAINT "chk_infos_homepage_sobre_not_blank"
                                      CHECK (char_length(trim("sobre")) > 0),
                                  CONSTRAINT "chk_infos_homepage_local_not_blank"
                                      CHECK (char_length(trim("local")) > 0),
                                  CONSTRAINT "chk_infos_homepage_estado_not_blank"
                                      CHECK (char_length(trim("estado")) > 0),
                                  CONSTRAINT "chk_infos_homepage_pais_not_blank"
                                      CHECK (char_length(trim("pais")) > 0)
);

CREATE TABLE "Redes_sociais" (
                                 "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
                                 "info_id" bigint NOT NULL,
                                 "nome" varchar(255) NOT NULL,
                                 "link" varchar(500) NOT NULL,
                                 "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

                                 CONSTRAINT "chk_redes_sociais_nome_not_blank"
                                     CHECK (char_length(trim("nome")) > 0),
                                 CONSTRAINT "chk_redes_sociais_link_not_blank"
                                     CHECK (char_length(trim("link")) > 0)
);

CREATE TABLE "Exp_profissionais" (
                                     "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
                                     "empresa" varchar(255) NOT NULL,
                                     "cargo" varchar(255) NOT NULL,
                                     "modelo_trabalho" varchar(100) NOT NULL DEFAULT 'hibrido',
                                     "descricao" text NOT NULL,
                                     "data_inicio" date NOT NULL,
                                     "data_fim" date,
                                     "cidade" varchar(255),
                                     "estado" varchar(100),
                                     "pais" varchar(100),
                                     "is_trabalho_atual" boolean NOT NULL DEFAULT false,
                                     "ordem_exibicao" integer NOT NULL DEFAULT 0,
                                     "is_visivel" boolean NOT NULL DEFAULT true,
                                     "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                     "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

                                     CONSTRAINT "chk_exp_profissionais_empresa_not_blank"
                                         CHECK (char_length(trim("empresa")) > 0),
                                     CONSTRAINT "chk_exp_profissionais_cargo_not_blank"
                                         CHECK (char_length(trim("cargo")) > 0),
                                     CONSTRAINT "chk_exp_profissionais_modelo_trabalho_not_blank"
                                         CHECK (char_length(trim("modelo_trabalho")) > 0),
                                     CONSTRAINT "chk_exp_profissionais_descricao_not_blank"
                                         CHECK (char_length(trim("descricao")) > 0),
                                     CONSTRAINT "chk_exp_profissionais_ordem_exibicao_non_negative"
                                         CHECK ("ordem_exibicao" >= 0),
                                     CONSTRAINT "chk_exp_profissionais_data_fim_valida"
                                         CHECK ("data_fim" IS NULL OR "data_fim" >= "data_inicio")
);

CREATE TABLE "Topicos_exp" (
                               "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
                               "exp_id" bigint NOT NULL,
                               "topico" varchar(255) NOT NULL,
                               "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

                               CONSTRAINT "chk_topicos_exp_topico_not_blank"
                                   CHECK (char_length(trim("topico")) > 0)
);

CREATE TABLE "Ferramentas_categoria" (
                                         "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
                                         "nome" varchar(255) NOT NULL,
                                         "slug" varchar(255) NOT NULL UNIQUE,
                                         "is_ativo" boolean NOT NULL DEFAULT true,
                                         "ordem_exibicao" integer NOT NULL DEFAULT 0,
                                         "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                         "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

                                         CONSTRAINT "chk_ferramentas_categoria_nome_not_blank"
                                             CHECK (char_length(trim("nome")) > 0),
                                         CONSTRAINT "chk_ferramentas_categoria_slug_not_blank"
                                             CHECK (char_length(trim("slug")) > 0),
                                         CONSTRAINT "chk_ferramentas_categoria_ordem_exibicao_non_negative"
                                             CHECK ("ordem_exibicao" >= 0)
);

CREATE TABLE "Ferramentas" (
                               "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
                               "categoria_id" bigint NOT NULL,
                               "nome" varchar(255) NOT NULL,
                               "slug" varchar(255) NOT NULL UNIQUE,
                               "is_destaque" boolean NOT NULL DEFAULT false,
                               "is_ativo" boolean NOT NULL DEFAULT true,
                               "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

                               CONSTRAINT "chk_ferramentas_nome_not_blank"
                                   CHECK (char_length(trim("nome")) > 0),
                               CONSTRAINT "chk_ferramentas_slug_not_blank"
                                   CHECK (char_length(trim("slug")) > 0)
);

CREATE TABLE "Contatos" (
                            "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
                            "nome" varchar(255) NOT NULL,
                            "email" varchar(255) NOT NULL,
                            "assunto_email" varchar(255) NOT NULL,
                            "mensagem" text NOT NULL,
                            "origem_achado" varchar(100),
                            "send_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

                            CONSTRAINT "chk_contatos_nome_not_blank"
                                CHECK (char_length(trim("nome")) > 0),
                            CONSTRAINT "chk_contatos_email_not_blank"
                                CHECK (char_length(trim("email")) > 0),
                            CONSTRAINT "chk_contatos_email_formato"
                                CHECK ("email" ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    CONSTRAINT "chk_contatos_assunto_email_not_blank"
        CHECK (char_length(trim("assunto_email")) > 0),
    CONSTRAINT "chk_contatos_mensagem_not_blank"
        CHECK (char_length(trim("mensagem")) > 0),
    CONSTRAINT "chk_contatos_origem_achado_not_blank"
        CHECK ("origem_achado" IS NULL OR char_length(trim("origem_achado")) > 0)
);

CREATE TABLE "Leads" (
                         "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
                         "contato_id" bigint NOT NULL,
                         "status_contato" varchar(100) NOT NULL DEFAULT 'novo',
                         "etapa" varchar(100) NOT NULL DEFAULT 'inicial',
                         "tipo_servico" varchar(100) NOT NULL DEFAULT 'a definir',
                         "dificuldade_projeto" varchar(100),
                         "is_cliente_potencial" boolean NOT NULL DEFAULT true,
                         "prioridade" varchar(100),
                         "proxima_contato_on" date,
                         "ultimo_contato_on" date,
                         "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

                         CONSTRAINT "chk_leads_status_contato_not_blank"
                             CHECK (char_length(trim("status_contato")) > 0),
                         CONSTRAINT "chk_leads_etapa_not_blank"
                             CHECK (char_length(trim("etapa")) > 0),
                         CONSTRAINT "chk_leads_tipo_servico_not_blank"
                             CHECK (char_length(trim("tipo_servico")) > 0),
                         CONSTRAINT "chk_leads_dificuldade_projeto_not_blank"
                             CHECK ("dificuldade_projeto" IS NULL OR char_length(trim("dificuldade_projeto")) > 0),
                         CONSTRAINT "chk_leads_prioridade_not_blank"
                             CHECK ("prioridade" IS NULL OR char_length(trim("prioridade")) > 0)
);

ALTER TABLE "Ferramentas"
    ADD CONSTRAINT "fk_Ferramenta_id_categoria_Ferramentas_categoria"
        FOREIGN KEY ("categoria_id")
            REFERENCES "Ferramentas_categoria" ("id")
            ON DELETE RESTRICT
            ON UPDATE NO ACTION;

ALTER TABLE "Imagens_projeto"
    ADD CONSTRAINT "fk_Imagens_projeto_id_projeto_Projetos"
        FOREIGN KEY ("projeto_id")
            REFERENCES "Projetos" ("id")
            ON DELETE CASCADE
            ON UPDATE NO ACTION;

ALTER TABLE "Topicos_projeto"
    ADD CONSTRAINT "fk_Topicos_projeto_id_projeto_Projetos"
        FOREIGN KEY ("projeto_id")
            REFERENCES "Projetos" ("id")
            ON DELETE CASCADE
            ON UPDATE NO ACTION;

ALTER TABLE "Links_projeto"
    ADD CONSTRAINT "fk_Links_projeto_id_projeto_Projetos"
        FOREIGN KEY ("projeto_id")
            REFERENCES "Projetos" ("id")
            ON DELETE CASCADE
            ON UPDATE NO ACTION;

ALTER TABLE "Redes_sociais"
    ADD CONSTRAINT "fk_Redes_sociais_info_id_Infos_homepage"
        FOREIGN KEY ("info_id")
            REFERENCES "Infos_homepage" ("id")
            ON DELETE RESTRICT
            ON UPDATE NO ACTION;

ALTER TABLE "Topicos_exp"
    ADD CONSTRAINT "fk_Topicos_exp_exp_id_Exp_profissionais"
        FOREIGN KEY ("exp_id")
            REFERENCES "Exp_profissionais" ("id")
            ON DELETE CASCADE
            ON UPDATE NO ACTION;

ALTER TABLE "Leads"
    ADD CONSTRAINT "fk_Clientes_contato_id_Contatos"
        FOREIGN KEY ("contato_id")
            REFERENCES "Contatos" ("id")
            ON DELETE CASCADE
            ON UPDATE NO ACTION;