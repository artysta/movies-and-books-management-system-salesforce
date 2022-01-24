public class MBMS_Utilities {
    public static String getObjectAPIName(Id recordId) {          
        Schema.sObjectType entityType = recordId.getSObjectType();
        
        String entityName = String.valueOf(entityType);
        
        if (!entityName.contains(MBMS_Constants.MBMS_NAMESPACE_PREFIX) && !entityName.contains(MBMS_Constants.MBMS_CUSTOM_OBJECT_SUFFIX)) {
            return entityName;
        }
        
        entityName = entityName.remove(MBMS_Constants.MBMS_NAMESPACE_PREFIX);
        entityName = entityName.remove(MBMS_Constants.MBMS_CUSTOM_OBJECT_SUFFIX);
        
        if (entityName.contains('_')) {
            entityName = entityName.replace('_', ' ');
        }
        
        return entityName;
    }
}