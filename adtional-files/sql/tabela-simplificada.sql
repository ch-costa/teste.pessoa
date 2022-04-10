-- TABLESPACE SOLUS definition
CREATE TABLESPACE ORADOCKER
DATAFILE
'/opt/oracle/oradata/ORADOCKER01.dbf' SIZE 4G AUTOEXTEND ON NEXT 200M MAXSIZE UNLIMITED,
'/opt/oracle/oradata/ORADOCKER02.dbf' SIZE 4G AUTOEXTEND ON NEXT 200M MAXSIZE UNLIMITED
LOGGING
ONLINE
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;
/


CREATE USER oradocker IDENTIFIED BY ora;
/

GRANT CONNECT, RESOURCE, DBA TO oradocker;
/
CREATE TABLE ORADOCKER.tb_last_itegration_processing (
  id integer NOT null,
  integrationType_id INTEGER NOT NULL,
  lastProcessingDate TIMESTAMP,
  specificProcessingDate TIMESTAMP,
  updateDate TIMESTAMP)
/

SELECT *
  FROM ORADOCKER.tb_last_itegration_processing  
/
  
INSERT INTO ORADOCKER.TB_LAST_ITEGRATION_PROCESSING
(ID, INTEGRATIONTYPE_ID, LASTPROCESSINGDATE, SPECIFICPROCESSINGDATE, UPDATEDATE)
VALUES(1, 1, sysdate, '', sysdate);
/

-- SOLUS.HSSPESS Table definition
CREATE TABLE ORADOCKER.HSSPESS
  (
  "NNUMEPESS" NUMBER NOT NULL ENABLE, 
  "NNUMEPROF" NUMBER, 
  "NFILIPESS" NUMBER, 
  "NNUMEATIVI" NUMBER, 
  "CNOMEPESS" VARCHAR2(100) NOT NULL ENABLE, 
  "CFANTPESS" VARCHAR2(80), 
  "DINCLPESS" TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL ENABLE, 
  "CNMAEPESS" VARCHAR2(80), 
  "CNPAIPESS" VARCHAR2(80), 
  "CCNPJPESS" VARCHAR2(14), 
  "CCPF_PESS" VARCHAR2(11), 
  "CRG__PESS" VARCHAR2(16), 
  "CORRGPESS" VARCHAR2(10), 
  "DEMRGPESS" TIMESTAMP, 
  "CPIS_PESS" VARCHAR2(11), 
  "CINSCPESS" VARCHAR2(14), 
  "CINSMPESS" VARCHAR2(20), 
  "DNASCPESS" TIMESTAMP, 
  "CSEXOPESS" VARCHAR2(1) DEFAULT 'D' NOT NULL ENABLE, 
  "CESTCPESS" VARCHAR2(1), 
  "CGINSPESS" VARCHAR2(2), 
  "DOBITPESS" TIMESTAMP, 
  "CPASSPESS" VARCHAR2(20), 
  "CCEI_PESS" VARCHAR2(14), 
  "NCHADPESS" NUMBER DEFAULT '0' NOT NULL ENABLE, 
  "CSENHPESS" VARCHAR2(40), 
  "CCNS_PESS" VARCHAR2(16), 
  "CCERTPESS" VARCHAR2(15), 
  "NPAISPESS" NUMBER DEFAULT 32, 
  "CCNESPESS" VARCHAR2(10), 
  "CPESSPESS" VARCHAR2(1) DEFAULT 'F' NOT NULL ENABLE, 
  "CDCNVPESS" VARCHAR2(15), 
  "CBENEPESS" VARCHAR2(1) DEFAULT 'N' NOT NULL ENABLE, 
  "CEVENPESS" VARCHAR2(1) DEFAULT 'N' NOT NULL ENABLE, 
  "CPRESPESS" VARCHAR2(1) DEFAULT 'N' NOT NULL ENABLE, 
  "CFORNPESS" VARCHAR2(1) DEFAULT 'N' NOT NULL ENABLE, 
  "CTITUPESS" VARCHAR2(1) DEFAULT 'N' NOT NULL ENABLE, 
  "CVENDPESS" VARCHAR2(1) DEFAULT 'N' NOT NULL ENABLE, 
  "CPROSPESS" VARCHAR2(1) DEFAULT 'N' NOT NULL ENABLE, 
  "COPERPESS" VARCHAR2(1) DEFAULT 'N' NOT NULL ENABLE, 
  "DSENVPESS" TIMESTAMP, 
  "DATUAPESS" TIMESTAMP, 
  "CISENPESS" VARCHAR2(1), 
  "CRACAPESS" VARCHAR2(10), 
  "CCATEPESS" VARCHAR2(10), 
  "CCIDNPESS" VARCHAR2(60), 
  "CESTNPESS" VARCHAR2(2), 
  "NPNASPESS" NUMBER, 
  "CHIGNPESS" VARCHAR2(1), 
  "CRNE_PESS" VARCHAR2(9), 
  "CCAEPPESS" VARCHAR2(14)) SEGMENT CREATION IMMEDIATE 
