context("verificacion")

# Como hago para que el archivo lo busque en testdata, o lo dejo en este wd?
test_that("Finds file .ixplorer", {
  skip("no hay ixplorer")
  working_directory <- rstudioapi::getActiveProject()
  ixplorer_file <- paste0(working_directory, "/.ixplorer")
  file <- verify_ixplorer_file(ixplorer_file)
  expect_true(any(class(file) == "data.frame"))
})

test_that("Detects missing data TOKEN access value", {
  skip("no hay ixplorer")
  file <- readr::read_csv(".ixplorer_api") %>%
    tidyr::separate(col = V1, into = c("object", "value"), sep = " ")
  expect_true(verify_ixtoken(file) == "There is no ixplorer TOKEN, please use the Authentication gadget")
})

test_that("Detects missing data URL access value", {
  skip("no hay ixplorer")
  file <- readr::read_csv(".ixplorer_url") %>%
    tidyr::separate(col = V1, into = c("object", "value"), sep = " ")
  expect_true(verify_ixurl(file) == "There is no ixplorer URL, please use the Authentication gadget")
})

test_that("Detects missing data PROJECT access value", {
  skip("no hay ixplorer")
  file <- readr::read_csv(".ixplorer_project") %>%
    tidyr::separate(col = V1, into = c("object", "value"), sep = " ")
  expect_true(verify_ixproject(file) == "There is no ixplorer PROJECT name, please use the Authentication gadget")
})

test_that("Detects missing data REPOSITORY access value", {
  skip("no hay ixplorer")
  file <- readr::read_csv(".ixplorer_repo") %>%
    tidyr::separate(col = V1, into = c("object", "value"), sep = " ")
  expect_true(verify_ixrepo(file) == "There is no ixplorer REPOSITORY, please use the Authentication gadget")
})

test_that("Detects missing data USER access value", {
  skip("no hay .ixplorer")
  file <- readr::read_csv(".ixplorer_user") %>%
    tidyr::separate(col = V1, into = c("object", "value"), sep = " ")
  expect_true(verify_ixuser(file) == "There is no ixplorer USER, please use the Authentication gadget")
})




# Hay un error o paso para verificar con posiciones de datos
# Si eliminio una linea, la posicion varia y queda mal las condiciones
# dentro de los verify.

# el msj de set_authentication se esta repitiendo. YO habia provocado eso
# adrede porque no hacia un print del msj y tuve que hacerlo explicito
# ahora se esta comportando imprimiendo dos veces.
