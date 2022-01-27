library(openapi)

user <- 'admin@opensilex.org'
password <- 'admin'
host <- 'http://138.102.159.37:8081/rest'

authenticate <- function(host, user, password) {
  apiClient <- openapi::ApiClient$new(username = user, password = password, basePath = host)
  var.body <- AuthenticationDTO$new(identifier = user, password = password, basePath = host) # AuthenticationDTO | User authentication informations
  #Authenticate a user and return an access token
  api.instance <- AuthenticationApi$new(apiClient)
  var.body <- AuthenticationDTO$new() 
  result <- api.instance$Authenticate(var.body)
  # result <- api.instance$Authenticate(body=var.body)
  # authenticateApi$Authenticate()
  dataApi <- openapi::DataApi$new()
  print("dataApi")
  print(dataApi)
  resultData <- dataApi$SearchDataList(page = 1, experiment = list("http://www.opensilex.org/weis/WS2019-2"))
}

connectToOpenSILEX(
  identifier = user,
  password = password,
  url = host
)

print("before creating api")
dataApi <- DataApi$new()
print("dataApi")
print(dataApi)
result <- dataApi$search_data_list()
result <-
  do.call(dataApi$search_data_list, list())