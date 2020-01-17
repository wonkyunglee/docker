nvidia-docker run -itd -v /home/wonkyunglee/wonkyunglee/:/data/ -p 8888:8888 \
    -e "PASSWORD=$PASSWORD" -w /data/ \
    --name wonkyunglee_notebook \
    wonkyunglee/pytorch:pytorch_v1.1 \
    jupyter notebook \
    --NotebookApp.password=sha1:e8c21621ebe5:7d457b354034529102e46e4413c6b64186191541 \
    --ip="0.0.0.0" --port="8888" --no-browser --allow-root
