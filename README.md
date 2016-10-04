#Description

This module installs , 
* go 1.7
* vault latest
* vault_selinux
* create system user vault
* adjust policies to get vault running confined
* create a systemctl service 
* uses https://github.com/bechampion/vault_selinux 

#Gotchas
* Backends are yet to be configured (running inmem)
* mlock is disabled so inmem info doesn't get swapped on
* It doesn't init / unseal the vault 
* VAULT_ADDR=localhost:5200


#TODO:
* rework variables from default
* modularize everyhting [DONE]
* conditionls on selinux modules (-i takes too long)  [DONE]
* add source code of selinux vault policy so it can be audit2allow
* check why unarchive winges on 2.1
* loop needed on copy files :34
* have the selinux magic in a complete diferent task file
* service in a complete different file
* move all files to j2





