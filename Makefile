
default: pack

pack:
	docker container run -it --rm \
		   --env AWS_PROFILE="labs" \
		   -v $$PWD/creds:/root/.aws \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   -v $$PWD:/$$(basename $$PWD) \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)" \
		   -w /$$(basename $$PWD) \
		   --entrypoint="/usr/local/bin/packer" \
		   bryandollery/terraform-packer-aws-alpine build packer.json


