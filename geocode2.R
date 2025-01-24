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