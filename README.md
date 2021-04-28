# Dockerizando NodeJS

Esse é um projeto bem simples para aprender a mexer com docker, fazendo o processo de dockerização com uma aplicação bem simples feita em NodeJS, só pra fazer funcionar.

Pra fazer funcionar, basta ter o docker instalado e só. O resto o próprio docker faz sozinho, sem precisar até mesmo do node/npm instalado.

# Comandos Utilizados

Existem duas formas para rodar a aplicação docker que, dependendo da necessidade (como especificar e diferenciar portas de execução da aplicação), podem favorecer os casos para uso.

### 1º - Instância e Execução Automáticos

- Execute `bash sudo docker-compose up -d` para iniciar a instância de uma aplicação do docker de forma local. Caso a aplicação não tenha sido construída ainda, o docker vai, automaticamente, construir a imagem do projeto e assim executar essa e vai deixar online com as configurações definidas. Até então, a aplicação irá executar no endereço `localhost:8080` ou `127.0.0.1:8080`.

- Execute `bash sudo docker-compose down` para parar a instância da imagem que está executando do projeto em questão.

### 2º - Construindo e executando a imagem de forma manual

- Execute `bash sudo docker build . -t <nome_de_usuario>/nodejs-with-docker` para construir a imagem da aplicação docker da pasta do projeto. No lugar de `<nome_de_usuario>`, coloque o seu nome de usuário ou remova junto da barra que há após, deixando somente `nodejs-with-docker`.

- Execute `bash sudo docker images` para visualizar as imagens que foram construídas. A sua saída será parecida com a seguinte:

```bash
REPOSITORY                    TAG          IMAGE ID       CREATED         SIZE
wallrony/nodejs-with-docker   latest       dde8d54adbc0   7 seconds ago   946MB
```

- Vendo a imagem do projeto construída, copie o "REPOSITORY" da imagem do projeto e coloque no seguinte comando: `bash sudo docker run -p <porta espelhada>:<porta da aplicação> -d <REPOSITORY>` (no lugar de `<porta espelhada>` você pode colocar uma porta ao qual vai espelhar a execução da aplicação na `<porta da aplicação>`. Logo, se eu colocar 40000:8080, quero dizer que a execução que acontecer lá na porta 8080 da minha aplicação será espelhada na porta 40000). Com isso, vai aparecer o id do container do docker como retorno do comando, da seguinte maneira:

```bash
$ sudo docker run -p 40000:8080 -d wallrony/nodejs-with-docker
ffc53b1f6d00512311dc56661af5e3d8caf2511a1afc505240a9d230572f0737
```

- O "CONTAINER ID" exibido após executar o comando acima pode também ser representado com seus primeiros 12 caracteres. Com isso, nossa aplicação está executando na porta 40000.

## Visualizar logs da aplicação

- Após executar a aplicação, execute `bash sudo docker ps` para visualizar os containers do docker que estão executando. Sua saída vai ser parecida com a apresentada abaixo:

```bash
CONTAINER ID   IMAGE                         COMMAND                  CREATED         STATUS         PORTS                     NAMES
ffc53b1f6d00   wallrony/nodejs-with-docker   "docker-entrypoint.s…"   8 seconds ago   Up 7 seconds   0.0.0.0:40000->8080/tcp   clever_dhawan
```

- Copie o "CONTAINER ID" e execute o comando `bash sudo docker logs ffc53b1f6d00`. Assim será impresso todo o registro de logs da aplicação até então. Caso queira que o terminal continue vinculado à lista de logs e imprima qualquer novo log em tempo real, é só adicionar a opção `bash -f` no comando. Ele representa a palavra "follow", seguindo a lista de novos registros apontados pela aplicação.
