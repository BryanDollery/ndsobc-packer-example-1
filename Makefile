OWNER=005508785137
NAME=bryan

default: pack

pack:
	docker container run -it --rm \
		   --env AWS_PROFILE=labs \
		   -v $$PWD/creds:/root/.aws \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   -v $$PWD:/$$(basename $$PWD) \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)" \
		   -w /$$(basename $$PWD) \
		   --entrypoint="/usr/local/bin/packer" \
		   bryandollery/terraform-packer-aws-alpine build -var="owner=$$OWNER" -var="name=$$NAME" packer.pkr.hcl

fmt:
	docker container run -it --rm \
		   -v $$PWD/creds:/root/.aws \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   -v $$PWD:/$$(basename $$PWD) \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)" \
		   -w /$$(basename $$PWD) \
		   --entrypoint="/usr/local/bin/packer" \
		   bryandollery/terraform-packer-aws-alpine fmt -var="owner=$$OWNER" -var="name=$$NAME" packer.pkr.hcl

inspect:
	docker container run -it --rm \
		   -v $$PWD/creds:/root/.aws \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   -v $$PWD:/$$(basename $$PWD) \
		   --hostname "$$(basename $$PWD)" \
		   --name "$$(basename $$PWD)" \
		   -w /$$(basename $$PWD) \
		   --entrypoint="/usr/local/bin/packer" \
		   bryandollery/terraform-packer-aws-alpine inspect -var="owner=$$OWNER" -var="name=$$NAME" packer.pkr.hcl

