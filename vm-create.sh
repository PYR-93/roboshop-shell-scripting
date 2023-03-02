
echo " Create the VM's via CLI "

catalogue user cart payment shipping 
user cart payment shipping frontend mongodb redis mysql rabbitmq dispatch

for component in vmimage ; do
az vm create --resource-group azure-training-2023 --name $component --image OpenLogic:CentOS-LVM:8-lvm-gen2:8.5.2022101401 --vnet-name azure-training-2023-vnet --subnet default  --admin-username centos --admin-password DevOps654321 --public-ip-address "" --size Standard_B1s --nsg "" 
az vm auto-shutdown -g azure-training-2023 -n  $component --time 1230  
done


resourceGroup=azure-training-2023
gallery=computegallery
az sig image-definition list --resource-group $resourceGroup --gallery-name $gallery --query "[].[name, id]" --output tsv
/subscriptions/d8391944-774c-41db-95d3-6797158258bc/resourceGroups/azure-training-2023/providers/Microsoft.Compute/galleries/computegallery/images/def1
/subscriptions/d8391944-774c-41db-95d3-6797158258bc/resourceGroups/azure-training-2023/providers/Microsoft.Compute/galleries/computegallery/images/def1
        age



imgDef="/subscriptions/d8391944-774c-41db-95d3-6797158258bc/resourceGroups/azure-training-2023/providers/Microsoft.Compute/galleries/computegallery/images/def1/versions/1.0.0"
for component in elasticsearch ; do
az vm create --resource-group azure-training-2023 --name $component  --image $imgDef --vnet-name azure-training-2023-vnet --subnet default  --admin-username centos --admin-password DevOps654321  --storage-sku Standard_LRS  --size Standard_B1ms --nsg ""
az vm auto-shutdown -g azure-training-2023 -n  $component --time 1230  
done

az mysql server create --resource-group azure-training-2023 --name mysql0145 --location canadacentral --admin-user root2 --admin-password RoboShop@1 --sku-name GP_Gen5_2


--data-disk-sizes-gb 32
--storage-sku Standard_LRS


git pull; sed -i -e "s/dummy/XXX/g" inventory ; ansible-playbook  -i inventory -b roboshop-play.yml -e RABBITMQ_PASSWORD=XXXX123 -e ROBOSHOP_MYSQL_PASSWORD=XXX ; sed -i -e "s/XXXX/dummy/g" inventory