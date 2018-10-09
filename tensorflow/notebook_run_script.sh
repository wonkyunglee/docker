# docker run -itd -v /home/wonkyung/wonkyung/:/data/ -p 8888:8888 -e "PASSWORD=$PASSWORD" -w /data/ --name notebook wonkyunglee/tensorflow:1.10.1-gpu-py3 jupyter notebook --allow-root

# docker run -itd -v /home/wonkyung/wonkyung/:/data/ -e "VIRTUAL_HOST=nb.wonkyunglee.io" -e "VIRTUAL_PORT=8888" -e "PASSWORD=$PASSWORD" -w /data/ --name notebook wonkyunglee/tensorflow:1.10.1-gpu-py3 jupyter notebook --allow-root

docker run -itd -v /home/wonkyung/wonkyung/:/data/ --link mongodb:mongo -e "VIRTUAL_HOST=nb.wonkyunglee.io" -e "VIRTUAL_PORT=8888" -e "PASSWORD=$PASSWORD" -w /data/ --name notebook wonkyunglee/tensorflow:1.10.1-gpu-py3 jupyter notebook --allow-root
