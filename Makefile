
default: pack

access_key=$$(sed -n 2p creds/credentials | sed 's/.*=//')
secret_key=$$(sed -n 3p creds/credentials | sed 's/.*=//')

pack: stop
	docker container run -it --rm \
		   --env AWS_ACCESS_KEY_ID="${access_key}" \
		   --env AWS_SECRET_ACCESS_KEY="$(secret_key)" \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   -v $$PWD:/$$(basename $$PWD) \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)" \
		   -w /$$(basename $$PWD) \
		   --entrypoint="/usr/local/bin/packer" \
		   bryandollery/terraform-packer-aws-alpine build packer.json


