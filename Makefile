build:
	docker build -t daindragon2/traceroute .

push:
	docker push daindragon2/traceroute

test: 
	docker run --rm --name traceroute --network=host daindragon2/traceroute -S -p 80 google.com

bash:
	docker run --entrypoint /bin/bash -it --rm --name traceroute daindragon2/traceroute 
