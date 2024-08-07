# Dockerfile para configuração do TurtleBot3 com Gazebo no ROS2 Humble

# Usando a imagem base do ROS2 Humble
FROM ros:humble-ros-base

# Instalando pacotes necessários
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ros-humble-desktop=0.10.0-1* \
    ros-humble-tf-transformations \
    ros-humble-compressed-image-transport \
    ros-humble-dynamixel-* \
    ros-humble-gazebo-* \
    ros-humble-action-msgs \
    ros-humble-ament-cmake \
    python3-colcon-common-extensions \
    git \
    git-lfs \
    && rm -rf /var/lib/apt/lists/* \
    && git lfs install

# Configurando o ambiente ROS2
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc

# Copiando o script de entrada
COPY --chmod=755 ros_entrypoint.sh /app/ros_entrypoint.sh

# Criando a Workspace
RUN mkdir -p /turtlebot3_ws/src

# Clonando os repositórios
RUN cd /turtlebot3_ws/src \
    && git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git \
    && cd turtlebot3_simulations \
    && git checkout humble-devel \
    && cd /turtlebot3_ws/src \
    && git clone https://github.com/ROBOTIS-GIT/turtlebot3.git \
    && cd turtlebot3 \
    && git checkout humble-devel \
    && cd /turtlebot3_ws/src \
    && git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git \
    && cd turtlebot3_msgs \
    && git checkout humble-devel \
    && cd /turtlebot3_ws/src \
    && git clone https://github.com/ricardoGrando/turtlebot3_control_ros2.git

# Configurando o ambiente da workspace
RUN /bin/bash -c "source /opt/ros/humble/setup.bash; cd /turtlebot3_ws; colcon build --symlink-install"

# Definindo o entrypoint
ENTRYPOINT ["/app/ros_entrypoint.sh"]

# Define o diretório de trabalho
WORKDIR /turtlebot3_ws

# Comando padrão (para manter o contêiner em execução, útil para depuração_
CMD ["tail", "-f", "/dev/null"] 