/

-- Comments
COMMENT ON TABLE SOLUS.HSSPESS IS 'Cadastro unico de pessoa';
COMMENT ON COLUMN SOLUS.HSSPESS.NNUMEPESS IS 'ID DA PESSOA';
COMMENT ON COLUMN SOLUS.HSSPESS.NNUMEPROF IS 'ID da profissao';
COMMENT ON COLUMN SOLUS.HSSPESS.NFILIPESS IS 'ID da Matriz';
COMMENT ON COLUMN SOLUS.HSSPESS.NNUMEATIVI IS 'ID da Atividade principla';
COMMENT ON COLUMN SOLUS.HSSPESS.CNOMEPESS IS 'Nome da pessoa';
COMMENT ON COLUMN SOLUS.HSSPESS.CFANTPESS IS 'Nome Fantasia';
COMMENT ON COLUMN SOLUS.HSSPESS.DINCLPESS IS 'Data de cadastramento';
COMMENT ON COLUMN SOLUS.HSSPESS.CNMAEPESS IS 'Nome da mae';
COMMENT ON COLUMN SOLUS.HSSPESS.CNPAIPESS IS 'Nome do pai';
COMMENT ON COLUMN SOLUS.HSSPESS.CCNPJPESS IS 'Numero CNPJ';
COMMENT ON COLUMN SOLUS.HSSPESS.CCPF_PESS IS 'Numero CPF';
COMMENT ON COLUMN SOLUS.HSSPESS.CRG__PESS IS 'RG';
COMMENT ON COLUMN SOLUS.HSSPESS.CORRGPESS IS 'Orgao emissor do RG';
COMMENT ON COLUMN SOLUS.HSSPESS.DEMRGPESS IS 'Data de expedicao do RG';
COMMENT ON COLUMN SOLUS.HSSPESS.CPIS_PESS IS 'Numero do PIS';
COMMENT ON COLUMN SOLUS.HSSPESS.CINSCPESS IS 'Inscricao Estadual';
COMMENT ON COLUMN SOLUS.HSSPESS.CINSMPESS IS 'Inscricao Municipal';
COMMENT ON COLUMN SOLUS.HSSPESS.DNASCPESS IS 'Data de nascimento';
COMMENT ON COLUMN SOLUS.HSSPESS.CSEXOPESS IS 'Sexo (F/M)';
COMMENT ON COLUMN SOLUS.HSSPESS.CESTCPESS IS 'Estado Civil: (S)olteiro | (C)asado | (V)iuvo | (D)ivorciado | (U)niao estavel | Sep(A)rado | (O)utros';
COMMENT ON COLUMN SOLUS.HSSPESS.CGINSPESS IS 'Grau de instrução: 0 - Não alfabetizado .... 9 - Doutorado';
COMMENT ON COLUMN SOLUS.HSSPESS.DOBITPESS IS 'Data do obito';
COMMENT ON COLUMN SOLUS.HSSPESS.CPASSPESS IS 'Passaporte';
COMMENT ON COLUMN SOLUS.HSSPESS.CCEI_PESS IS 'CEI';
COMMENT ON COLUMN SOLUS.HSSPESS.NCHADPESS IS 'ID de desempate';
COMMENT ON COLUMN SOLUS.HSSPESS.CSENHPESS IS 'Senha';
COMMENT ON COLUMN SOLUS.HSSPESS.CCNS_PESS IS 'Cartao Nacional de Saude';
COMMENT ON COLUMN SOLUS.HSSPESS.CCERTPESS IS 'Certidão de Nascimento';
COMMENT ON COLUMN SOLUS.HSSPESS.NPAISPESS IS 'Pais de emissao';
COMMENT ON COLUMN SOLUS.HSSPESS.CCNESPESS IS 'CNES';
COMMENT ON COLUMN SOLUS.HSSPESS.CPESSPESS IS 'Tipo da pessoa: (F)isica | (J)uridica';
COMMENT ON COLUMN SOLUS.HSSPESS.CDCNVPESS IS 'Declaracao de nascido vivo';
COMMENT ON COLUMN SOLUS.HSSPESS.CBENEPESS IS 'Indica se o registro de Pessoa é BENEFICIARIO';
COMMENT ON COLUMN SOLUS.HSSPESS.CEVENPESS IS 'Indica se o registro de Pessoa é USUARIO EVENTUAL';
COMMENT ON COLUMN SOLUS.HSSPESS.CPRESPESS IS 'Indica se o registro de Pessoa é COOPERADO/PRESTADOR';
COMMENT ON COLUMN SOLUS.HSSPESS.CFORNPESS IS 'Indica se o registro de Pessoa é FORNECEDOR';
COMMENT ON COLUMN SOLUS.HSSPESS.CTITUPESS IS 'Indica se o registro de Pessoa é CONTRATANTE';
COMMENT ON COLUMN SOLUS.HSSPESS.CVENDPESS IS 'Indica se o registro de Pessoa é VENDEDOR';
COMMENT ON COLUMN SOLUS.HSSPESS.CPROSPESS IS 'Indica se o registro de Pessoa é PROSPECT';
COMMENT ON COLUMN SOLUS.HSSPESS.COPERPESS IS 'Indica se o registro de Pessoa é SECRETARIA OU OPERADOR DO SISTEMA';
COMMENT ON COLUMN SOLUS.HSSPESS.DSENVPESS IS 'Data da ultima atualização da senha';
COMMENT ON COLUMN SOLUS.HSSPESS.DATUAPESS IS 'Data da ultima atualização cadastral';
COMMENT ON COLUMN SOLUS.HSSPESS.CISENPESS IS 'Pessoa é isenta de Inscrição Estadual?';
COMMENT ON COLUMN SOLUS.HSSPESS.CRACAPESS IS 'eSocial - Raça da pessoa';
COMMENT ON COLUMN SOLUS.HSSPESS.CCATEPESS IS 'eSocial - Categoria funcional';
COMMENT ON COLUMN SOLUS.HSSPESS.CCIDNPESS IS 'eSocial - Cidade de Naturalidade';
COMMENT ON COLUMN SOLUS.HSSPESS.CESTNPESS IS 'eSocial - Estado da Naturalidade';
COMMENT ON COLUMN SOLUS.HSSPESS.NPNASPESS IS 'eSocial - Nacionalidade';
COMMENT ON COLUMN SOLUS.HSSPESS.CHIGNPESS IS 'Higienizado Sim(S)/Não(N)';
COMMENT ON COLUMN SOLUS.HSSPESS.CRNE_PESS IS 'Número do registro nacional de estrangeiros';
COMMENT ON COLUMN SOLUS.HSSPESS.CFOTOPESS IS 'Foto da pessoa';
COMMENT ON COLUMN SOLUS.HSSPESS.CCAEPPESS IS 'CAEPF - Cadastro de Atividade Econômica da Pessoa Física';


