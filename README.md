### Wandelbots

# Usage

        docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git alpine/git clone https://github.com/ssimeth/Wandelbots.git && cd Wandelbots/

        docker build -t ipc-monitor .

        docker run --name ipc-monitor -d -p 8081:80 ipc-monitor

Open http://locahost:8081 (or IP-Address of IPC-Device)
