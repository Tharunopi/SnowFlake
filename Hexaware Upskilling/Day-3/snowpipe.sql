CREATE OR REPLACE STORAGE INTEGRATION azure_storage
    TYPE = 'EXTERNAL_STAGE'
    ENABLED = TRUE
    STORAGE_PROVIDER = 'AZURE'
    AZURE_TENANT_ID = '7540734b-e567-46c3-9ad3-ec9fb9e50140'
    STORAGE_ALLOWED_LOCATIONS = ('azure://unicron.blob.core.windows.net/simplecontainer/Employee/');

DESC STORAGE INTEGRATION azure_storage;