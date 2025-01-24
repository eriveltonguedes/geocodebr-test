# install.packages("pak")
# pak::pak("ipeaGIT/geocodebr")

# pkgbuild::check_build_tools(debug = TRUE)

# remotes::install_github("ipeaGIT/geocodebr")


library(readr)
library(geocodebr)
enderecos <- read_csv("enderecos.csv")
# View(enderecos)


definir_campos(
  logradouro = "logradouro",
  numero = "numero",
  cep = "cep",
  localidade = "localidade",
  municipio = "municipio", 
  estado = "estado"
)


campos <- definir_campos(logradouro = "logradouro",
                         numero = "numero",
                         cep = "cep",
                         localidade = "localidade",
                         municipio = "municipio",
                         estado = "estado")


ends_geo <- geocode(enderecos, campos_endereco = campos, verboso = FALSE)

output <- geocode(
  enderecos,
  campos_endereco = definir_campos( logradouro = "logradouro",
                                    numero = "numero",
                                    cep = "cep",
                                    localidade = "localidade",
                                    municipio = "municipio",
                                    estado = "estado"),
  resultado_completo = FALSE,
  verboso = TRUE,
  cache = TRUE,
  n_cores = 1
)

#ends <- read.csv(system.file("extdata/small_sample.csv", package = "geocodebr"))
#write.csv(ends, 'ends.csv')
write.csv(output, 'ends_geo.csv')



