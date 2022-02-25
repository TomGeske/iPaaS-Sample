#!/bin/bash

az group create --name bicep-test-rg --location westeurope
az deployment group create --resource-group bicep-test-rg --template-file main.bicep --parameters @main.parameters.json
