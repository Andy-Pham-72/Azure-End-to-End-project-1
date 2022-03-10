# copy files to container
azcopy cp "/Azure-End-to-End-project-1/data/json/2020-08-05/NASDAQ/*" "https://[storage name].blob.core.windows.net/[container name]/data/json/2020-08-05/NASDAQ?[SAS TOKEN]"
azcopy cp "/Azure-End-to-End-project-1/data/json/2020-08-06/NASDAQ/*" "https://[storage name].blob.core.windows.net/[container name]/data/json/2020-08-06/NASDAQ?[SAS TOKEN]"

azcopy cp "/Azure-End-to-End-project-1/data/csv/2020-08-05/NYSE/*" "https://[storage name].blob.core.windows.net/[container name]/data/csv/2020-08-05/NYSE?[SAS TOKEN]"
azcopy cp "/Azure-End-to-End-project-1/data/csv/2020-08-06/NYSE/*" "https://[storage name].blob.core.windows.net/[container name]/data/csv/2020-08-06/NYSE?[SAS TOKEN]"