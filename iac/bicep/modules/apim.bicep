param location string
param apimpublisherName string
param apimpublisherEmail string
param apimName string

resource apim 'Microsoft.ApiManagement/service@2021-08-01' = {
  location: location
  name: apimName  
  properties: {
    publisherName: apimpublisherName
    publisherEmail: apimpublisherEmail
  }
  sku: {
    name: 'Consumption'
    capacity: 0
  }
}

resource apimSAPapi 'Microsoft.ApiManagement/service/tags@2021-08-01' = {
  parent: apim
  name: 'SAP'
  properties: {
    // workaround: https://www.kenmuse.com/blog/fixing-apim-tags-name-should-not-be-empty/
    #disable-next-line BCP073
    displayName: 'SAP'
  }
}

resource apimDiscountedProductapi 'Microsoft.ApiManagement/service/tags@2021-08-01' = {
  parent: apim
  name: 'DiscountedProduct'
  properties: {
    // workaround: https://www.kenmuse.com/blog/fixing-apim-tags-name-should-not-be-empty/
    #disable-next-line BCP073
    displayName: 'DiscountedProduct'
  }
}

resource apimMDMapi 'Microsoft.ApiManagement/service/tags@2021-08-01' = {
  parent: apim
  name: 'MDM'
  properties: {
    // workaround: https://www.kenmuse.com/blog/fixing-apim-tags-name-should-not-be-empty/
    #disable-next-line BCP073
    displayName: 'MDM'
  }
}

resource apimOverwriteBusinessLogicapi 'Microsoft.ApiManagement/service/tags@2021-08-01' = {
  parent: apim
  name: 'OverwriteBusinessLogic'
  properties: {
    // workaround: https://www.kenmuse.com/blog/fixing-apim-tags-name-should-not-be-empty/
    #disable-next-line BCP073
    displayName: 'OverwriteBusinessLogic'
  }
}

resource apimProductapi 'Microsoft.ApiManagement/service/tags@2021-08-01' = {
  parent: apim
  name: 'Product'
  properties: {
    // workaround: https://www.kenmuse.com/blog/fixing-apim-tags-name-should-not-be-empty/
    #disable-next-line BCP073
    displayName: 'Product'
  }
}

resource apimStoreapi 'Microsoft.ApiManagement/service/tags@2021-08-01' = {
  parent: apim
  name: 'Store'
  properties: {
    // workaround: https://www.kenmuse.com/blog/fixing-apim-tags-name-should-not-be-empty/
    #disable-next-line BCP073
    displayName: 'Store'
  }
}


resource apimStoreCalendartapi 'Microsoft.ApiManagement/service/tags@2021-08-01' = {
  parent: apim
  name: 'StoreCalendar'
  properties: {
    // workaround: https://www.kenmuse.com/blog/fixing-apim-tags-name-should-not-be-empty/
    #disable-next-line BCP073
    displayName: 'StoreCalendar'
  }
}
