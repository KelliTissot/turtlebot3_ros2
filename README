# Turtlebot3 utilizando ROS2 Humble e Gazebo
Este guia fornece instruções para criar e executar um contêiner Docker que executa o TurtleBot3 com o Gazebo. Se houver erros ao abrir o Gazebo (por exemplo, "Error: Can't open display"), siga as instruções adicionais fornecidas.

## Pré-requisitos

- Docker
- Docker Compose

## Passos para Configuração e Execução

### 1. Configurar Acesso ao Display (se necessário)

Se encontrar erros ao abrir o Gazebo, execute os seguintes comandos na sua máquina:

```sh
xhost +Local:*
xhost 
```

### 2. Construir e Executar o Contêiner
Para construir e iniciar o contêiner, use o Docker Compose:
```sh
docker compose up --build 
```

### 3. Entrar no Contêiner
Após iniciar o contêiner, entre no contêiner usando o seguinte comando:
```sh
docker compose exec -it turtlebot3 bash 
```

### 4. Configurar o Ambiente Dentro do Contêiner
Dentro do contêiner, execute os seguintes comandos para configurar o ambiente:
```sh
source install/setup.bash
source /usr/share/gazebo/setup.bash 
```

### 5. Executar o Ambiente Escolhido
Para rodar o ambiente escolhido com o TurtleBot3, defina o modelo do TurtleBot3 e inicie o lançamento no Gazebo:
```sh 
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_gazebo turtlebot3_dqn_stage4.launch.py
```