-- INSERT ORADOCKER.HSSPESS
INSERT INTO ORADOCKER.HSSPESS
(NNUMEPESS, NNUMEPROF, NFILIPESS, NNUMEATIVI, CNOMEPESS, CFANTPESS, DINCLPESS, CNMAEPESS, CNPAIPESS, CCNPJPESS, CCPF_PESS, CRG__PESS, CORRGPESS, DEMRGPESS, CPIS_PESS, CINSCPESS, CINSMPESS, DNASCPESS, CSEXOPESS, CESTCPESS, CGINSPESS, DOBITPESS, CPASSPESS, CCEI_PESS, NCHADPESS, CSENHPESS, CCNS_PESS, CCERTPESS, NPAISPESS, CCNESPESS, CPESSPESS, CDCNVPESS, CBENEPESS, CEVENPESS, CPRESPESS, CFORNPESS, CTITUPESS, CVENDPESS, CPROSPESS, COPERPESS, DSENVPESS, DATUAPESS, CISENPESS, CRACAPESS, CCATEPESS, CCIDNPESS, CESTNPESS, NPNASPESS, CHIGNPESS, CRNE_PESS, CCAEPPESS)
VALUES(1  , 123      , 1     , 111111, 'CHICO JOSE', 'CHICO ZE', sysdate , 'MAE'    , 'PAI'   , '', '11111111111', sysdate, 'SSP', '2002-01-01', '', '', '', '', 'D' , '', '', '', '', '', '0' , '', '', '', 32, '', 'F' , '', 'N' , 'N' , 'N' , 'N' , 'N' , 'N' , 'N' , 'N' , sysdate, sysdate, '', '', '', '', '', 0, '', '', '');
