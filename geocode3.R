library(conflicted)
library(geocodebr)
library(enderecobr)
library(readr)

enderecos <- read_csv("enderecos.csv")
# View(enderecos)

campos <- definir_campos(
  estado = "estado",
  municipio = "municipio",
  logradouro = "logradouro",
  numero = "numero",
  cep = "cep",
  localidade = "localidade"
)


# ends <- read.csv(system.file("extdata/small_sample.csv", package = "geocodebr"))
# campos <- definir_campos(
#   estado = "nm_uf",
#   municipio = "nm_municipio",
#   logradouro = "nm_logradouro",
#   numero = "Numero",
#   cep = "Cep",
#   localidade = "Bairro"
# )

start_time = Sys.time()
# Sys.sleep(0.5)
ends_geo <- geocode(enderecos, campos_endereco = campos, verboso = FALSE)
end_time = Sys.time()

head(ends_geo)

end_time - start_time
## Time difference of 0.5061 secs

library(arrow)

geo_parquet = 'C:\\Users\\r1439546\\Documents\\git\\semobdf\\bos_geocode.parquet'

# arrow::open_dataset((sources = geo_parquet)$schema)

# colnames(read_parquet('C:\\Users\\r1439546\\Documents\\git\\semobdf\\bos_geocode.parquet', as_data_frame = FALSE))

dados <-read_parquet('C:\\Users\\r1439546\\Documents\\git\\semobdf\\bos_geocode.parquet', col_select = c("USER_seq" , "USER_ED_OCORRENCIA" , "USER_ED_NUMERO_OCORRENCIA" , "USER_ED_COMPLEMENTO_OCORRENCIA" , "USER_ED_CEP_OCORRENCIA" , "USER_ED_BAIRRO_OCORRENCIA", "USER_ED_LATITUDE_OCORRENCIA" , "USER_ED_LONGITUDE_OCORRENCIA" , "USER_DS_PTO_REF_OCORRENCIA" , "USER_DS_LOCAL_OCORRENCIA" , "USER_CO_PAIS" , "USER_CO_MUNICIPIO" , "USER_SG_UF" , "USER_NO_PROVINCIA_MUNICIPIO" , "USER_name_muni", "X", "Y"))
#select * from read_parquet('C:\Users\r1439546\Documents\git\semobdf\bos_geocode.parquet') LIMIT 10


#  "USER_seq" , "USER_ED_OCORRENCIA" , "USER_ED_NUMERO_OCORRENCIA" , "USER_ED_COMPLEMENTO_OCORRENCIA" , "USER_ED_CEP_OCORRENCIA" , "USER_ED_BAIRRO_OCORRENCIA", "USER_ED_LATITUDE_OCORRENCIA" , "USER_ED_LONGITUDE_OCORRENCIA" , "USER_DS_PTO_REF_OCORRENCIA" , "USER_DS_LOCAL_OCORRENCIA" , "USER_CO_PAIS" , "USER_CO_MUNICIPIO" , "USER_SG_UF" , "USER_NO_PROVINCIA_MUNICIPIO" , "USER_name_muni", "X", "Y"


