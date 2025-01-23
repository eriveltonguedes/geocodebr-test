# install.packages("pak")
# pak::pak("ipeaGIT/geocodebr")


pkgbuild::check_build_tools(debug = TRUE)

# 10.1.2.69

# remotes::install_github("ipeaGIT/geocodebr")


library(readr)
library(geocodebr)
enderecos <- read_csv("enderecos.csv")
# View(enderecos)


listar_campos(
  logradouro = "logradouro",
  numero = "numero",
  cep = "cep",
  localidade = "localidade",
  municipio = "municipio", 
  estado = "estado"
)


output <- geocode(
  enderecos,
  campos_endereco = listar_campos( logradouro = "logradouro",
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


